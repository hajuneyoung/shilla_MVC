<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.*"%>
<!DOCTYPE html>
<html lang="ko">
<% String userID = (String) pageContext.getSession().getAttribute("userID"); %>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<meta charset="UTF-8">
	<meta name="description" content="userDelete(회원탈퇴)">
	<meta name="author" content="준영">
	<title>SHILLA STAY GANGSEO</title>
	
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
	<script type="text/javascript">
		function checkValue() {
			if (!document.deleteform.password.value) {
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="../section/header.jsp"></jsp:include>

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
						<br><br><b><legend data-lang="pw_check"></legend></b><br><br><br>
						<form name="deleteform" method="post" action="userDelete-Action.jsp"
							onsubmit="return checkValue()">
							<table>
								<tr>
									<td bgcolor="white" data-lang="pw"></td>
									<td><input type="password" name="password" maxlength="50"></td>
								</tr>
							</table>
							<br> <input type="submit" id="delBtn" value="탈퇴"/> 
							<input type="button" id="cxlBtn" value="취소" onclick="location='../index.jsp'">
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