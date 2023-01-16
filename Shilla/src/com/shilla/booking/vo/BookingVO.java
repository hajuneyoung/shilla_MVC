package com.shilla.booking.vo;

/* Description: 
   Author: 조병준 */
public class BookingVO {
	String payNumber;
	String userID;
	String userName;
	String userTel;
	String checkIn;
	String checkOut;
	String schedule;
	int payAmount;
	String roomType;
	
	public BookingVO() {}
	
	public BookingVO(String payNumber, String userID, String userName, String userTel, String checkIn,
			String checkOut, String schedule, int payAmount, String roomType) {
		
		this.payNumber = payNumber;
		this.userID = userID;
		this.userName = userName;
		this.userTel = userTel;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.schedule = schedule;
		this.payAmount = payAmount;
		this.roomType = roomType;
	}
	public String getPayNumber() {
		return payNumber;
	}
	public void setPayNumber(String payNumber) {
		this.payNumber = payNumber;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
}
