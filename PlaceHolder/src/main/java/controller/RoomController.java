package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HotelDAO;
import dao.ImgFileDAO;
import dao.LikeDAO;
import dao.QnADAO;
import dao.ReviewDAO;
import dao.ReviewImgDAO;
import dao.RoomDAO;
import dto.HotelDTO;
import dto.QnADTO;
import dto.ReviewDTO;
import dto.RoomDTO;

@WebServlet("*.room")
public class RoomController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기본세팅
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=UTF-8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println(cmd); //경로 잘 들어오나 확인용
		
		//미리 세팅
		HotelDAO hdao = HotelDAO.getInstance();
		RoomDAO rdao = RoomDAO.getInstance();
		ImgFileDAO idao = ImgFileDAO.getInstance();
		QnADAO qdao = QnADAO.getInstance();
		ReviewDAO vdao = ReviewDAO.getInstance();
		ReviewImgDAO ridao = ReviewImgDAO.getInstance();
		
		// 진규 추가한 내용
		LikeDAO ldao = LikeDAO.getInstance();
		HttpSession session = request.getSession();
		
		
		try {
			//상품 상세 페이지에 들어옴
			if(cmd.equals("/goods.room")) {
	            //어떤 상품에 들어간건지 알기 위해 id값 받아오기
	            String hotelId = request.getParameter("hotelId");
	            
	            // 진규 추가한 내용
	            String loginId = (String) session.getAttribute("loginId");
	            boolean likeCheck = ldao.likeCheck(loginId, hotelId);
	            System.out.println("찜하기 버튼 유무 : " + likeCheck);
	            
	            
	            //호텔 이미지+정보 불러오기
	            List<HotelDTO> hotelListAll = hdao.selectHotel();
	            HotelDTO hotelList = hdao.selectHotelById(hotelId);
	            String hotelImgList = idao.selectHotelImgById(hotelId);
	            //방 이미지+정보 불러오기
	            List<RoomDTO> RoomList = rdao.selectRoomById(hotelId);
	            List<String> RoomImgList = idao.selectRoomImgById(hotelId);
	            //QnA정보 불러오기
	            List<QnADTO> QnAList = qdao.selectQnAByHotelId(hotelId);
	            //리뷰정보 불러오기
	            List<ReviewDTO> ReviewList = vdao.selectReviewByHotelId(hotelId);
//	            List<String> reviewImgList = ridao.selectReviewImgByHotelId(hotelId);
	            //이 값들을 전달해주기
	            request.setAttribute("hotelListAll", hotelListAll);
	            request.setAttribute("hotelList", hotelList);
	            request.setAttribute("hotelImgList", hotelImgList);
	            request.setAttribute("RoomList", RoomList);
	            request.setAttribute("RoomImgList", RoomImgList);
	            request.setAttribute("QnAList", QnAList);
	            request.setAttribute("ReviewList", ReviewList);
	            
	            // 진규 추가
	            request.setAttribute("likeCheck", likeCheck);
	            
	            
	            request.getRequestDispatcher("/views/hotel/hotelDetail.jsp").forward(request, response);
			
			//리뷰 더보기 버튼을 누름
			}else if(cmd.equals("/reviewplus.room")) {
				
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
