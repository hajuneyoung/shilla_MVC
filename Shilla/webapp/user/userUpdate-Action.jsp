<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="com.shilla.user.vo.*"%>
<!DOCTYPE html>
<html>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
<meta charset="UTF-8">
<meta name="author" content="준영">
<title>SHILLA STAY GANGSEO</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String userID = (String) session.getAttribute("userID");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userTel = request.getParameter("userTel");
		String userGender = request.getParameter("gender");
		String userEmail = request.getParameter("userEmail");

		UserVO user = new UserVO();
		user.setUserID(userID);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setUserAge(userAge);
		user.setUserTel(userTel);
		user.setUserGender(userGender);
		user.setUserEmail(userEmail);

		UserDAO dao = new UserDAO();
		boolean check = dao.updateUser(user);
		if (check) {
			session.setAttribute("userID", user.getUserID());
%>
	<script>
		var en = document.getElementById("en");
		if(en != null){
			alert("Update Completed");
		}else{
			alert("회원정보가 정상적으로 수정되었습니다.");
		}
		location.href = "../index.jsp";
	</script>
<%
		} else {
%>
	<script>
		if(en != null){
			alert("Please Check your Profile again");
		}else{
			alert("회원정보 수정에 실패했습니다.");
		}
		location.href = "userUpdate.jsp";
	</script>
<%
		}
%>
</body>
</html>