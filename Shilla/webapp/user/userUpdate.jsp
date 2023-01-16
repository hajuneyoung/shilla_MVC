<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="com.shilla.user.vo.*"%>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Sona Template">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="author" content="준영">
	<title>SHILLA STAY GANGSEO</title>
	<script type="text/javascript">
		function check() { // 동작 어디서?
			if (document.fr.userPassword.value == "") {
				var en = document.getElementById("en");
				if(en != null){
					alert("Please Enter yout Password");
				}else{
					alert("비밀번호를 입력해주세요.");
				}
				document.fr.userPassword.focus();
				return false;
			}
		}
	</script>
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="../section/header.jsp"></jsp:include>
	<%
		String userID = (String) session.getAttribute("userID");
		if (userID == null)
		response.sendRedirect("login.jsp");

		UserDAO dao = new UserDAO();
		UserVO udto = dao.getUser(userID);
	%>
	<section class="hero-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="hero-text">
						<!-- ====== 메인 문구 ===== -->
						<h1>SHILLA STAY GANGSEO</h1>
						<h4 id="homeTxt" data-lang="home_text_before"></h4>
						<h4 id="homeTxt" data-lang="home_text_after"></h4>
					</div>
				</div>
				<div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
					<div class="booking-form">
						<fieldset>
							<legend data-lang="account_edit"></legend>
							<form action="userUpdate-Action.jsp" method="post" name="fr"
							onsubmit="return check()">
								<span data-lang="id"></span> : <input type="text" name="userID"
									value="<%=udto.getUserID()%>" readonly="readonly"><br>
								<span data-lang="pw"></span> : <input type="password" name="userPassword"><br> 
								<span data-lang="name"></span> : <input
									type="text" name="userName" value="<%=udto.getUserName()%>"><br>
								<span data-lang="age"></span> : <input type="text" name="userAge"
									value="<%=udto.getUserAge()%>"><br> 
								<span data-lang="tel"></span> : <input
									type="text" name="userTel" value="<%=udto.getUserTel()%>"><br>
								<span data-lang="gender"></span> : 
								<input type="radio" name="gender" value="여자"
									<%if (udto.getUserGender().equals("여자")) {%> checked <%}%>>
								<span data-lang="woman"></span><input type="radio" name="gender" value="남자"
									<%if (udto.getUserGender().equals("남자")) {%> checked <%}%>>
								<span data-lang="man"></span><br> 
								<span data-lang="email"></span> : <input type="text" name="userEmail"
									value="<%=udto.getUserEmail()%>"><br> 
								<input type="submit" id="editBtn" value="회원수정">
								<input type="reset" id="cxlBtn" value="취소">
							</form>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
		<div class="hero-slider owl-carousel">
		<!-- ********* 상단 슬라이드 이미지(640x426) ************** -->
			<div class="hs-item set-bg" data-setbg="../img/index/pool.jpg"></div>
			<div class="hs-item set-bg" data-setbg="../img/index/inside.jpg"></div>
			<div class="hs-item set-bg" data-setbg="../img/index/hotel-night.jpg"></div>
		</div>
	</section>
	<jsp:include page="../section/footer.jsp"></jsp:include>

	<!-- Js Plugins -->
	<script src="../js/language.js"></script> <!-- ********* 다국어 처리 추가 ********* -->
	<script src="../js/language-en.js"></script>
	<script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</body>

</html>