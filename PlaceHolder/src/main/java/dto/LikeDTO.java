package dto;

public class LikeDTO {
	private int likeId;
	private String hotelId;
	private String loginId;
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}
	public String getHotelId() {
		return hotelId;
	}
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public LikeDTO(int likeId, String hotelId, String loginId) {
		super();
		this.likeId = likeId;
		this.hotelId = hotelId;
		this.loginId = loginId;
	}
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
