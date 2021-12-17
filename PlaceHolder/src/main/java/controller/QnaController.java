package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QnADAO;
import dao.ReviewDAO;
import dto.QnADTO;
import dto.ReviewDTO;

@WebServlet("*.qna")
public class QnaController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Import QnADAO
		QnADAO dao = QnADAO.getInstance();
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=UTF-8");

		// 경로값 받아오기
		String cmd = request.getServletPath();
		
		// Import SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat();
		
		// 1. QnA 작성하기 기능
		// 2. QnA 조회하기 기능 (내가 쓴 글)
		// 3. QnA 수정하기 기능
		// 4. QnA 삭제하기 기능
		// 5. Hotel 상세페이지에서 QnA 출력할 수 있게 리스트 forward
		
		// userId 세션 값으로 받아두고 활용
		String loginId = (String) request.getSession().getAttribute("loginId");
		
		try {
			// 1. User의 리뷰 작성하기 기능
			if(cmd.equals("/write.qna")) {
				
				// loginId, 예약코드, 유저아이디, 호텔 아이디, qna내용, qna 작성날짜 받아오기
				String revId = request.getParameter("revId");
				String userId = loginId; // session 값
				String hotelId = request.getParameter("hotelId");
				String inquiryContent = request.getParameter("inquiryContent");
				
				// QnADTO 객체에 파라미터 값 담기
				
				dao.insert(new QnADTO(0,revId,userId,hotelId,inquiryContent,null));
				request.getRequestDispatcher("/views/hotel/hotelDetail.jsp");
			}
			// 2. User의 QnA 조회하기 기능 (내가 쓴 글)
			else if(cmd.equals("/viewMyReview.review")) {
				
				// 해당 userId로 작성된 QnA 목록 모두 조회하기
				List<QnADTO> myqna = dao.selectAll(loginId);
				
				// myPage로 request 값 포워드
				request.setAttribute("myqna", myqna);
				request.getRequestDispatcher("/myqnaPage.jsp").forward(request, response);
			}
			// 3. User의 qna 수정하기 기능
			else if(cmd.equals("/modify.qna")) {
				String inquiryContent = request.getParameter("inquiryContent");
				
				QnADTO qnaDto = new QnADTO(0, null, null, null, inquiryContent, null);
				
				 dao.modify(qnaDto);
				 //JSP 나오면 추가
				 response.sendRedirect("");
			}
			// 4. User의 qna 삭제하기 기능
			else if(cmd.equals("/delete.qna")) {
				
				// User의 리뷰코드를 받아온다.
				String userId = request.getParameter("userId");
				
				// 예약코드에 해당하는 review를 DB에서 삭제한다.
				int result = dao.delete(userId);
				//JSP 나오면 추가
				 response.sendRedirect("");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
