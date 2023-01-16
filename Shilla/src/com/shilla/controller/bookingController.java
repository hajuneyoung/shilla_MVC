package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Queue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// build path : json-simple-1.1.1.jar 파일 추가
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shilla.booking.dao.BookingDAO;
import com.shilla.booking.dao.RoomInfoDAO;
import com.shilla.booking.vo.BookingVO;
import com.shilla.booking.vo.RoomInfoVO;

/* Description: 
Author: 조병준 */
@WebServlet(urlPatterns = {"/calendar.do",
							"/checkAvailability.do",
							"/insertReservation.do",
							"/reserveRoom.do",
							"/reservation.do",
							"/reservationAdmin.do"})
public class bookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public bookingController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String c = request.getRequestURI().substring(request.getContextPath().length());
		String userID,userTel,userName,dateIn,dateOut,roomType,str=null;
		RoomInfoDAO SSRDAO;
		
		switch(c) {
		case "/calendar.do":
			response.setContentType("application/json; charset=utf-8");
			String date1=request.getParameter("sDate");
			String sCount=request.getParameter("count");
			int count=Integer.parseInt(sCount);
			date1=date1.replace(" ", "");
			date1=date1.replace(".", "q");

			String[] dateArr=date1.split("q");
			String sYear=dateArr[0];
			String sMonth=dateArr[1];
			String sDate=dateArr[2];
			int intMonth=Integer.parseInt(sMonth);
			int intDate=Integer.parseInt(sDate);
			if(intMonth<10) {
				sMonth="0"+sMonth;
			}
			if(intDate<10) {
				sDate="0"+sDate;
			}
			String sFulldate=sYear+sMonth+sDate;
			JSONArray jsonList = new JSONArray();
			JSONObject jsonOb = new JSONObject();
			Queue<RoomInfoVO> queue1=null;
				try {
					/* shillaSeoulRoomDAO */ SSRDAO = new RoomInfoDAO();
					queue1 = SSRDAO.getCallenderInfo(sFulldate,count);
					while(queue1.isEmpty()==false) {
						RoomInfoVO vo=queue1.poll();
						String rdate=vo.getRdate().toString();
						rdate=rdate.replace("-", "");
						rdate=rdate.replace(" 00:00:00", "");
						
						jsonOb=new JSONObject();
						jsonOb.put("rdate", rdate);
						jsonOb.put("StandardRoom", vo.getStandardRoom());
						jsonOb.put("SuiteRoom", vo.getSuiteRoom());
						jsonOb.put("ExecutiveRoom", vo.getExecutiveRoom());
						jsonOb.put("KoreanRoom", vo.getKoreanRoom());
						jsonList.add(jsonOb);
					}
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			out.print(jsonList);
			response.flushBuffer();
			break;
		case "/checkAvailability.do":
			/*String*/ dateIn = request.getParameter("date-in");
			/*String*/ dateOut = request.getParameter("date-out");
			/*String*/ roomType = request.getParameter("room-type");
			dateIn = dateIn.replace("-", "");
			dateOut = dateOut.replace("-", "");
//			shillaSeoulRoomDAO SSRDAO;
			try {
				SSRDAO = new RoomInfoDAO();
				if(SSRDAO.roomCheck(dateIn, dateOut, roomType)) {
					str="/booking/roomChecked.jsp";
					request.setAttribute("price", SSRDAO.getPrice(dateIn, dateOut, roomType));
				}else {
					str="/booking/noRoom.jsp";
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}	
			break;
		case "/insertReservation.do":
			response.setContentType("application/json; charset=utf-8");
								
			String payNumber=request.getParameter("payNumber");
			userID=request.getParameter("userID");
			userName=request.getParameter("userName");
			userTel=request.getParameter("userTel");
			String checkIn=request.getParameter("checkIn");
			String checkOut=request.getParameter("checkOut");
			String schedule=request.getParameter("schedule");
			int payAmount=Integer.parseInt(request.getParameter("payAmount"));
			/* String */ roomType=request.getParameter("roomType");
			checkIn = checkIn.replace("-", "");
			checkOut = checkOut.replace("-", "");
			try {
				SSRDAO = new RoomInfoDAO();
				SSRDAO.reserveRoom(checkIn,checkOut,roomType);
				BookingDAO rsvDAO = new BookingDAO();
				rsvDAO.insert(payNumber, userID, userName, userTel, checkIn, checkOut, schedule, payAmount, roomType);
				jsonOb=new JSONObject();
				jsonOb.put("result", "success");
				out.print(jsonOb);
			} catch (ClassNotFoundException | SQLException | ParseException e1) {
				e1.printStackTrace();
			}
			break;
		case "/reserveRoom.do":
			/*String*/ dateIn = request.getParameter("date-in");
			/*String*/ dateOut = request.getParameter("date-out");
			/*String*/ roomType = request.getParameter("room-type");
			dateIn = dateIn.replace("-", "");
			dateOut = dateOut.replace("-", "");
			try {
				/* shillaSeoulRoomDAO */ SSRDAO = new RoomInfoDAO();
				if(SSRDAO.roomCheck(dateIn,dateOut,roomType)) {
					str="booking/payAction.jsp";
				}else {
					str="booking/noRoom.jsp";
				}
			} catch (ClassNotFoundException | SQLException | ParseException e) {
				e.printStackTrace();
			}
			break;
		case "/reservation.do":
			response.setContentType("application/json; charset=utf-8");

			JSONArray jsonList1 = new JSONArray();
			JSONObject jsonOb1 = new JSONObject();
			Queue<BookingVO> queue2=null;
			System.out.println(request.getParameter("userID"));
			System.out.println(request.getParameter("userName"));
			System.out.println(request.getParameter("userTel"));
			try {
				BookingDAO bookingDAO = new BookingDAO();
				if(request.getParameter("userTel").equals("null")) {
					System.out.println("if");
					queue2 = bookingDAO.getBooking(request.getParameter("userID"));
				}else {
					queue2 = bookingDAO.getBooking(request.getParameter("userName"),request.getParameter("userTel"));
					System.out.println("else");
				}
				if(queue2.isEmpty()) {
					jsonOb1.put("nodata", "nodata");
					out.print(jsonOb1);
					response.flushBuffer();
					break;
				}
				while(queue2.isEmpty()==false) {
					BookingVO vo=queue2.poll();
					
					jsonOb1=new JSONObject();
					jsonOb1.put("payNumber", vo.getPayNumber());
					HttpSession session = request.getSession();
					String nonID = (String)session.getAttribute("language");
					System.out.println(nonID);
					if(nonID.equals("en")) {
						jsonOb1.put("userID", "Non-Member");
					}else {
						jsonOb1.put("userID", vo.getUserID());
					}
					jsonOb1.put("userName", vo.getUserName());
					jsonOb1.put("userTel", vo.getUserTel());
					jsonOb1.put("checkIn", vo.getCheckIn());
					jsonOb1.put("checkOut", vo.getCheckOut());
					jsonOb1.put("schedule", vo.getSchedule());
					jsonOb1.put("payAmount", vo.getPayAmount());
					jsonOb1.put("roomType", vo.getRoomType());
					
					jsonList1.add(jsonOb1);
				}
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			out.print(jsonList1);
			response.flushBuffer();
			break;
			
		case "/reservationAdmin.do":
			response.setContentType("application/json; charset=utf-8");

			JSONArray jsonList2 = new JSONArray();
			JSONObject jsonOb2 = new JSONObject();
			Queue<BookingVO> queue3=null;
			
			try {
				BookingDAO bookingDAO = new BookingDAO();
				
				queue3 = bookingDAO.getAllBooking();
					
				if(queue3.isEmpty()) {
					jsonOb2.put("nodata", "nodata");
					out.print(jsonOb2);
					response.flushBuffer();
					break;
				}
				while(queue3.isEmpty()==false) {
					
					BookingVO vo=queue3.poll();
					HttpSession session = request.getSession();
					String currentLang = (String)session.getAttribute("language");
					
					jsonOb2=new JSONObject();
					jsonOb2.put("payNumber", vo.getPayNumber());
					jsonOb2.put("userName", vo.getUserName());
					jsonOb2.put("userTel", vo.getUserTel());
					jsonOb2.put("checkIn", vo.getCheckIn());
					jsonOb2.put("checkOut", vo.getCheckOut());
					jsonOb2.put("payAmount", vo.getPayAmount());
					jsonOb2.put("roomType", vo.getRoomType());

					String day = vo.getSchedule().substring(0, 1);
					if(currentLang.equals("en")) {
						jsonOb2.put("userID", "Non-Member");
						jsonOb2.put("schedule", day+" Day");
					}else {
						jsonOb2.put("userID", vo.getUserID());
						jsonOb2.put("schedule", vo.getSchedule());
					}
					
					jsonList2.add(jsonOb2);
				}
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			out.print(jsonList2);
			response.flushBuffer();
			break;
		default:
			break;
		}	
		if(str!=null) {
			RequestDispatcher rd1 = request.getRequestDispatcher(str);
			rd1.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
