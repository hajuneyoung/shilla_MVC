package com.shilla.event.comment.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.event.comment.dao.EventCommentDAO;
import com.shilla.event.comment.vo.EventCommentVO;

public class EventCommentServiceImpl implements EventCommentService {

	private EventCommentDAO ecdao = null;
	
	@Override
	public void insertComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
		ecdao = new EventCommentDAO();
		
		ecdao.insertComment(request, response);
		
	}

	@Override
	public void insertCommentComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		
		ecdao = new EventCommentDAO();
		
		ecdao.insertCommentComment(request, response);
		
	}
	
	@Override
	public ArrayList<EventCommentVO> getEventComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		
		ecdao = new EventCommentDAO();
		
		return ecdao.getEventComment(request, response);
		
	}

	@Override
	public void deleteCommentParent(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {

		ecdao = new EventCommentDAO();
		
		ecdao.deleteCommentParent(request,response);
		
	}

	@Override
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {

		ecdao = new EventCommentDAO();
		
		ecdao.deleteComment(request,response);
	}

}
