<%@page import="com.shilla.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@page import="com.shilla.user.dao.*"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.shilla.user.vo.UserVO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<% session.setAttribute("pw", user.getUserPassword()); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="author" content="준영">
	<title>SHILLA STAY GANGSEO</title>
</head>
<body>
<%
		String userID = null;
	String lang = (String)session.getAttribute("language");
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	 if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
	} 
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	out.println(result);
	if (result == 1) {
		UserVO userVO = userDAO.getUser(user.getUserID());
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userName", userVO.getUserName());
		session.setAttribute("userTel", userVO.getUserTel());
		PrintWriter script = response.getWriter();
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
		PrintWriter script = response.getWriter();
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
		PrintWriter script = response.getWriter();
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
		PrintWriter script = response.getWriter();
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
%>
</body>
</html>