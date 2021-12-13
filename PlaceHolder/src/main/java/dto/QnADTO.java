package dto;

import java.sql.Date;

public class QnADTO {
	private int inquiry;
	private String hotelId;
	private String userId;
	private String inquiryStat;
	private String inquiryContent;
	private Date inquiryCreated;
	
	public QnADTO(int inquiry, String hotelId, String userId, String inquiryStat, String inquiryContent,
			Date inquiryCreated) {
		super();
		this.inquiry = inquiry;
		this.hotelId = hotelId;
		this.userId = userId;
		this.inquiryStat = inquiryStat;
		this.inquiryContent = inquiryContent;
		this.inquiryCreated = inquiryCreated;
	}
	public QnADTO() {}
	public int getInquiry() {
		return inquiry;
	}
	public void setInquiry(int inquiry) {
		this.inquiry = inquiry;
	}
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getInquiryStat() {
		return inquiryStat;
	}
	public void setInquiryStat(String inquiryStat) {
		this.inquiryStat = inquiryStat;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public Date getInquiryCreated() {
		return inquiryCreated;
	}
	public void setInquiryCreated(Date inquiryCreated) {
		this.inquiryCreated = inquiryCreated;
	}
	
	
}
