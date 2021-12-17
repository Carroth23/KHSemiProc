package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotelDAO;
import dao.PaymentDAO;
import dao.ReservationDAO;
import dao.RoomDAO;
import dao.UserDAO;
import dto.PaymentDTO;

@WebServlet("*.pay")
public class PaymentController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Encoding utf-8로 설정하기
				request.setCharacterEncoding("utf8");

				// 경로값 받아오기
				String cmd = request.getServletPath();

				// Import ReservationDAO
				ReservationDAO reservDao = ReservationDAO.getInstance();

				// Import UserDAO
				UserDAO userDao = UserDAO.getInstance();

				// Import RoomDAO
				RoomDAO roomDao = RoomDAO.getInstance();
				
				// Import HotelDAO
				HotelDAO hotelDao = HotelDAO.getInstance();
				
				// Impoty PaymentDAO
				PaymentDAO paymentDao = PaymentDAO.getInstance();
				
				// Session 값으로 떠 다니는 ID 값 받아오기
				String loginId = (String) request.getSession().getAttribute("loginId");
				
				try {
					if(cmd.equals("/reservation.pay")) {
						// Session 값 활용해서 User의 예약 현황 조회하기
						List<PaymentDTO> paymentDto = paymentDao.viewCurrentReservation(loginId); // session 값 활용하기

						// ReservationDTO 객체를 request에 담기
						request.setAttribute("paymentDto",paymentDto);

						// 마이페이지로 request를 전송
						request.getRequestDispatcher("/myReservation.jsp").forward(request, response);
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
