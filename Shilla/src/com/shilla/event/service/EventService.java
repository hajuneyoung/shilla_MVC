package com.shilla.event.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.event.criteria.Criteria;
import com.shilla.event.vo.EventVO;


public interface EventService {
	public ArrayList<EventVO> getAllEvent( Criteria cir ) throws ClassNotFoundException, SQLException;

	public void EventInsert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException;

	public EventVO getEvent(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public void EventUpdate(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException;

	public Object getEventForUpdate(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public void EventDelete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

	public int getTotal(Criteria cri) throws ClassNotFoundException, SQLException;
}
