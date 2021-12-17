package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HotelDAO;
import dao.ImgFileDAO;
import dao.ReviewDAO;
import dao.ReviewImgDAO;
import dao.UserDAO;
import dto.HotelDTO;
import dto.ReviewDTO;

@WebServlet("*.home")
public class PageController extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //기본세팅
      request.setCharacterEncoding("utf8");
      response.setContentType("text/html;charset=UTF-8");
      String requestURI = request.getRequestURI();
      String ctxPath = request.getContextPath();
      String cmd = requestURI.substring(ctxPath.length());
      System.out.println(cmd); //경로 잘 들어오나 확인용
      
      //미리 세팅
      UserDAO udao = UserDAO.getInstance();
      HotelDAO hdao = HotelDAO.getInstance();
      ImgFileDAO idao = ImgFileDAO.getInstance();
      ReviewDAO vdao = ReviewDAO.getInstance();
      ReviewImgDAO vidao = ReviewImgDAO.getInstance();
      
      //들어오는 경로값에 따라 보내주는 곳
      try {
         if(cmd.equals("/main.home")) {
            //넘겨줘야할 정보 => 호텔 3개와 리뷰 6개
            //호텔 3개
            List<HotelDTO> hotelList = hdao.selectHotelB(11, 13);
            List<String> hotelImgList = idao.selectHotelImgB(11, 13);
            //리뷰 6개
            List<ReviewDTO> reviewList = vdao.selectReviewLimit();
            List<String> reviewImgList = vidao.selectReviewImgLimit();
            //전달
            request.setAttribute("hotelList", hotelList);
            request.setAttribute("hotelImgList", hotelImgList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("reviewImgList", reviewImgList);
            request.getRequestDispatcher("/views/hotel/hotelMain.jsp").forward(request, response);
         }else if(cmd.equals("/mypage.home")) {
            //넘겨줘야할 정보 => 호텔 3개와 리뷰 6개
            //호텔 3개
            List<HotelDTO> hotelList = hdao.selectHotelB(11, 13);
            List<String> hotelImgList = idao.selectHotelImgB(11, 13);
            //리뷰 6개
            List<ReviewDTO> reviewList = vdao.selectReviewLimit();
            List<String> reviewImgList = vidao.selectReviewImgLimit();
            //전달
            request.setAttribute("hotelList", hotelList);
            request.setAttribute("hotelImgList", hotelImgList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("reviewImgList", reviewImgList);
            request.getRequestDispatcher("/views/member/mypage.jsp").forward(request, response);
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