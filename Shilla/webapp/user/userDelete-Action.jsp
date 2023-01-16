<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="com.shilla.user.vo.*"%>
<!DOCTYPE html>
<html>
<span hidden="hidden" id="<%=session.getAttribute("language")%>"></span>
<!-- 해당 정보를 language.js에 넘긴다 -->
<head>
<meta charset="UTF-8">
<meta name="author" content="준영">
<title>SHILLA STAY GANGSEO</title>
</head>
<body>
	<%
	String userID = (String) session.getAttribute("userID");
	
	String pw = request.getParameter("password");

	UserDAO dao = new UserDAO();
	int check = dao.login(userID,pw);
	if (check == 1) {
		boolean check2 = dao.deleteUser(userID);
		session.invalidate();
	%>
	<script>
		var en = document.getElementById("en");
		if (en != null) {
			alert("Delete Completed");
		} else {
			alert("회원 탈퇴가 정상처리되었습니다.");
		}
		location.href = '../index.jsp';
	</script>
	<%
		} else {
	%>
	<script>
		var en = document.getElementById("en");
		if (en != null) {
			alert("Error. Please contact the administrator.");
		} else {
			alert("회원 탈퇴에 실패했습니다.");
		}
		location.href = 'userDelete.jsp';
	</script>
	<%
		}
	%>
</body>
</html>