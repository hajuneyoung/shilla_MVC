package com.shilla.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* Description: traslate(English/Korean) controller
   Author: 이미나 */
@WebServlet(urlPatterns = {"/setKo.do",
							"/setEn.do",
							"/setLang.do"})
public class languageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public languageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rcv
		= request.getRequestURI().substring(request.getContextPath().length());
		
		String path = null;
		switch(rcv) {
			case "/setKo.do":
				HttpSession session = request.getSession();
				session.setAttribute("language", "ko");
				path = "index.jsp";
				break;
			case "/setEn.do":
				HttpSession session2 = request.getSession();
				session2.setAttribute("language", "en");
				System.out.println("setEn 들어옴");
				path = "index.jsp";
				break;
			case "/setLang.do": 
				HttpSession session5 = request.getSession();
				if(request.getSession().getAttribute("language").equals("ko")) {
					  if(request.getSession().getAttribute("userID") != null) {
						  response.sendRedirect("contactUs/inquiries-loginKo.html");
						  return;
					  }else { 
						  response.sendRedirect("contactUs/inquiries-ko.html");
						  return;
					  }
					//path = "inquiries-ko.html";
					//break;
				}
				else {
					if(request.getSession().getAttribute("userID") != null) {
						  response.sendRedirect("contactUs/inquiries-loginEn.html");
						  return;
					}else { 
						response.sendRedirect("contactUs/inquiries-en.html");
						return;
					}
					//path = "inquiries-en.html";
					//break;
				}
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
