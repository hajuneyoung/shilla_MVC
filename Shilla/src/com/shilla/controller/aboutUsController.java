package com.shilla.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.aboutUs.benefits.service.AboutUsBenefitsService;
import com.shilla.aboutUs.benefits.service.AboutUsBenefitsServiceImpl;
import com.shilla.aboutUs.service.AboutUsService;
import com.shilla.aboutUs.service.AboutUsServiceImpl;

/* Description: 
   Author: 윤두성 */
@WebServlet(urlPatterns = {"/aboutUs/getAboutUs.do",
							"/aboutUs/AboutUsUpdateFrom.do",
							"/aboutUs/AboutUsBenefitsUpdateFrom.do",
							"/aboutUs/aboutUsUpdate.do",
							"/aboutUs/benefitsUpdate.do"})
public class aboutUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public aboutUsController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(c);
		String goPage = "";
		AboutUsService aboutUsService = null;
		AboutUsBenefitsService aboutUsBenefitsService = null;
		
		switch(c) {
		case "/aboutUs/getAboutUs.do": // header 연결
			aboutUsService =  new AboutUsServiceImpl();
			aboutUsBenefitsService = new AboutUsBenefitsServiceImpl();
			try {
				//본문 내용 불러오기
				request.setAttribute("AUvo1", aboutUsService.getAboutUs());
				//Benefits 불러오기
				request.setAttribute("AUBlist1", aboutUsBenefitsService.getBenefits());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			//goPage = "/aboutUs/aboutUs-Admin.jsp"; // 수정 예정 : admin/client 분류 예정
			//System.out.println(request.getSession().getAttribute("userID"));
			if(request.getSession().getAttribute("userID") == null) {
				goPage = "aboutUs.jsp";
			}else if(request.getSession().getAttribute("userID").equals("admin")) {
				goPage = "aboutUs-Admin.jsp";
			}else {
				goPage = "aboutUs.jsp";
			}
			
			break;
		//수정폼으로 수정할 정보 불러오기
		case "/aboutUs/AboutUsUpdateFrom.do":
			aboutUsService =  new AboutUsServiceImpl();
			aboutUsBenefitsService = new AboutUsBenefitsServiceImpl();
			try {
				//본문 내용
				request.setAttribute("AUvo1", aboutUsService.getAboutUs());
				//benefits 
				request.setAttribute("AUBlist1", aboutUsBenefitsService.getBenefits());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/aboutUs/aboutUs-AdminUpdateFrom.jsp";
			break;
		//수정폼으로 수정할 정보 불러오기
		case "/aboutUs/AboutUsBenefitsUpdateFrom.do":
			aboutUsService =  new AboutUsServiceImpl();
			aboutUsBenefitsService = new AboutUsBenefitsServiceImpl();
			try {
				//본문 내용 불러오기
				request.setAttribute("AUvo1", aboutUsService.getAboutUs());
				//Benefits 불러오기
				request.setAttribute("AUBlist1", aboutUsBenefitsService.getBenefits());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			goPage = "/aboutUs/aboutUs-AdminBenefitsFrom.jsp";
			break;
		/*
		 * ==Update 부분 controller / UPDATE sql==============================================================================	
		 */
		//aboutUs 내용 Update
		case "/aboutUs/aboutUsUpdate.do":
			aboutUsService = new AboutUsServiceImpl();
			try {
				aboutUsService.UpdateAboutUs(request,response);
			} catch (ClassNotFoundException | IOException | SQLException e) {
				e.printStackTrace();
			}
			goPage="getAboutUs.do";
			break;
		//benefits 업데이트
		case "/aboutUs/benefitsUpdate.do":
			aboutUsBenefitsService = new AboutUsBenefitsServiceImpl();
			try {
				aboutUsBenefitsService.UpdateBenefits(request,response);
			} catch (ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			goPage="getAboutUs.do";
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
