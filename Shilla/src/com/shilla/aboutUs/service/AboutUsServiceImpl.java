package com.shilla.aboutUs.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.aboutUs.dao.AboutUsDAO;
import com.shilla.aboutUs.vo.AboutUsVO;

public class AboutUsServiceImpl implements AboutUsService {
	
	private AboutUsDAO audao = null;
	private AboutUsVO auvo = null;
	
	@Override
	public AboutUsVO getAboutUs() throws SQLException, ClassNotFoundException {
		
		audao = new AboutUsDAO();
		
		auvo = audao.getAboutUs();
		
		return auvo;
	}

	@Override
	public void UpdateAboutUs(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		audao = new AboutUsDAO();
		
		audao.Update(request,response);
	}

}
