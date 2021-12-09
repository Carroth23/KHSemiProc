package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.UserDTO;

@WebServlet("*.user")
public class UserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기본세팅
		request.setCharacterEncoding("utf8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println(cmd); //경로 잘 들어오나 확인용

		//미리 세팅
		UserDAO dao = UserDAO.getInstance();

		//들어오는 경로값에 따라 보내주는 곳
		try {
			//회원가입 폼으로 이동
			if(cmd.equals("/signupPage.user")) {
				response.sendRedirect("/user/signup.jsp");

				//아이디 중복확인
			}else if(cmd.equals("/idCheck.user")) {
				String userId = request.getParameter("id");
				boolean result = dao.idCheck(userId);
				response.getWriter().append(String.valueOf(result));

				//회원가입
			}else if(cmd.equals("/signup.user")) {
				System.out.println("회원가입 버튼 감지");
				String userId = request.getParameter("id");
				String userName = request.getParameter("name");
				String userPw = request.getParameter("pw");
				String userNickname = request.getParameter("nickname");
				String userEmail = request.getParameter("email");
				//생년월일은 드롭다운으로 보통 받기 때문에 이를 어떻게 처리할건지? 궁금
				String userBirth = request.getParameter("birth");
				//전화번호 입력칸 하나로 합치기
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String userPhone = phone1 + phone2 + phone3;
				String userPost = request.getParameter("post");
				String userRoadAddress = request.getParameter("roadAddress");
				String userRoadAddress2 = request.getParameter("roadAddress2");
				//제대로 값을 입력받았나 확인(*)
				System.out.println(userId + " | " + userName + " | " +userPw + " | " + userNickname + " | " + userEmail + " | " + userBirth+ " | " + userPhone + " | " + userPost + " | " + userRoadAddress + " | " + userRoadAddress2);
				dao.insert(new UserDTO(userId, userName, userPw, userNickname, userEmail, userBirth , userPhone, userPost, userRoadAddress, userRoadAddress2));
				response.sendRedirect("/index.jsp");

				//로그인
			}else if(cmd.equals("/login.user")) {
				System.out.println("로그인 버튼 감지");
				String User_id = request.getParameter("id");
				String User_pw = request.getParameter("pw");
				System.out.println(User_id);
				System.out.println(User_pw);
				boolean result = dao.login(User_id, User_pw);
				if(result) {
					HttpSession session = request.getSession();
					session.setAttribute("loginId", User_id);
					//제대로 로그인이 되었나 확인(*)
					System.out.println(User_id + "님 로그인");
				}response.sendRedirect("/index.jsp");

				//로그아웃
			}else if(cmd.equals("/logout.user")) {
				request.getSession().removeAttribute("loginId");
				response.sendRedirect("/index.jsp");

				//회원탈퇴
			}else if(cmd.equals("/secession.user")) {
				String User_id = (String)request.getSession().getAttribute("loginId");
				dao.delete(User_id);
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");

				//회원정보 열람
			}else if(cmd.equals("/userInfo.user")) {
				String User_id = (String)request.getSession().getAttribute("loginId");
				UserDTO dto = dao.info(User_id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/user/userInfo.jsp").forward(request, response);

				//회원정보 수정
			}else if(cmd.equals("/update.user")) {
				String userName = request.getParameter("name");
				String userPw = request.getParameter("pw");
				String userNickname = request.getParameter("nickname");
				String userEmail = request.getParameter("email");
				//생년월일은 드롭다운으로 보통 받기 때문에 이를 어떻게 처리할건지? 궁금
				String userBirth = request.getParameter("birth");
				//전화번호 입력칸 하나로 합치기
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String userPhone = phone1 + phone2 + phone3;
				String userPost = request.getParameter("post");
				String userRoadAddress = request.getParameter("roadAddress");
				String userRoadAddress2 = request.getParameter("roadAddress2");
				//제대로 값을 입력받았나 확인(*)
				System.out.println(userName + " | " +userPw + " | " + userNickname + " | " + userEmail + " | " + userBirth+ " | " + userPhone + " | " + userPost + " | " + userRoadAddress + " | " + userRoadAddress2);
				dao.update(new UserDTO(null,userName, userPw, userNickname, userEmail, userBirth , userPhone, userPost, userRoadAddress, userRoadAddress2));
				response.sendRedirect("/myPage.jsp");

			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
