package com.shilla.booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Queue;

import com.shilla.booking.vo.BookingVO;
import com.shilla.booking.vo.RoomInfoVO;
import com.shilla.dbcon.ShillaStayDBConn;

/* Description: 
   Author: 조병준*/
public class BookingDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	
	
	public BookingDAO() throws ClassNotFoundException, SQLException {
		
		con = new ShillaStayDBConn().getConn();
		
	}
	
	public boolean insert(String payNumber,String userID,String userName,String userTel,String checkIn,
			String checkOut,String schedule,int payAmount,String roomType){
		String sql = "insert into tbl_booking values(?, ?, ?, ?,to_date(?),to_date(?),?,?,?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, payNumber);
				pstmt.setString(2,userID);
				pstmt.setString(3,userName);
				pstmt.setString(4,userTel);
				pstmt.setString(5,checkIn);
				pstmt.setString(6,checkOut);
				pstmt.setString(7,schedule);
				pstmt.setInt(8, payAmount);
				pstmt.setString(9,roomType);

				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			return true;
	}
	
	public Queue<BookingVO> getBooking(String ID) throws SQLException{
		
		Queue<BookingVO> queue = new LinkedList<>();
		String sql = "SELECT * FROM tbl_booking where userID=? ORDER BY checkIn";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ID);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String payNumber = rs.getString("payNumber");
			String userID = rs.getString("userID");
			String userName = rs.getString("userName");
			String userTel = rs.getString("userTel");
			String checkIn = rs.getString("checkIn");
			String checkOut = rs.getString("checkOut");
			String schedule = rs.getString("schedule");
			int payAmount = rs.getInt("payAmount");
			String roomType = rs.getString("roomType");
			
			BookingVO vo = new BookingVO(payNumber,  userID,  userName,  userTel,  checkIn,
					 checkOut,  schedule,  payAmount,  roomType);
			queue.add(vo);
		}
		return queue;
	}
	
	public Queue<BookingVO> getBooking(String Name, String Tel) throws SQLException{
		
		Queue<BookingVO> queue = new LinkedList<>();
		String sql = "SELECT * FROM tbl_booking where userName=? and userTel=? and userID='비회원'  ORDER BY checkIn";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Name);
		pstmt.setString(2, Tel);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String payNumber = rs.getString("payNumber");
			String userID = rs.getString("userID");
			String userName = rs.getString("userName");
			String userTel = rs.getString("userTel");
			String checkIn = rs.getString("checkIn");
			String checkOut = rs.getString("checkOut");
			String schedule = rs.getString("schedule");
			int payAmount = rs.getInt("payAmount");
			String roomType = rs.getString("roomType");
			
			BookingVO vo = new BookingVO(payNumber,  userID,  userName,  userTel,  checkIn,
					 checkOut,  schedule,  payAmount,  roomType);
			queue.add(vo);
		}
		return queue;
	}
	
	public Queue<BookingVO> getAllBooking() throws SQLException{
		
		Queue<BookingVO> queue = new LinkedList<>();
		String sql = "SELECT * FROM tbl_booking ORDER BY checkIn";
		
		pstmt = con.prepareStatement(sql);
		
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String payNumber = rs.getString("payNumber");
			String userID = rs.getString("userID");
			String userName = rs.getString("userName");
			String userTel = rs.getString("userTel");
			String checkIn = rs.getString("checkIn");
			String checkOut = rs.getString("checkOut");
			String schedule = rs.getString("schedule");
			int payAmount = rs.getInt("payAmount");
			String roomType = rs.getString("roomType");
			
			BookingVO vo = new BookingVO(payNumber,  userID,  userName,  userTel,  checkIn,
					 checkOut,  schedule,  payAmount,  roomType);
			queue.add(vo);
		}
		return queue;
	}
}


