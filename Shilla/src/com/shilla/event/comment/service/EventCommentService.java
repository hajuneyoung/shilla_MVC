package com.shilla.event.comment.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.event.comment.vo.EventCommentVO;

public interface EventCommentService {

	public void insertComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public ArrayList<EventCommentVO> getEventComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public void insertCommentComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public void deleteCommentParent(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

}
