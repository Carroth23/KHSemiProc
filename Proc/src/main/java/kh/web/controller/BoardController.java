package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.BoardDAO;
import kh.web.dto.BoardDTO;
import kh.web.statics.Statics;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");
		BoardDAO dao = BoardDAO.getInstance();
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		try {
			if(cmd.equals("/fb_list.board")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				System.out.println(currentPage);
				int pageTotalCount = dao.getPageTotalCount();
				if(currentPage < 1) {currentPage = 1;}
				if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
				int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
				List<BoardDTO> list = dao.selectByBound(start, end);
				String navi = dao.getPageNavi(currentPage);
				request.setAttribute("fb_list", list);
				request.setAttribute("fb_navi", navi);
				request.getRequestDispatcher("/index.jsp").forward(request, response); // forward
			}else if(cmd.equals("/fb_write.board")) {
				response.sendRedirect("/board/write.jsp");
			}else if(cmd.equals("/fb_writeProc.board")) {
//				String writer = (String) request.getSession().getAttribute("loginID");
				String title = request.getParameter("fb_title");
				String contents = request.getParameter("fb_contents");
				dao.insert(new BoardDTO(0, title, contents, "hosboy93", null, 0));
				response.sendRedirect("/fb_list.board?cpage=1");
			}else if(cmd.equals("/fb_detail.board")) {				
				int fb_seq = Integer.parseInt(request.getParameter("fb_seq"));
				BoardDTO board_dto = dao.selectBySeq(fb_seq);
				int result = dao.addViewCount(fb_seq);
				request.setAttribute("board_dto", board_dto);
				request.getRequestDispatcher("/board/detail.jsp").forward(request, response);
			}else if(cmd.equals("/fb_modify.board")) {
				int fb_seq = Integer.parseInt(request.getParameter("fb_seq"));
				String fb_title = request.getParameter("fb_title");
				String fb_contents = request.getParameter("fb_contents");
				int result = dao.modify(fb_seq, fb_title, fb_contents);
				response.sendRedirect("/fb_detail.board?fb_seq="+ fb_seq);
			}else if(cmd.equals("/fb_delete.board")) {
				int fb_seq = Integer.parseInt(request.getParameter("fb_seq"));
				int result = dao.delete(fb_seq);
				response.sendRedirect("/fb_list.board?cpage=1");
			}else if(cmd.equals("/fb_search.board")) {
				String searchText = request.getParameter("searchText");
				String searchOption = request.getParameter("searchOption");
				
				System.out.println(searchText + " : " + searchOption);
				
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				System.out.println("들어온 c페이지 : " + currentPage);
				
				if(searchText.equals("")) {
					response.sendRedirect("/fb_list.board?cpage=1");
				}else {
					List<BoardDTO> searchList = dao.searchBoard(searchOption, searchText);	
					int count = 0;
					if(searchList.size() == 0) {
						request.setAttribute("count", count);
					}else {
						request.setAttribute("searchList", searchList);
					}

					int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE-1);
					int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
					String navi = dao.getPageNavi(currentPage);
					List<BoardDTO> list = dao.selectByBound(start, end);


					// 게시판 글 목록 중에 관리자가 쓴 글은 관리자라고 표시 하기 위함.

					String adminID = (String)request.getSession().getAttribute("adminID");

					request.setAttribute("adminID", adminID);
					request.setAttribute("fb_navi", navi);		
					request.setAttribute("search_list", list);
					request.getRequestDispatcher("/board/search.jsp?cpage=1").forward(request, response);
				}
			}
		
			
			
			/*
			else if(cmd.equals("/fb_search.board")) {
				String searchMethod = request.getParameter("searchOption");
				String searchText = request.getParameter("searchText");

				if(searchMethod.equals("제목")) {
					System.out.println("제목으로 찾는 중");	
					System.out.println(searchText);
					List<BoardDTO> list = dao.searchByTitle(searchText);
					request.setAttribute("search_dto", list);
					
					
					request.getRequestDispatcher("/board/search.jsp").forward(request, response);
					
				}else if(searchMethod.equals("아이디")) {
					System.out.println("아이디로 찾는 중");
					System.out.println(searchText);
//					List<BoardDTO> search_list = dao.searchById(searchText);
//					request.setAttribute("search_list", search_list);
					
//					int currentPage = Integer.parseInt(request.getParameter("cpage"));
					int currentPage = 1;
					int pageTotalCount = dao.getPageTotalCount();
					if(currentPage < 1) {currentPage = 1;}
					if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
					int start = currentPage * Statics.RECORD_COUNT_PER_PAGE - (Statics.RECORD_COUNT_PER_PAGE-1);
					int end = currentPage * Statics.RECORD_COUNT_PER_PAGE;
					List<BoardDTO> search_list = dao.searchById(start, end, searchText);
					String navi = dao.getPageNavi(currentPage);
					request.setAttribute("search_list", search_list);
					request.setAttribute("fb_navi", navi);
					
					request.getRequestDispatcher("/board/search.jsp").forward(request, response);
				}
			}
			*/
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
