<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<meta name="author" content="준영">
<title>SHILLA STAY GANGSEO</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-exaple-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span><span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../index.jsp" data-lang="home"></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-exaple-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="join.jsp" data-lang="join"></a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="../user/userLoginAction.do">
					<h3 style="text-align: center;" data-lang="로그인"></h3>
					<div class="form-group">
						<h6 data-lang="id"></h6>
						<input type="text" class="form-control" 
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<h6 data-lang="pw"></h6>
						<input type="password" class="form-control" 
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인" id="loginBtn">
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

	<!-- Js Plugins -->
	<script src="../js/language.js"></script> 
	<script src="../js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->
	<script src="../js/jquery-3.3.1.min.js"></script>
</body>
</html>