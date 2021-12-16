package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.like")
public class LikeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=UTF-8");
		String cmd = request.getServletPath();
		System.out.println(cmd);
		
		HttpSession session = request.getSession();
		if (cmd.equals("/on.like")) {
			String loginId = request.getParameter("loginId");
			String hotelId = request.getParameter("hotelId");
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
