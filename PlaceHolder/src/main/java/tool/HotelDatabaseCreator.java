package tool;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.HotelDTO;

public class HotelDatabaseCreator {

	private static String GEOCODE_URL=""; 
	private static String GEOCODE_USER_INFO="KakaoAK d163579e29f219c927e8268ccc2a9bc6"; 
	private static String [] FIVE_STAR_HOTEL_LIST = {"그랜드워커힐", "인터컨티넨탈", "그랜드하얏트", "노보텔 엠베서더","더플라자", "롯데호텔", "메이필드", "비스타워커힐", "쉐라톤",
			"스위스 그랜드 호텔", "시그니엘", "안다즈", 	"웨스틴 조선", "인터컨티넨탈", "임피리얼팰리스", "콘래드서울", "포시즌스", "호텔신라", "메리어트", "경원재 앰배서더", "네스트호텔", "쉐라톤", "파라다이스시티","파라다이스 호텔 부산", 
			"파크 하얏트", "힐튼 부산", "호텔 인터불고", "롯데호텔 울산", "씨마크 호텔", "하이원 그랜드 호텔", "홀리데이 인 리조트", "거제 삼성 호텔", "그랜드 플라자 청주", "앰블호텔", "라마다프라자 제주"
			,"롯데호텔", "메종글래드", "KAL", "스위트호텔 제주", "씨에스호텔앤리조트", "제주부영호텔", "제주신라", "신화월드", "제주오리엔탈", "켄싱턴 제주", "해비치호텔", "히든 클리프호텔", "WE호텔"};

	public static void main(String [] args) {

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@3.38.78.110:1521:xe";
			String username = "kh";
			String password = "kh";
			Connection con = DriverManager.getConnection(url, username, password);
			
			List<HotelDTO> hotelList = getHotelList();
			
			for(HotelDTO dto : hotelList) {
				
				String sql = "insert into hotel values(?,?,?,?,?,?,?)";
				PreparedStatement pstat = con.prepareStatement(sql);
				
				pstat.setString(1, dto.getHotelId());
				pstat.setString(2, dto.getHotelName());
				pstat.setString(3, "호텔 정보 dummy");
				pstat.setString(4, dto.getHotelPhone());
				pstat.setString(5, dto.getHotelRoadAddress());
				pstat.setString(6, dto.getHotelLongitude());
				pstat.setString(7, dto.getHotelLatitude());
				
				int result = pstat.executeUpdate();
				System.out.println(result);

			}
			con.commit();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static List<HotelDTO> getHotelList() throws Exception { 

		URL obj; 

		List<HotelDTO> totalList = new ArrayList<>();

		HotelInfoCollector collection = new HotelInfoCollector();

		List<String> hotelList = collection.getAllInfoList();

		try{ 

			StringBuffer response = new StringBuffer();

			for(int i = 0; i < FIVE_STAR_HOTEL_LIST.length; i++) {

				GEOCODE_URL="http://dapi.kakao.com/v2/local/search/keyword.json?category_group_code=AD5&page=1&query=";
				String word = FIVE_STAR_HOTEL_LIST[i];
				String query = URLEncoder.encode(word, "UTF-8");

				obj = new URL(GEOCODE_URL+query); 

				HttpURLConnection con = (HttpURLConnection)obj.openConnection(); 

				con.setRequestMethod("GET"); 
				con.setRequestProperty("Authorization", GEOCODE_USER_INFO); 
				con.setRequestProperty("content-type", "application/json"); 
				con.setDoOutput(true); con.setUseCaches(false); 
				con.setDefaultUseCaches(false); 

				Charset charset = Charset.forName("UTF-8"); 

				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset)); 

				String inputLine;

				while ((inputLine = in.readLine()) != null) { 
					System.out.println(inputLine);
					List<HotelDTO> list = jsonParsing(inputLine, hotelList);

					for(HotelDTO dto : list) {
						totalList.add(dto);
					}
				}
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return totalList;
	}

	public static List<HotelDTO> jsonParsing(String inputLine, List<String> hotelList) {

		List<HotelDTO> list = new ArrayList<>();

		String jsonString = inputLine.toString();

		JSONObject jObject = new JSONObject(jsonString);

		JSONArray jArray = jObject.getJSONArray("documents");

		for(int i = 0; i < jArray.length(); i++) {

			JSONObject obj = jArray.getJSONObject(i);
			
			String hotelId = obj.getString("id");
			String hotelName = obj.getString("place_name");
			String hotelInfo = "호텔 정보 dummy"; //getTargetInfo(hotelName, hotelList);
			String hotelPhone = obj.getString("phone");
			
			String hotelRoadAddress = obj.getString("road_address_name");
			String hotelLongitude = obj.getString("x");
			String hotelLatitude = obj.getString("y");
			
			String hotelUrl = obj.getString("place_url");
			String categoryName = obj.getString("category_name");

			HotelDTO dto = new HotelDTO(hotelId, hotelName, hotelInfo, hotelPhone, hotelRoadAddress, hotelLongitude, hotelLatitude);
			System.out.println(dto.getHotelId());
			list.add(dto);
		}

		return list;
	}

//	public static boolean regexTest(String hotelName, String original) {
//
//		Pattern pattern = Pattern.compile(original, Pattern.CASE_INSENSITIVE);
//		Matcher matcher = pattern.matcher(hotelName);
//		boolean matchFound = matcher.find();
//		if(matchFound) {
//			return true;
//		}else {
//			return false;
//		}
//	}
//
//	public static String getTargetInfo(String hotelName, List<String> hotelList) {
//
//		for(String description : hotelList) {
//			if(description.contains(hotelName)) {
//				return description;
//			}
//		}
//		return hotelName;
//	}
}