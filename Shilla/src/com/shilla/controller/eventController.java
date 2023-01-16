package com.shilla.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.event.comment.service.EventCommentService;
import com.shilla.event.comment.service.EventCommentServiceImpl;
import com.shilla.event.criteria.Criteria;
import com.shilla.event.pageDTO.PageDTO;
import com.shilla.event.service.EventService;
import com.shilla.event.service.EventServiceImpl;

/* Description: 
   Author: 윤두성 */
@WebServlet(urlPatterns = {"/event/getAllEvent.do",
							"/event/getEvent.do",
							"/event/eventUpdateFrom.do",
							"/event/eventInsert.do",
							"/event/eventUpdate.do",
							"/event/eventDelete.do",
							"/event/eventCommentInsert.do",
							"/event/eventCommentCommentInsert.do",
							"/event/deleteCommentParent.do",
							"/event/deleteComment.do"})
public class eventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public eventController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println(request.getRequestURI());
		System.out.println(request.getContextPath());
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		String goPage = "";
		EventService eventService = null;
		EventCommentService eventCommentService = null;
		
		switch(c) {
		case "/event/getAllEvent.do": // header 연결
			eventService = new EventServiceImpl();
			
			Criteria cri = new Criteria(1,3);
			
			int total = 0;
			int pageNum = 1;
			int amount	= 6;
			
			if(request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			
			if(request.getParameter("amount")!= null) {
				amount = Integer.parseInt(request.getParameter("amount"));
			}
			
			cri.setPageNum(pageNum);
			cri.setAmount(amount);
			
			
			
			try {
				request.setAttribute("boardlist", eventService.getAllEvent(cri));
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			try {
				total = eventService.getTotal(cri);
			} catch (ClassNotFoundException | SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

				request.setAttribute("pageMaker", new PageDTO(cri, total));
			
			if(request.getSession().getAttribute("userID") == null) {
				goPage = "/event/event.jsp";
			}else if(request.getSession().getAttribute("userID").equals("admin")) {
				goPage="/event/eventAdmin.jsp";
			}else {
				goPage = "/event/event.jsp";
			}
			
			//goPage="/event/event.jsp"; // 수정 예정 : admin/client 분류 예정
			
			
			break;
			
		//한개
		case "/event/getEvent.do":
			eventService = new EventServiceImpl();
			eventCommentService = new EventCommentServiceImpl();
			try {
				//본문 읽어오기
				request.setAttribute("vo1", eventService.getEvent(request,response));
				//댓글 부분 읽어오기
				request.setAttribute("commentlist", eventCommentService.getEventComment(request,response));
				//댓글 수 체크하기
				request.setAttribute("comments_count", eventCommentService.getEventComment(request,response).size());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage="/event/event-details.jsp";
			break;
		//수정폼으로 수정할 정보 불러오기
		case "/event/eventUpdateFrom.do":
			eventService = new EventServiceImpl();
			try {
				request.setAttribute("vo1", eventService.getEventForUpdate(request,response));
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			goPage="/event/eventAdminUpdateFrom.jsp";
			break;
		/*
		 * ==Create 부분 controller / Insert sql=============================================================================
		 */	
		// 새로작성
		case "/event/eventInsert.do":
			eventService = new EventServiceImpl();
			try {
				eventService.EventInsert(request,response);
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
			}
			// goPage = "getAllEvent.do";
			goPage = "getAllEvent.do";
			break;
		/*
		 * ==Update 부분 controller / Update sql=============================================================================
		 */	
		case "/event/eventUpdate.do":
			eventService = new EventServiceImpl();
			try {
				eventService.EventUpdate(request,response);
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
			}
			goPage = "getAllEvent.do";
			break;
		/*
		 * ==Delete 부분 controller / Delete sql=============================================================================
		 */	
		case "/event/eventDelete.do":
			eventService = new EventServiceImpl();
			try {
				eventService.EventDelete(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "getAllEvent.do";
			break;
		/*
		 * ===============================================Event Comment 부분================================================
		 * ==Insert 부분 controller / Insert sql==============================================================================
		 */
		//댓글 부분
		case "/event/eventCommentInsert.do":
			eventCommentService = new EventCommentServiceImpl();
			try {
				eventCommentService.insertComment(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/event/getEvent.do";
			break;
		//대댓글 부분
		case "/event/eventCommentCommentInsert.do":
			eventCommentService = new EventCommentServiceImpl();
			try {
				eventCommentService.insertCommentComment(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/event/getEvent.do";
			break;
		/*
		 * ==Delete 부분 controller / Delete sql=============================================================================
		 */	
		//상위 댓글 삭제
		case "/event/deleteCommentParent.do" :
			eventCommentService = new EventCommentServiceImpl();
			try {
				eventCommentService.deleteCommentParent(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/event/getEvent.do";
			break;
		//하위 댓글 삭제
		case "/event/deleteComment.do":
			eventCommentService = new EventCommentServiceImpl();
			try {
				eventCommentService.deleteComment(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/event/getEvent.do";
			break;
		default :
			break;
		}
		RequestDispatcher rd = request.getRequestDispatcher(goPage);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
