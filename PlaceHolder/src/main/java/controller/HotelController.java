package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.HotelDAO;
import dao.ImgFileDAO;
import dao.LikeDAO;
import dao.RoomDAO;
import dto.HotelDTO;
import dto.LikeDTO;

@WebServlet("*.hotel")
public class HotelController extends HttpServlet {
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
		
		
		// 진규 추가
		LikeDAO ldao = LikeDAO.getInstance();
		HttpSession session = request.getSession();
		
		
		try {
			//1.상품 리스트로 이동(메인에서 호텔을 눌렀을 때 1-10페이지만 보여줌)
			if(cmd.equals("/list.hotel")) {
				
				
				int start = 1;
				int end = start + 9;
				//호텔 정보와 이미지경로값 받아오기
				List<HotelDTO> hotelList = hdao.selectHotelB(start, end);
//				List<String> hotelImgList = idao.selectHotelImgB(start,end);
				request.setAttribute("hotelList", hotelList);
//				request.setAttribute("hotelImgList", hotelImgList);
				
				
				// 진규 추가한 내용
				String loginId = (String) session.getAttribute("loginId");
				System.out.println("로그인된 사용자의 ID : " + loginId);
				List<LikeDTO> dto = new ArrayList<>();
	            for (HotelDTO d : hotelList) {
	            	String hotelId = d.getHotelId();
	            	boolean likeCheck = ldao.likeCheck(loginId, hotelId);
	            	System.out.println("forEach 돌린 호텔 Id와 불린값 " + hotelId + " : " + likeCheck);
	            	dto.add(new LikeDTO(0, hotelId, loginId, likeCheck));
	            }
	            request.setAttribute("likeDto", dto);
				
	            
				request.getRequestDispatcher("/views/hotel/hotelList.jsp").forward(request, response);
				
			//2.리스트에서 더보기 버튼 누름(다음 10개를 더 가져옴)
			}else if(cmd.equals("/listPlus.hotel")) {
				//더보기 버튼의 value값을 받아옴
				int start = Integer.parseInt(request.getParameter("btn"));
				int end = start + 9;
				if(end > hdao.getHotelCount()) {
					end = hdao.getHotelCount();
				}	
				//호텔 정보와 이미지경로값 받아오기
				List<HotelDTO> hotelList = hdao.selectHotelB(start, end);
//				List<String> hotelImgList = idao.selectHotelImgB(start,end);
				
				List<List> all = new ArrayList<>();
				all.add(hotelList);
//				all.add(hotelImgList);
				Gson g = new Gson();
				
				
				// 진규 추가내용
				String loginId = (String) session.getAttribute("loginId");
				System.out.println("로그인된 사용자의 ID : " + loginId);
				List<LikeDTO> likeList = new ArrayList<>();
	            for (HotelDTO d : hotelList) {
	            	String hotelId = d.getHotelId();
	            	boolean likeCheck = ldao.likeCheck(loginId, hotelId);
	            	System.out.println("forEach 돌린 호텔 Id와 불린값 " + hotelId + " : " + likeCheck);
	            	likeList.add(new LikeDTO(0, hotelId, loginId, likeCheck));
	            }
	            String result = g.toJson(hotelList); // 호텔 리스트를 받고
	            String result2 = g.toJson(likeList); // 좋아요 리스트를 받고
	            String sub1 = result.substring(0, result.length()-1); // 호텔 json변환전 형식을 뒤에서 하나 자르고, 
	            String sub2 = result2.substring(1); // 호텔 형식을 앞에서 하나 잘라서
	            String push = sub1 + "," + sub2; // 이어 붙임
	            
				response.getWriter().append(push); // 더보기 누를시 console에는 에러가 나지만 페이지는 정상작동됨.
				
				
				
				//String result1 = g.toJson(hotelList);
				//String r	 esult2 = g.toJson(hotelImgList);
				
				//response.getWriter().append(result1);
				//response.getWriter().append(result2);
				
				//포워드
				//request.setAttribute("hotelList", hotelList);
				//request.setAttribute("hotelImgList", hotelImgList);
				//request.getRequestDispatcher("/views/hotel/hotelList.jsp").forward(request, response);
				
			//이름을 검색
			}else if(cmd.equals("/listSearch.hotel")) {
				//키워드 값을 받아옴(검색 옵션과 검색어)
				String option = request.getParameter("option");
				String keyword = request.getParameter("Keyword");
				//검색 옵션에 따라 찾는 값이 달라지므로 나눔
				if(option.equals("이름")) {
					List<HotelDTO> hotelList = hdao.searchHotelName(keyword);
//					List<String> hotelImgList = idao.searchHotelNameImg(keyword);
					request.setAttribute("hotelList", hotelList);
//					request.setAttribute("hotelImgList", hotelImgList);
					request.getRequestDispatcher("/views/hotel/hotelList.jsp").forward(request, response);
				}else if(option.equals("위치")) {
					List<HotelDTO> hotelList = hdao.searchHotelSite(keyword);
//					List<String> hotelImgList = idao.searchHotelSiteImg(keyword);
					request.setAttribute("hotelList", hotelList);
//					request.setAttribute("hotelImgList", hotelImgList);
					request.getRequestDispatcher("/views/hotel/hotelList.jsp").forward(request, response);
				}
				
			}else if(cmd.equals("/delete.hotel")) {
				String hotelId = request.getParameter("hotelId");
				hdao.deleteHotel(hotelId);
				rdao.deleteRoom(hotelId);
				idao.deleteImg(hotelId);
				response.sendRedirect("/hotel/list.jsp");
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
