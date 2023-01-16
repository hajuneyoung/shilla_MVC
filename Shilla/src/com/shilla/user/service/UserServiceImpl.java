package com.shilla.user.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.user.dao.UserDAO;

public class UserServiceImpl implements UserService {

	UserDAO udao = null;
	
	@Override
	public int checkUsesrID(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		String CuserID = request.getParameter("userID");
		udao = new UserDAO();
		return udao.registerCheck(CuserID);
	}
	@Override
	public void userResgister(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userTel = request.getParameter("userTel");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		
		HttpSession session = request.getSession();
		String str = (String)session.getAttribute("language");
		if (userID == null || userID.equals("") || userPassword1 == null || userPassword1.equals("")
				|| userPassword2 == null || userPassword2.equals("") || userName == null || userName.equals("")
				|| userAge == null || userAge.equals("") || userTel == null || userTel.equals("")
				|| userGender == null || userGender.equals("") || userEmail == null || userEmail.equals("")) {
			if(str.equals("en")) {
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", "Please Enter all details");
				response.sendRedirect("join.jsp");
				return;
			}else if(str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
				response.sendRedirect("join.jsp");
				return;
			}
		}
		if (!userPassword1.equals(userPassword2)) {
			if(str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", " Invalid password. Please try again.");
				response.sendRedirect("join.jsp");
				return;
			}else if(str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
				response.sendRedirect("join.jsp");
				return;
			}
		}
		udao = new UserDAO();
		int result = udao.userinfo(userID, userPassword1, userName, userAge,userTel, userGender, userEmail);
		if (result == 1) {
			if(str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Success Message");
				request.getSession().setAttribute("messageContent", " Join Complete");
				response.sendRedirect("login.jsp");
				return;
			}else if(str.equals("ko")) {
				request.getSession().setAttribute("messageType", "성공 메세지");
				request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
				response.sendRedirect("login.jsp");
				return;
			}
		} else {
			if(str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", "Duplicate Member");
				response.sendRedirect("join.jsp");
				return;
			}else if(str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
				response.sendRedirect("join.jsp");
				return;
			}
		}
	}

}
