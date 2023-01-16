<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span>
<script>
	var en = document.getElementById("en");
	if(en != null){
		alert("Successful Logout. Thank you.");
	}else{
		alert("로그아웃 되었습니다. 감사합니다.");
	}
	location.href = '../index.jsp';
</script>
<% System.out.println("로그아웃 성공"); %>
<% session.invalidate(); %>