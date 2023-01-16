package com.shilla.booking.vo;

/* Description: 
   Author: 조병준 */
public class RoomInfoVO {
	private String rdate;
	private int standardRoom;
	private int suiteRoom;
	private int executiveRoom;
	private int koreanRoom;
	private int standardPrice;
	private int suitePrice;
	private int executivePrice;
	private int koreanPrice;
	
	
	
	public RoomInfoVO() {}


	

	public RoomInfoVO(String rdate, int standardRoom, int suiteRoom, int executiveRoom, int koreanRoom,
			int standardPrice, int suitePrice, int executivePrice, int koreanPrice) {
		
		this.rdate = rdate;
		this.standardRoom = standardRoom;
		this.suiteRoom = suiteRoom;
		this.executiveRoom = executiveRoom;
		this.koreanRoom = koreanRoom;
		this.standardPrice = standardPrice;
		this.suitePrice = suitePrice;
		this.executivePrice = executivePrice;
		this.koreanPrice = koreanPrice;
	}




	public String getRdate() {
		return rdate;
	}



	public void setRdate(String rdate) {
		this.rdate = rdate;
	}



	public int getStandardRoom() {
		return standardRoom;
	}



	public void setStandardRoom(int standardRoom) {
		this.standardRoom = standardRoom;
	}



	public int getSuiteRoom() {
		return suiteRoom;
	}



	public void setSuiteRoom(int suiteRoom) {
		this.suiteRoom = suiteRoom;
	}



	public int getExecutiveRoom() {
		return executiveRoom;
	}



	public void setExecutiveRoom(int executiveRoom) {
		this.executiveRoom = executiveRoom;
	}



	public int getKoreanRoom() {
		return koreanRoom;
	}



	public void setKoreanRoom(int koreanRoom) {
		this.koreanRoom = koreanRoom;
	}



	public int getStandardPrice() {
		return standardPrice;
	}



	public void setStandardPrice(int standardPrice) {
		this.standardPrice = standardPrice;
	}



	public int getSuitePrice() {
		return suitePrice;
	}



	public void setSuitePrice(int suitePrice) {
		this.suitePrice = suitePrice;
	}



	public int getExecutivePrice() {
		return executivePrice;
	}



	public void setExecutivePrice(int executivePrice) {
		this.executivePrice = executivePrice;
	}



	public int getKoreanPrice() {
		return koreanPrice;
	}



	public void setKoreanPrice(int koreanPrice) {
		this.koreanPrice = koreanPrice;
	}

	
	
}
