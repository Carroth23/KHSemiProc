package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LikeDAO;


@WebServlet("*.like")
public class LikeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=UTF-8");
		String cmd = request.getServletPath();
		System.out.println(cmd);
		
		LikeDAO dao = LikeDAO.getInstance();
		HttpSession session = request.getSession();
		
		try {
			
			// 디테일 페이지에서만 적용되는 좋아요 기능
			if (cmd.equals("/detailClick.like")) {
				String loginId = request.getParameter("loginId");
				String hotelId = request.getParameter("hotelId");
				// 해당 아이디랑 호텔 id받아오기.
				System.out.println(loginId);
				System.out.println(hotelId);
				
				boolean DetailLikeCheck = dao.likeCheck(loginId, hotelId);
				System.out.println("하트 체크 : " + DetailLikeCheck);
				if(!DetailLikeCheck) { // 하트를 눌렀는데 false면 현재 페이지에서는 투명이고 사용자는 하트를 처음 누르는것이니 add
					dao.likeAdd(loginId, hotelId);
					response.getWriter().append("add");
				} else if (DetailLikeCheck) {	// 해당 사용자가 하트를 눌렀는데 이미 누른적이 있는 사용자라면 빨간색 하트를 다시 검정으로 바꿔버려야됨.
					dao.likeDel(loginId, hotelId);
					response.getWriter().append("del");
				}
				
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
