package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.BoardDTO;
import kh.web.statics.Statics;

public class BoardDAO {
	private static BoardDAO instance = null;

	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	private BoardDAO() {
	}

	// JDNI
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private int getRecordCount() throws Exception {
		String sql = "select count(*) from freeboard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public int getPageTotalCount() throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount();

		// 총 몇개의 페이지가 만들어질까?
		int pageTotalCount = 0;
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	public String getPageNavi(int currentPage) throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount();

		// 총 몇개의 페이지가 만들어질까?
		int pageTotalCount = 0;
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		
		// 현재 클라이언트가 있는 페이지의 위치야
		// int currentPage = 4;

		// 현재 클라이언트가 있는 페이지를 기준으로 시작 번호와 끝 번호를 지정해주는 코드야
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 유지보수
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 이전페이지랑 다음페이지를 나타내줄 화살표 < >
		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if (needPrev) {
			pageNavi += "<a href='/fb_list.board?cpage=" + (startNavi - 1) + "'>< </a>";
		}
		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/fb_list.board?cpage=" + i + "'>" + i + "</a> ";
		}
		if (needNext) {
			pageNavi += "<a href='/fb_list.board?cpage=" + (endNavi + 1) + "'> ></a>";
		}
		return pageNavi;
	}
	
	public List<BoardDTO> selectAll() throws Exception {
		String sql = "select * from freeboard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {

			List<BoardDTO> list = new ArrayList<>();			
			while (rs.next()) {
				BoardDTO board_dto = new BoardDTO();
				
				board_dto.setFb_seq(rs.getInt("fb_seq"));
				board_dto.setFb_mem_id(rs.getString("fb_mem_id"));
				board_dto.setFb_title(rs.getString("fb_title"));
				board_dto.setFb_contents(rs.getString("fb_contents"));
				board_dto.setFb_write_date(rs.getTimestamp("fb_write_date"));
				board_dto.setFb_view_count(rs.getInt("fb_view_count"));
				
				list.add(board_dto);
			}
			return list;
		}
	}
	
	public List<BoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "select * from (select f.*, row_number() over(order by f.fb_seq desc) rn from freeboard f join member m on(f.fb_mem_id=m.mem_id)) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery()) {
				List<BoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					BoardDTO board_dto = new BoardDTO();
					board_dto.setFb_seq(rs.getInt("fb_seq"));
					board_dto.setFb_title(rs.getString("fb_title"));
					board_dto.setFb_contents(rs.getString("fb_contents"));
					board_dto.setFb_mem_id(rs.getString("fb_mem_id"));
					board_dto.setFb_write_date(rs.getTimestamp("fb_write_date"));
					board_dto.setFb_view_count(rs.getInt("fb_view_count"));
					list.add(board_dto);
				}
				return list;
			}
		}
	}
	
	public int addViewCount(int fb_seq) throws Exception {
		String sql = "update freeboard set fb_view_count = fb_view_count+1 where fb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, fb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insert(BoardDTO board_dto) throws Exception {

		String sql = "insert into freeboard values(fb_seq.nextval, ?,?,?,default,0)";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, board_dto.getFb_title());
			pstat.setString(2, board_dto.getFb_contents());				
			pstat.setString(3, board_dto.getFb_mem_id());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public BoardDTO selectBySeq(int fb_seq) throws Exception {
		String sql = "select * from freeboard where fb_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, fb_seq);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					BoardDTO board_dto = new BoardDTO();
					board_dto.setFb_seq(rs.getInt("fb_seq"));
					board_dto.setFb_mem_id(rs.getString("fb_mem_id"));
					board_dto.setFb_title(rs.getString("fb_title"));
					board_dto.setFb_contents(rs.getString("fb_contents"));
					board_dto.setFb_write_date(rs.getTimestamp("fb_write_date"));
					board_dto.setFb_view_count(rs.getInt("fb_view_count"));
					return board_dto;
				}
			}
			return null;
		}
	}
	
	public int modify(int fb_seq, String fb_title, String fb_contents) throws Exception {
		String sql = "update freeboard set fb_title = ?, fb_contents = ? where fb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, fb_title);
			pstat.setString(2, fb_contents);
			pstat.setInt(3, fb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int fb_seq) throws Exception {
		String sql = "delete from freeboard where fb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, fb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<BoardDTO> searchBoard(String searchOption, String searchText) throws Exception {

		String sql = "select * from freeboard where "+searchOption.trim();


		if(searchText != null && !searchText.equals("")) {
			sql +=" like '%"+searchText.trim()+"%' order by fb_seq desc";
		}
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){

			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int fb_seq = rs.getInt("fb_seq");
				String fb_mem_id = rs.getString("fb_mem_id");
				String fb_title = rs.getString("fb_title");
				String fb_contents = rs.getString("fb_contents");
				Timestamp fb_write_date = rs.getTimestamp("fb_write_date");
				int fb_view_count = rs.getInt("fb_view_count");
				BoardDTO dto = new BoardDTO(fb_seq, fb_title, fb_contents, fb_mem_id, fb_write_date, fb_view_count);
				list.add(dto);	
			}
			return list;
		}
	}
	
	/*
	public List<BoardDTO> searchByTitle(String searchText) throws Exception {
		String sql = "select * from freeboard where fb_title = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, searchText);
			try (ResultSet rs = pstat.executeQuery();) {
				List<BoardDTO> list = new ArrayList<>();
				if (rs.next()) {
					BoardDTO board_dto = new BoardDTO();
					board_dto.setFb_seq(rs.getInt("fb_seq"));
					board_dto.setFb_mem_id(rs.getString("fb_mem_id"));
					board_dto.setFb_title(rs.getString("fb_title"));
					board_dto.setFb_contents(rs.getString("fb_contents"));
					board_dto.setFb_write_date(rs.getTimestamp("fb_write_date"));
					board_dto.setFb_view_count(rs.getInt("fb_view_count"));
					list.add(board_dto);
					return list;
				}
			}
			return null;
		}
	}
	
	public List<BoardDTO> searchById(int start, int end, String searchText) throws Exception {
		String sql = "select * from (select * from (select f.*, row_number() over(order by f.fb_seq desc) rn from freeboard f join member m on(f.fb_mem_id=m.mem_id)) where rn between ? and ?) where fb_mem_id = ?";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			pstat.setString(3, searchText);
			try (ResultSet rs = pstat.executeQuery();) {
				List<BoardDTO> search_list = new ArrayList<>();
				if (rs.next()) {
					BoardDTO board_dto = new BoardDTO();
					board_dto.setFb_seq(rs.getInt("fb_seq"));
					board_dto.setFb_mem_id(rs.getString("fb_mem_id"));
					board_dto.setFb_title(rs.getString("fb_title"));
					board_dto.setFb_contents(rs.getString("fb_contents"));
					board_dto.setFb_write_date(rs.getTimestamp("fb_write_date"));
					board_dto.setFb_view_count(rs.getInt("fb_view_count"));
					search_list.add(board_dto);
					return search_list;
				}
			}
			return null;
		}
	}
	*/
}


