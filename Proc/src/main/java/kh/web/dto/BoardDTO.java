package kh.web.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int fb_seq;
	private String fb_title;
	private String fb_contents;
	private String fb_mem_id;
	private Timestamp fb_write_date;
	private int fb_view_count;

	public BoardDTO() {
	}

	public BoardDTO(int fb_seq, String fb_title, String fb_contents, String fb_mem_id, Timestamp fb_write_date,
			int fb_view_count) {
		super();
		this.fb_seq = fb_seq;
		this.fb_title = fb_title;
		this.fb_contents = fb_contents;
		this.fb_mem_id = fb_mem_id;
		this.fb_write_date = fb_write_date;
		this.fb_view_count = fb_view_count;
	}

	public int getFb_seq() {
		return fb_seq;
	}

	public void setFb_seq(int fb_seq) {
		this.fb_seq = fb_seq;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_contents() {
		return fb_contents;
	}

	public void setFb_contents(String fb_contents) {
		this.fb_contents = fb_contents;
	}

	public String getFb_mem_id() {
		return fb_mem_id;
	}

	public void setFb_mem_id(String fb_mem_id) {
		this.fb_mem_id = fb_mem_id;
	}

	public Timestamp getFb_write_date() {
		return fb_write_date;
	}

	public void setFb_write_date(Timestamp fb_write_date) {
		this.fb_write_date = fb_write_date;
	}

	public int getFb_view_count() {
		return fb_view_count;
	}

	public void setFb_view_count(int fb_view_count) {
		this.fb_view_count = fb_view_count;
	}

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return sdf.format(this.fb_write_date.getTime());
	}
	
	public String getDetailDate() {

		long current_time = System.currentTimeMillis(); // 현재의 timestamp
		long write_time = this.fb_write_date.getTime(); // 글이 작성된 timestamp

		long time_gap = current_time - write_time;

		if (time_gap < 60000) {
			return "1분 이내";
		} else if (time_gap < 300000) {
			return "5분 이내";
		} else if (time_gap < 3600000) {
			return "1시간 이내";
		} else if (time_gap < 86400000) {
			return "오늘";
		} else {
			return getFormedDate();
		}
	}
}
