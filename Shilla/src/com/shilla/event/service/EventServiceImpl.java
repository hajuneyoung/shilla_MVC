package com.shilla.event.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.event.criteria.Criteria;
import com.shilla.event.dao.EventDAO;
import com.shilla.event.vo.EventVO;

public class EventServiceImpl implements EventService {

	EventDAO edao = null;
	EventVO evo = null;
	ArrayList<EventVO> alist = null;

	@Override
	public ArrayList<EventVO> getAllEvent(Criteria cri) throws ClassNotFoundException, SQLException {
		
		edao = new EventDAO();

		return edao.getAllEvent(cri);
	}

	@Override
	public int getTotal(Criteria cri) throws ClassNotFoundException, SQLException {
	
		edao = new EventDAO();
		
		return edao.getTotalCount(cri);
	}

	@Override
	public void EventInsert(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		
		edao = new EventDAO();
		
		edao.EventInsert(request, response);
	}

	@Override
	public EventVO getEvent(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		
		edao = new EventDAO();
		
		return edao.getEvent(request,response);
	}

	@Override
	public void EventUpdate(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		
		
		edao = new EventDAO();
		
		edao.EventUpdate(request, response);
		
	}

	@Override
	public Object getEventForUpdate(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {

		edao = new EventDAO();
		
		return edao.getEventForUpdate(request, response);
	}

	@Override
	public void EventDelete(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		
		edao = new EventDAO();
		
		edao.EventDelete(request, response);
		
	}

}
