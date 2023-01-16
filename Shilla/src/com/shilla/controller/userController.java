package com.shilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.user.dao.UserDAO;
import com.shilla.user.service.UserService;
import com.shilla.user.service.UserServiceImpl;
import com.shilla.user.vo.UserVO;

/* Description: 
   Author: 하준영 */
@WebServlet(urlPatterns = {"/user/UserRegisterCheckServlet.do",
							"/user/userRegister.do",
							"/user/userLoginAction.do",
							"/user/userDeleteAction.do"})
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public userController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		UserService userService = null;
		
		switch (c) {
		case "/user/UserRegisterCheckServlet.do": // 중복체크
			userService = new UserServiceImpl();
			try {
				response.getWriter().write(userService.checkUsesrID(request,response) + "");
			} catch (ClassNotFoundException | IOException | SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "/user/userRegister.do": // insert
			userService = new UserServiceImpl();
			try {
				userService.userResgister(request,response);
			} catch (ClassNotFoundException | SQLException | IOException e) {
				e.printStackTrace();
			}
			break;
		case "/user/userLoginAction.do": 
			HttpSession session = request.getSession();
			String userID = request.getParameter("userID");
			String userPW = request.getParameter("userPassword");
			String lang = (String)session.getAttribute("language");
			PrintWriter script = response.getWriter();
			
			UserDAO userDAO = null;
			try {
				userDAO = new UserDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			int result = userDAO.login(userID, userPW);
			if (result == 1) {
				UserVO userVO = userDAO.getUser(userID);
				session.setAttribute("userID", userVO.getUserID());
				session.setAttribute("userName", userVO.getUserName());
				session.setAttribute("userTel", userVO.getUserTel());
				script.println("<script>");
				if(lang.equals("en")){
					script.println("alert('Successful Login')");
				}else if(lang.equals("ko")){
					script.println("alert('로그인에 성공하였습니다.')");
				}
				script.println("location.href = '../index.jsp'");
				script.println("</script>");
				System.out.println("로그인 성공");
			} else if (result == 0) {
				script.println("<script>");
				if(lang.equals("en")){
					script.println("alert('Invalid password. Please try again.')");
				}else if(lang.equals("ko")){
					script.println("alert('비밀번호가 틀립니다.')");
				}
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				System.out.println("로그인 실패");
			} else if (result == -1) {
				script.println("<script>");
				if(lang.equals("en")){
					script.println("alert('ID does not exist.')");
				}else if(lang.equals("ko")){
					script.println("alert('존재하지 않는 아이디입니다.')");
				}
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				System.out.println("로그인 실패");
			} else if (result == -2) {
				script.println("<script>");
				if(lang.equals("en")){
					script.println("alert('An unknown error. Please contact the administrator.')");
				}else if(lang.equals("ko")){
					script.println("alert('알 수 없는 오류 발생. 관리자에게 문의해주세요')");
				}
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				System.out.println("로그인 실패");
				response.sendRedirect("login.jsp");
			}
			break;
		case "/user/userDeleteAction.do":
			HttpSession session2 = request.getSession();
			String id = (String)session2.getAttribute("userID");
			String pw = request.getParameter("password");
			String currentLang = (String)session2.getAttribute("language");
			System.out.println(id);
			System.out.println(pw);
			System.out.println(currentLang);
			PrintWriter script2 = response.getWriter();

			UserDAO dao = null;
			try {
				dao = new UserDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} 
			int check = dao.login(id,pw);
			if (check == 1) { // 비밀번호가 일치
				boolean check2 = dao.deleteUser(id);
				if(currentLang.equals("en")) {
					script2.println("alert('Delete Completed')");
				}else {
					script2.println("alert('회원 탈퇴가 정상처리되었습니다.')");
				}
				session2.invalidate();
				script2.println("location.href = '../index.jsp'");
			}else { // 비밀번호 불일치
				if(currentLang.equals("en")) {
					script2.println("alert('Error. Please contact the administrator.')");
				}else {
					script2.println("alert('회원 탈퇴에 실패했습니다.')");
				}
				script2.println("location.href = 'userDelete.jsp'");
			}
			break;
		default:
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
