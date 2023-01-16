package com.shilla.event.comment.vo;

public class EventCommentVO {
	private int comment_id;
	private int event_id;
	private String comment_writer_img;
	private String  comment_writer_name;
	private String  comment_write_date;
	private String  comment_context;
	private int comment_cdepth;
	private int comment_cparent;
	
	public EventCommentVO() {
		// TODO Auto-generated constructor stub
	}
	
	public EventCommentVO(int comment_id, int event_id, String comment_writer_img, String comment_writer_name,
			String comment_write_date, String comment_context, int comment_cdepth, int comment_cparent) {
		super();
		this.comment_id = comment_id;
		this.event_id = event_id;
		this.comment_writer_img = comment_writer_img;
		this.comment_writer_name = comment_writer_name;
		this.comment_write_date = comment_write_date;
		this.comment_context = comment_context;
		this.comment_cdepth = comment_cdepth;
		this.comment_cparent = comment_cparent;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getComment_writer_img() {
		return comment_writer_img;
	}
	public void setComment_writer_img(String comment_writer_img) {
		this.comment_writer_img = comment_writer_img;
	}
	public String getComment_writer_name() {
		return comment_writer_name;
	}
	public void setComment_writer_name(String comment_writer_name) {
		this.comment_writer_name = comment_writer_name;
	}
	public String getComment_write_date() {
		return comment_write_date;
	}
	public void setComment_write_date(String comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
	public String getComment_context() {
		return comment_context;
	}
	public void setComment_context(String comment_context) {
		this.comment_context = comment_context;
	}
	public int getComment_cdepth() {
		return comment_cdepth;
	}
	public void setComment_cdepth(int comment_cdepth) {
		this.comment_cdepth = comment_cdepth;
	}
	public int getComment_cparent() {
		return comment_cparent;
	}
	public void setComment_cparent(int comment_cparent) {
		this.comment_cparent = comment_cparent;
	}
	
	
	
}
