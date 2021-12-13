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

import dao.ReviewDAO;
import dto.ReviewDTO;

@WebServlet("*.review")
public class ReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Encoding utf-8로 설정하기
		request.setCharacterEncoding("utf8");

		// 경로값 받아오기
		String cmd = request.getServletPath();

		// Import ReviewDAO
		ReviewDAO reviewDao = ReviewDAO.getInstance();
		
		// Import SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat();
		
		// 1. 리뷰 작성하기 기능
		// 2. 리뷰 조회하기 기능 (내가 쓴 글)
		// 3. 리뷰 수정하기 기능
		// 4. 리뷰 삭제하기 기능
		// 5. Hotel 상세페이지에서 ReviewList 출력할 수 있게 리스트 forward
		
		// userId 세션 값으로 받아두고 활용
		String loginId = (String) request.getSession().getAttribute("loginId");
		
		try {
			// 1. User의 리뷰 작성하기 기능
			if(cmd.equals("/write.review")) {
				
				// loginId, 예약코드, 유저아이디, 호텔 아이디, 리뷰내용, 리뷰점수, 리뷰 작성날짜 받아오기
				String reviewId = request.getParameter("reviewId");
				String revId = request.getParameter("revId");
				String userId = loginId; // session 값
				String hotelId = request.getParameter("hotelId");
				String reviewContent = request.getParameter("hotelContent");
				int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
				Date reviewCreated = (Date)sdf.parse(request.getParameter("reviewCreated"));
				
				// ReviewDTO 객체에 파라미터 값 담기
				ReviewDTO dto = new ReviewDTO(reviewId, revId, userId, hotelId, reviewContent, reviewScore, reviewCreated);
				
				// Review DB에 저장하기
				int result = reviewDao.writeReview(dto);
				
			}
			// 2. User의 리뷰 조회하기 기능 (내가 쓴 글)
			else if(cmd.equals("/viewMyReview.review")) {
				
				// 해당 userId로 작성된 리뷰 목록 모두 조회하기
				List<ReviewDTO> myReview = reviewDao.selectMyReview(loginId);
				
				// myPage로 requet 값 포워드
				request.setAttribute("myReview", myReview);
				request.getRequestDispatcher("/myReviewPage.jsp").forward(request, response);
			}
			// 3. User의 리뷰 수정하기 기능
			else if(cmd.equals("/modifyReview.review")) {
				
				// 리뷰 리스트에서 선택한 리뷰 아이디, 예약코드, 유저아이디, 호텔아이디, 내용, 점수 값 불러오기
				String reviewId = request.getParameter("reviewId");
				String revId = request.getParameter("revId");
				String userId = loginId; // session 값
				String hotelId = request.getParameter("hotelId");
				String reviewContent = request.getParameter("hotelContent");
				int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
				Date reviewCreated = (Date)sdf.parse(request.getParameter("reviewCreated"));
				
				ReviewDTO reviewDto = new ReviewDTO(reviewId, revId, userId, hotelId, reviewContent, reviewScore, reviewCreated);
				
				 reviewDao.modifyReview(reviewDto);
				 response.sendRedirect("");
			}
			// 4. User의 리뷰 삭제하기 기능
			else if(cmd.equals("/deleteReview.review")) {
				
				// User의 예약코드를 받아온다.
				int revId = Integer.parseInt(request.getParameter("revId"));
				
				// 예약코드에 해당하는 review를 DB에서 삭제한다.
				int result = reviewDao.deleteReview(revId);
			}
			// 5. Hotel 상세페이지에서 ReviewList 출력할 수 있게 리스트 forward
			else if(cmd.equals("/viewAllReviews.review")){
				
				//List<ReviewDTO> reviewList = reviewDao.viewAllReviews();
				
				//request.setAttribute("reviewList", reviewList);
				//request.getRequestDispatcher("/review.hotel").forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
