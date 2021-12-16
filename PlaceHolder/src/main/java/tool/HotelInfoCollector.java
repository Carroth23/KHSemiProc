package tool;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class HotelInfoCollector {
	public static String [] URL_LIST = {
			"https://www.booking.com/searchresults.ko.html?label=bdot-HhWTaX_r6btPip7sfrk7SQS267777897793%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-324456682700%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo&sid=1921e0f8072627fbdc8fecbc771e3cfa&aid=376440&src=searchresults&error_url=https%3A%2F%2Fwww.booking.com%2Fsearchresults.ko.html%3Faid%3D376440%3Blabel%3Dbdot-HhWTaX_r6btPip7sfrk7SQS267777897793%253Apl%253Ata%253Ap1%253Ap22%252C563%252C000%253Aac%253Aap%253Aneg%253Afi%253Atikwd-324456682700%253Alp1009871%253Ali%253Adec%253Adm%253Appccp%253DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo%3Bsid%3D1921e0f8072627fbdc8fecbc771e3cfa%3Btmpl%3Dsearchresults%3Bac_click_type%3Db%3Bac_position%3D0%3Bcity%3D-716583%3Bclass_interval%3D1%3Bdest_id%3D-2595386%3Bdest_type%3Dcity%3Bdtdisc%3D0%3Bfrom_sf%3D1%3Bgroup_adults%3D2%3Bgroup_children%3D0%3Biata%3DEDI%3Binac%3D0%3Bindex_postcard%3D0%3Blabel_click%3Dundef%3Bno_rooms%3D1%3Boffset%3D0%3Bpostcard%3D0%3Braw_dest_type%3Dcity%3Broom1%3DA%252CA%3Bsb_price_type%3Dtotal%3Bsearch_selected%3D1%3Bshw_aparth%3D1%3Bslp_r_match%3D0%3Bsrc%3Dsearchresults%3Bsrc_elem%3Dsb%3Bsrpvid%3Db928a842759100c6%3Bss%3D%25EC%2597%2590%25EB%2593%25A0%25EB%25B2%2584%25EB%259F%25AC%252C%2520%25EC%258A%25A4%25EC%25BD%2594%25ED%258B%2580%25EB%259E%259C%25EB%2593%259C%252C%2520%25EC%2598%2581%25EA%25B5%25AD%3Bss_all%3D0%3Bss_raw%3De%3Bssb%3Dempty%3Bsshis%3D0%3Bssne%3D%25EC%2584%259C%25EC%259A%25B8%3Bssne_untouched%3D%25EC%2584%259C%25EC%259A%25B8%3Btop_ufis%3D1%26%3B&ss=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&is_ski_area=&ssne=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&ssne_untouched=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&city=-2595386&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&from_sf=1&ss_raw=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&ac_position=1&ac_langcode=ko&ac_click_type=b&dest_id=112&dest_type=country&place_id_lat=36.4102&place_id_lon=127.916&search_pageview_id=b928a842759100c6&search_selected=true&search_pageview_id=b928a842759100c6&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=class%3D5&offset=0",
			"https://www.booking.com/searchresults.ko.html?label=bdot-HhWTaX_r6btPip7sfrk7SQS267777897793%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-324456682700%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo&sid=1921e0f8072627fbdc8fecbc771e3cfa&aid=376440&src=searchresults&error_url=https%3A%2F%2Fwww.booking.com%2Fsearchresults.ko.html%3Faid%3D376440%3Blabel%3Dbdot-HhWTaX_r6btPip7sfrk7SQS267777897793%253Apl%253Ata%253Ap1%253Ap22%252C563%252C000%253Aac%253Aap%253Aneg%253Afi%253Atikwd-324456682700%253Alp1009871%253Ali%253Adec%253Adm%253Appccp%253DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo%3Bsid%3D1921e0f8072627fbdc8fecbc771e3cfa%3Btmpl%3Dsearchresults%3Bac_click_type%3Db%3Bac_position%3D0%3Bcity%3D-716583%3Bclass_interval%3D1%3Bdest_id%3D-2595386%3Bdest_type%3Dcity%3Bdtdisc%3D0%3Bfrom_sf%3D1%3Bgroup_adults%3D2%3Bgroup_children%3D0%3Biata%3DEDI%3Binac%3D0%3Bindex_postcard%3D0%3Blabel_click%3Dundef%3Bno_rooms%3D1%3Boffset%3D0%3Bpostcard%3D0%3Braw_dest_type%3Dcity%3Broom1%3DA%252CA%3Bsb_price_type%3Dtotal%3Bsearch_selected%3D1%3Bshw_aparth%3D1%3Bslp_r_match%3D0%3Bsrc%3Dsearchresults%3Bsrc_elem%3Dsb%3Bsrpvid%3Db928a842759100c6%3Bss%3D%25EC%2597%2590%25EB%2593%25A0%25EB%25B2%2584%25EB%259F%25AC%252C%2520%25EC%258A%25A4%25EC%25BD%2594%25ED%258B%2580%25EB%259E%259C%25EB%2593%259C%252C%2520%25EC%2598%2581%25EA%25B5%25AD%3Bss_all%3D0%3Bss_raw%3De%3Bssb%3Dempty%3Bsshis%3D0%3Bssne%3D%25EC%2584%259C%25EC%259A%25B8%3Bssne_untouched%3D%25EC%2584%259C%25EC%259A%25B8%3Btop_ufis%3D1%26%3B&ss=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&is_ski_area=&ssne=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&ssne_untouched=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&city=-2595386&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&from_sf=1&ss_raw=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&ac_position=1&ac_langcode=ko&ac_click_type=b&dest_id=112&dest_type=country&place_id_lat=36.4102&place_id_lon=127.916&search_pageview_id=b928a842759100c6&search_selected=true&search_pageview_id=b928a842759100c6&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=class%3D5&offset=25",
			"https://www.booking.com/searchresults.ko.html?label=bdot-HhWTaX_r6btPip7sfrk7SQS267777897793%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-324456682700%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo&sid=1921e0f8072627fbdc8fecbc771e3cfa&aid=376440&src=searchresults&error_url=https%3A%2F%2Fwww.booking.com%2Fsearchresults.ko.html%3Faid%3D376440%3Blabel%3Dbdot-HhWTaX_r6btPip7sfrk7SQS267777897793%253Apl%253Ata%253Ap1%253Ap22%252C563%252C000%253Aac%253Aap%253Aneg%253Afi%253Atikwd-324456682700%253Alp1009871%253Ali%253Adec%253Adm%253Appccp%253DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo%3Bsid%3D1921e0f8072627fbdc8fecbc771e3cfa%3Btmpl%3Dsearchresults%3Bac_click_type%3Db%3Bac_position%3D0%3Bcity%3D-716583%3Bclass_interval%3D1%3Bdest_id%3D-2595386%3Bdest_type%3Dcity%3Bdtdisc%3D0%3Bfrom_sf%3D1%3Bgroup_adults%3D2%3Bgroup_children%3D0%3Biata%3DEDI%3Binac%3D0%3Bindex_postcard%3D0%3Blabel_click%3Dundef%3Bno_rooms%3D1%3Boffset%3D0%3Bpostcard%3D0%3Braw_dest_type%3Dcity%3Broom1%3DA%252CA%3Bsb_price_type%3Dtotal%3Bsearch_selected%3D1%3Bshw_aparth%3D1%3Bslp_r_match%3D0%3Bsrc%3Dsearchresults%3Bsrc_elem%3Dsb%3Bsrpvid%3Db928a842759100c6%3Bss%3D%25EC%2597%2590%25EB%2593%25A0%25EB%25B2%2584%25EB%259F%25AC%252C%2520%25EC%258A%25A4%25EC%25BD%2594%25ED%258B%2580%25EB%259E%259C%25EB%2593%259C%252C%2520%25EC%2598%2581%25EA%25B5%25AD%3Bss_all%3D0%3Bss_raw%3De%3Bssb%3Dempty%3Bsshis%3D0%3Bssne%3D%25EC%2584%259C%25EC%259A%25B8%3Bssne_untouched%3D%25EC%2584%259C%25EC%259A%25B8%3Btop_ufis%3D1%26%3B&ss=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&is_ski_area=&ssne=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&ssne_untouched=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&city=-2595386&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&from_sf=1&ss_raw=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&ac_position=1&ac_langcode=ko&ac_click_type=b&dest_id=112&dest_type=country&place_id_lat=36.4102&place_id_lon=127.916&search_pageview_id=b928a842759100c6&search_selected=true&search_pageview_id=b928a842759100c6&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=class%3D5&offset=50",
			"https://www.booking.com/searchresults.ko.html?label=bdot-HhWTaX_r6btPip7sfrk7SQS267777897793%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-324456682700%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo&sid=1921e0f8072627fbdc8fecbc771e3cfa&aid=376440&src=searchresults&error_url=https%3A%2F%2Fwww.booking.com%2Fsearchresults.ko.html%3Faid%3D376440%3Blabel%3Dbdot-HhWTaX_r6btPip7sfrk7SQS267777897793%253Apl%253Ata%253Ap1%253Ap22%252C563%252C000%253Aac%253Aap%253Aneg%253Afi%253Atikwd-324456682700%253Alp1009871%253Ali%253Adec%253Adm%253Appccp%253DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo%3Bsid%3D1921e0f8072627fbdc8fecbc771e3cfa%3Btmpl%3Dsearchresults%3Bac_click_type%3Db%3Bac_position%3D0%3Bcity%3D-716583%3Bclass_interval%3D1%3Bdest_id%3D-2595386%3Bdest_type%3Dcity%3Bdtdisc%3D0%3Bfrom_sf%3D1%3Bgroup_adults%3D2%3Bgroup_children%3D0%3Biata%3DEDI%3Binac%3D0%3Bindex_postcard%3D0%3Blabel_click%3Dundef%3Bno_rooms%3D1%3Boffset%3D0%3Bpostcard%3D0%3Braw_dest_type%3Dcity%3Broom1%3DA%252CA%3Bsb_price_type%3Dtotal%3Bsearch_selected%3D1%3Bshw_aparth%3D1%3Bslp_r_match%3D0%3Bsrc%3Dsearchresults%3Bsrc_elem%3Dsb%3Bsrpvid%3Db928a842759100c6%3Bss%3D%25EC%2597%2590%25EB%2593%25A0%25EB%25B2%2584%25EB%259F%25AC%252C%2520%25EC%258A%25A4%25EC%25BD%2594%25ED%258B%2580%25EB%259E%259C%25EB%2593%259C%252C%2520%25EC%2598%2581%25EA%25B5%25AD%3Bss_all%3D0%3Bss_raw%3De%3Bssb%3Dempty%3Bsshis%3D0%3Bssne%3D%25EC%2584%259C%25EC%259A%25B8%3Bssne_untouched%3D%25EC%2584%259C%25EC%259A%25B8%3Btop_ufis%3D1%26%3B&ss=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&is_ski_area=&ssne=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&ssne_untouched=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&city=-2595386&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&from_sf=1&ss_raw=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&ac_position=1&ac_langcode=ko&ac_click_type=b&dest_id=112&dest_type=country&place_id_lat=36.4102&place_id_lon=127.916&search_pageview_id=b928a842759100c6&search_selected=true&search_pageview_id=b928a842759100c6&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=class%3D5&offset=75",
			"https://www.booking.com/searchresults.ko.html?label=bdot-HhWTaX_r6btPip7sfrk7SQS267777897793%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-324456682700%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo&sid=1921e0f8072627fbdc8fecbc771e3cfa&aid=376440&src=searchresults&error_url=https%3A%2F%2Fwww.booking.com%2Fsearchresults.ko.html%3Faid%3D376440%3Blabel%3Dbdot-HhWTaX_r6btPip7sfrk7SQS267777897793%253Apl%253Ata%253Ap1%253Ap22%252C563%252C000%253Aac%253Aap%253Aneg%253Afi%253Atikwd-324456682700%253Alp1009871%253Ali%253Adec%253Adm%253Appccp%253DUmFuZG9tSVYkc2RlIyh9YUlRwjG4dAJkHxCuUKVzpFo%3Bsid%3D1921e0f8072627fbdc8fecbc771e3cfa%3Btmpl%3Dsearchresults%3Bac_click_type%3Db%3Bac_position%3D0%3Bcity%3D-716583%3Bclass_interval%3D1%3Bdest_id%3D-2595386%3Bdest_type%3Dcity%3Bdtdisc%3D0%3Bfrom_sf%3D1%3Bgroup_adults%3D2%3Bgroup_children%3D0%3Biata%3DEDI%3Binac%3D0%3Bindex_postcard%3D0%3Blabel_click%3Dundef%3Bno_rooms%3D1%3Boffset%3D0%3Bpostcard%3D0%3Braw_dest_type%3Dcity%3Broom1%3DA%252CA%3Bsb_price_type%3Dtotal%3Bsearch_selected%3D1%3Bshw_aparth%3D1%3Bslp_r_match%3D0%3Bsrc%3Dsearchresults%3Bsrc_elem%3Dsb%3Bsrpvid%3Db928a842759100c6%3Bss%3D%25EC%2597%2590%25EB%2593%25A0%25EB%25B2%2584%25EB%259F%25AC%252C%2520%25EC%258A%25A4%25EC%25BD%2594%25ED%258B%2580%25EB%259E%259C%25EB%2593%259C%252C%2520%25EC%2598%2581%25EA%25B5%25AD%3Bss_all%3D0%3Bss_raw%3De%3Bssb%3Dempty%3Bsshis%3D0%3Bssne%3D%25EC%2584%259C%25EC%259A%25B8%3Bssne_untouched%3D%25EC%2584%259C%25EC%259A%25B8%3Btop_ufis%3D1%26%3B&ss=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&is_ski_area=&ssne=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&ssne_untouched=%EC%97%90%EB%93%A0%EB%B2%84%EB%9F%AC&city=-2595386&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&from_sf=1&ss_raw=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD&ac_position=1&ac_langcode=ko&ac_click_type=b&dest_id=112&dest_type=country&place_id_lat=36.4102&place_id_lon=127.916&search_pageview_id=b928a842759100c6&search_selected=true&search_pageview_id=b928a842759100c6&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=class%3D5&offset=100"
	};

	private static String [] FIVE_STAR_HOTEL_LIST = {
			"그랜드워커힐", "인터컨티넨탈", "그랜드하얏트", "노보텔 엠베서더","더플라자", "롯데호텔", "메이필드", "비스타워커힐", "쉐라톤",
			"스위스 그랜드 호텔", "시그니엘", "안다즈", 	"웨스틴 조선", "인터컨티넨탈", "임피리얼팰리스", "콘래드서울", "포시즌스", "호텔신라", 
			"메리어트", "경원재 앰배서더", "네스트호텔", "쉐라톤", "파라다이스시티","파라다이스 호텔 부산", "파크 하얏트", "힐튼 부산", 
			"호텔 인터불고", "롯데호텔 울산", "씨마크 호텔", "하이원 그랜드 호텔", "홀리데이 인 리조트", "거제 삼성 호텔", "그랜드 플라자 청주", 
			"앰블호텔", "라마다프라자 제주","롯데호텔", "메종글래드", "KAL", "스위트호텔 제주", "씨에스호텔앤리조트", "제주부영호텔", "제주신라", 
			"신화월드", "제주오리엔탈", "켄싱턴 제주", "해비치호텔", "히든 클리프호텔", "WE호텔"};

	public static List<String> HOTEL_DESCRIPTION [];

	public List<String> getAllInfoList() throws Exception {

		System.setProperty("webdriver.chrome.driver","C:/Users/p/Downloads/chromedriver_win32 (1)/chromedriver.exe");
		
		List<String> infoList = new ArrayList<>(); // 호텔 이름을 활용해서 매칭시키고 ID 값을 부여한다.
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		options.addArguments("--window-size=1920,1080");
		WebDriver driver = new ChromeDriver(options); 
		WebDriverWait wait  = new WebDriverWait(driver, Duration.ofSeconds(10));

		
		try {
			// 리뷰 크롤링
			// _4abc4c3d5 : 메인 페이지에서 보이는 링크
			// fb01724e5b : 개별 호텔 링크로 가는 a 태그 클래스 이름
			// hp_hotel_name : 호텔 이름 id 태그
			// property_description_content : 상품 상세 설명 div태그 id 이름
			// bh-photo-grid-item bh-photo-grid-thumb js-bh-photo-grid-item-see-all : 전체 사진 보게하는 상세 페이지 a태그 클래스
			// bh-photo-modal-grid-image : 개별 이미지 a태그 클래스 이름
			// src 값이 img url 값임!
			// c-review__body: 리뷰 내용 종 좋은 내용 - id 어쩔?
			

			for(int i = 0; i < URL_LIST.length; i++) {

				driver.get(URL_LIST[i]);

//				wait.until(ExpectedConditions.urlToBe(URL_LIST[i]));
				// 대기
//				wait.until(ExpectedConditions.presenceOfElementLocated(By.className("_4abc4c3d5")));

				List<WebElement> list = driver.findElements(By.className("_4abc4c3d5"));

				for(WebElement e : list) {
					String text = e.getText();
					if(text.length() > 30) {
						infoList.add(text);
					}
				}
			}
			
			int cnt = 0;
			for(int i = 0; i < FIVE_STAR_HOTEL_LIST.length; i++) {

				for (int j = 0; j < infoList.size(); j++) {
					if(infoList.get(j).contains(FIVE_STAR_HOTEL_LIST[i])) {
						cnt++;
					}
				}

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		driver.quit();
		return infoList;
	}
}