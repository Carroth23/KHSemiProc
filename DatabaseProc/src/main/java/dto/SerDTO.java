package dto;

public class SerDTO {
	private int num;
	private String name;
	public SerDTO(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}
	public SerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
