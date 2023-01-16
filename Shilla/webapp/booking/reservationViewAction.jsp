<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	if(session.getAttribute("userID")==null){
		response.sendRedirect("reservationNonmember.jsp");
	}else if(session.getAttribute("userID").equals("admin")){
		response.sendRedirect("reservationViewAdmin.jsp");
	}else{
		response.sendRedirect("reservationView.jsp");
	}
%>
</head>
<body>

</body>
</html>