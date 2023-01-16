package com.shilla.event.vo;

public class EventVO {
	
	private int event_id;

	private String kategorieOnEvnet;

	private String title_name;
	private String write_date;
	private String writerOnEvnet;

	private String prologOnevnet;
	private String img_title;
	private String img_out;
	private String imgOne;
	private String imgTwo;
	private String imgThree;

	private String subTitleOnEvnet;
	private String textOnsubTitle;
	
		public EventVO(int event_id, String kategorieOnEvnet, String title_name, String write_date, String writerOnEvnet,
			String prologOnevnet, String img_title, String img_out, String imgOne, String imgTwo, String imgThree,
			String subTitleOnEvnet, String textOnsubTitle) {
		super();
		this.event_id = event_id;
		this.kategorieOnEvnet = kategorieOnEvnet;
		this.title_name = title_name;
		this.write_date = write_date;
		this.writerOnEvnet = writerOnEvnet;
		this.prologOnevnet = prologOnevnet;
		this.img_title = img_title;
		this.img_out = img_out;
		this.imgOne = imgOne;
		this.imgTwo = imgTwo;
		this.imgThree = imgThree;
		this.subTitleOnEvnet = subTitleOnEvnet;
		this.textOnsubTitle = textOnsubTitle;
	}
		
	public EventVO() {
		// TODO Auto-generated constructor stub
	}
		
	

	public EventVO(int event_id, String kategorieOnEvnet, String title_name, String write_date, String img_out) {
		super();
		this.event_id = event_id;
		this.kategorieOnEvnet = kategorieOnEvnet;
		this.title_name = title_name;
		this.write_date = write_date;
		this.img_out = img_out;
	}

	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getKategorieOnEvnet() {
		return kategorieOnEvnet;
	}
	public void setKategorieOnEvnet(String kategorieOnEvnet) {
		this.kategorieOnEvnet = kategorieOnEvnet;
	}
	public String getTitle_name() {
		return title_name;
	}
	public void setTitle_name(String title_name) {
		this.title_name = title_name;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getWriterOnEvnet() {
		return writerOnEvnet;
	}
	public void setWriterOnEvnet(String writerOnEvnet) {
		this.writerOnEvnet = writerOnEvnet;
	}
	public String getPrologOnevnet() {
		return prologOnevnet;
	}
	public void setPrologOnevnet(String prologOnevnet) {
		this.prologOnevnet = prologOnevnet;
	}
	public String getImg_title() {
		return img_title;
	}
	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
	public String getImg_out() {
		return img_out;
	}
	public void setImg_out(String img_out) {
		this.img_out = img_out;
	}
	public String getImgOne() {
		return imgOne;
	}
	public void setImgOne(String imgOne) {
		this.imgOne = imgOne;
	}
	public String getImgTwo() {
		return imgTwo;
	}
	public void setImgTwo(String imgTwo) {
		this.imgTwo = imgTwo;
	}
	public String getImgThree() {
		return imgThree;
	}
	public void setImgThree(String imgThree) {
		this.imgThree = imgThree;
	}
	public String getSubTitleOnEvnet() {
		return subTitleOnEvnet;
	}
	public void setSubTitleOnEvnet(String subTitleOnEvnet) {
		this.subTitleOnEvnet = subTitleOnEvnet;
	}
	public String getTextOnsubTitle() {
		return textOnsubTitle;
	}
	public void setTextOnsubTitle(String textOnsubTitle) {
		this.textOnsubTitle = textOnsubTitle;
	}
		
	
}
