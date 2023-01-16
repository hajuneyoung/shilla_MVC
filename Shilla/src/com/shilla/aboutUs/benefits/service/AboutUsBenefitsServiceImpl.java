package com.shilla.aboutUs.benefits.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.aboutUs.benefits.dao.AboutUsBenefitsDAO;
import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;

public class AboutUsBenefitsServiceImpl implements AboutUsBenefitsService{
	
	AboutUsBenefitsDAO aubdao = null;
	
	@Override
	public ArrayList<AboutUsBenefitsVO> getBenefits() throws ClassNotFoundException, SQLException {
			
		aubdao = new AboutUsBenefitsDAO();
			
		return aubdao.getBenefits();
	}

	@Override
	public void UpdateBenefits(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {

		aubdao = new AboutUsBenefitsDAO();
		
		aubdao.UpdateBenefits(request,response);
	}

}
