package tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import dto.HotelDTO;

public class ImgReviewCollector {   

	public static WebDriver driver;

	public static void main(String [] args) throws Exception {     

		System.setProperty("webdriver.chrome.driver","C:/Users/p/Downloads/chromedriver_win32 (1)/chromedriver.exe");
		WebDriver driver = new ChromeDriver(); 
		WebDriverWait wait  = new WebDriverWait(driver, Duration.ofSeconds(10));

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@3.38.78.110:1521:xe";
			String username = "kh";
			String password = "kh";
			Connection con = DriverManager.getConnection(url, username, password);

			List<String> imgList = new ArrayList<>();

			// 호텔 id 삽입한 후에 실행한다.
			// 호텔 id는 어디서 가져오나? DB에서 가져온다.

			driver.get("https://place.map.kakao.com/photolist/v/18661190?moreid=OP3&type=all&basis=all");
			//"https://place.map.kakao.com/photolist/v/**호텔 아이디 삽입**?moreid=OP3&type=all&basis=all"

			// jsonParsing
			String jsonString = driver.findElement(By.cssSelector("pre")).getText();
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonString);
			JSONObject parsedString = (JSONObject) jsonObj.get("photoViewer");
			JSONObject finalString = (JSONObject) jsonObj.get("list");
			System.out.println(parsedString.toString());

			// jsonArray형태로 parsing
			JSONArray photoArray = (JSONArray) parsedString.get("list");

			// 확인용 코드
			System.out.println(photoArray.toString());

			for(int i = 0; i < photoArray.size(); i++) {
				JSONObject obj = (JSONObject) photoArray.get(i);
				System.out.println(obj.get("url"));
			}
			// 1. hotelImg로 0번째 이미지를 삽입한다.

			// 2. 1 ~ 10번째 이미지를 roomImg에 삽입한다.
			



			Thread.sleep(10000);

		} catch(Exception e) {
			e.printStackTrace();
		}
		driver.quit();  
	} 
}