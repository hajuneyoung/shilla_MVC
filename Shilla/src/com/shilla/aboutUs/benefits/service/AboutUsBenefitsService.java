package com.shilla.aboutUs.benefits.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;

public interface AboutUsBenefitsService {

	public ArrayList<AboutUsBenefitsVO> getBenefits() throws ClassNotFoundException, SQLException;

	public void UpdateBenefits(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException;

}
