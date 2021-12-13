package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QnADTO;

public class QnADAO {
	//인스턴스와 커넥션
	public static QnADAO instance = null;
	public static QnADAO getInstance() {
		if(instance == null) {
			instance = new QnADAO();
		}return instance;
	}
	private QnADAO() {}
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle"); 
		return ds.getConnection();
	}
	
	//호텔 아이디를 조건으로 하여 QnA 조회하기
	public List<QnADTO> selectQnAByHotelId(String hotelId)throws Exception{
		String sql = "select * from qna where hotelId = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, hotelId);
			try(ResultSet rs = pstat.executeQuery();){
				List<QnADTO> list = new ArrayList();
				while(rs.next()) {
					QnADTO dto = new QnADTO();
					dto.setInquiry(rs.getInt("inquiry"));
					dto.setHotelId(rs.getString("hotelId"));
					dto.setUserId(rs.getString("userId"));
					dto.setInquiryStat(rs.getString("inquuiryStat"));
					dto.setInquiryContent(rs.getString("inquiryContent"));
					dto.setInquiryCreated(rs.getDate("inquiryCreated"));
					list.add(dto);
				}return list;
			}
		}
	}
}
