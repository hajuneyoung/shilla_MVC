package com.shilla.booking.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.LinkedList;
import java.util.Queue;

import com.shilla.booking.vo.RoomInfoVO;
import com.shilla.dbcon.ShillaStayDBConn;

/* Description: 
   Author: 조병준 */
public class RoomInfoDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	
	public RoomInfoDAO() throws ClassNotFoundException, SQLException {
		con = new ShillaStayDBConn().getConn();
	}
	
	public Queue<RoomInfoVO> getCallenderInfo(String date,int n) throws SQLException{
		
		Queue<RoomInfoVO> queue = new LinkedList<>();
		String sql = "SELECT * FROM tbl_room_info where rdate>=to_date(?) and rownum<=? ORDER BY rdate";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, date);
		pstmt.setInt(2, n);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String rdate = rs.getString("rdate");
			int standardRoom = rs.getInt("standardRoom");
			int suiteRoom = rs.getInt("suiteRoom");			
			int executiveRoom = rs.getInt("standardRoom");
			int koreanRoom = rs.getInt("suiteRoom");
			int standardPrice = rs.getInt("standardPrice");
			int suitePrice = rs.getInt("suitePrice");
			int executivePrice = rs.getInt("standardPrice");
			int koreanPrice = rs.getInt("suitePrice");
			
			RoomInfoVO vo = new RoomInfoVO(rdate,standardRoom,suiteRoom,executiveRoom,koreanRoom,standardPrice,suitePrice,executivePrice,koreanPrice);
			queue.add(vo); 
		}
		return queue;
	}
	
	public boolean roomCheck(String dateIn, String dateOut, String roomType) throws SQLException, ParseException {
		String sql = "SELECT * FROM tbl_room_info where rdate>=to_date(?) and rdate<to_date(?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dateIn);
		pstmt.setString(2, dateOut);
		rs = pstmt.executeQuery();
		
		String date1=dateIn;
		String date2=dateOut;
		
		Date format1 = (Date) new SimpleDateFormat("yyyyMMdd").parse(date1);
		Date format2 = (Date) new SimpleDateFormat("yyyyMMdd").parse(date2);
		long days = (format2.getTime() - format1.getTime())/(1000*24*60*60);
		long count=0;
		while(rs.next()) {
			int number = rs.getInt(roomType+"room");
			if(number>0) {
				count++;
			}
		}
		if(days==count) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public int getPrice(String dateIn, String dateOut, String roomType) throws SQLException {
		String sql = "SELECT * FROM tbl_room_info where rdate>=to_date(?) and rdate<to_date(?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dateIn);
		pstmt.setString(2, dateOut);
		rs = pstmt.executeQuery();
		int price=0;
		while(rs.next()) {
			price+=rs.getInt(roomType+"price");
		}
		return price;
	}
	
	public boolean reserveRoom(String dateIn, String dateOut, String roomType) throws ParseException, SQLException{
		String sql = "SELECT * FROM tbl_room_info where rdate>=to_date(?) and rdate<to_date(?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dateIn);
		pstmt.setString(2, dateOut);
		rs = pstmt.executeQuery();
		
		String date1=dateIn;
		String date2=dateOut;
		
		Date format1 = (Date) new SimpleDateFormat("yyyyMMdd").parse(date1);
		Date format2 = (Date) new SimpleDateFormat("yyyyMMdd").parse(date2);
		long days = (format2.getTime() - format1.getTime())/(1000*24*60*60);
		long count=0;
		
		while(rs.next()) {
			int number = rs.getInt(roomType+"room");
			if(number>0) {
				count++;
			}
		}
		if(days!=count) {
			return false;
		}		
		String sql2 = "UPDATE tbl_room_info SET "+roomType+"room="+roomType+"room-1 where rdate>=to_date(?) and rdate<to_date(?)";
		try {
			pstmt = con.prepareStatement(sql2);
			
			pstmt.setString(1, dateIn);
			pstmt.setString(2, dateOut);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}

