<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.vo.*"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="java.util.Locale"%>
<!DOCTYPE html>
<html lang="ko">
<% String userID = (String) pageContext.getSession().getAttribute("userID"); 
   String currentLang = (String)session.getAttribute("language");
   if(currentLang == null)
	   session.setAttribute("language", "ko");
%>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<meta charset="UTF-8">
	<meta name="description" content="index(start page)">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SHILLA STAY GANGSEO</title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="css/flaticon.css" type="text/css">
	<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- Offcanvas Menu Section Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="canvas-open">
        <i class="icon_menu"></i>
    </div>
    <div class="offcanvas-menu-wrapper">
        <div class="canvas-close">
            <i class="icon_close"></i>
        </div>
        <div class="header-configure-area">
            <div class="language-option">
                <span data-lang="language"><i class="fa fa-angle-down"></i></span>
                 <div class="flag-dropdown">
                      <ul><!-- ********** 모바일 화면 언어 설정 ********** -->
                      	<li id="lang-en"><a href="setEn.do">English</a></li>
                      	<li id="lang-ko"><a href="setKo.do">한국어</a></li>
                      </ul>
                 </div>
            </div>
            <a href="booking/booking.jsp" class="bk-btn" data-lang="booking_btn"></a>
            <a href="booking/reservationViewAction.jsp" class="bk-btn" data-lang="booking_check"></a>
        </div>
        <nav class="mainmenu mobile-menu">
            <ul>
                <li class="active"><a href="index.jsp" data-lang="home"></a></li>
                <li><a href="aboutUs/getAboutUs.do" data-lang="about_us"></a>
					<ul class="dropdown">
						<li><a href="aboutUs/getAboutUs.do" data-lang="about_us"></a></li>
						<li><a href="aboutUs/rooms.jsp" data-lang="rooms"></a></li>
					</ul>
				</li>
                <li><a href="event/getAllEvent.do" data-lang="event"></a></li>
                <li><a href="contactUs/contact.jsp" data-lang="contact_us"></a>
                	<ul class="dropdown">
                		<li><a href="contactUs/contact.jsp" data-lang="contact"></a></li>
                		<li><a href="setLang.do" data-lang="inquiries"></a></li>
                	</ul>
                </li>
                <% if (userID == null) { %>
				<% } else { %>
				<li><a href="user/userInfo.jsp" data-lang="account"></a>
					<ul class="dropdown">
						<li><a href="user/userInfo.jsp" data-lang="account_info"></a></li>
						<li><a href="user/userUpdate.jsp" data-lang="account_edit"></a></li>
						<li><a href="user/userDelete.jsp" data-lang="account_delete"></a></li>
						<li><a href="user/userLogout.jsp" data-lang="logout"></a></li>
					</ul></li>
				<% } %>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="top-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-tripadvisor"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
        </div>
        <ul class="top-widget">
            <li><i class="fa fa-phone"></i><span data-lang="hotel_tel"></span></li>
            <li><i class="fa fa-envelope"></i> shillastay@gmail.com</li>
        </ul>
    </div>
    <!-- Offcanvas Menu Section End -->

    <!-- Header Section Begin -->
    <header class="header-section header-normal">
        <div class="top-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <!-- ***************** top 연락처(pc) ***************** -->
                        <ul class="tn-left">
                            <li><i class="fa fa-phone"></i><span data-lang="hotel_tel"></span></li>
                            <li><i class="fa fa-envelope"></i> shillastay@gmail.com</li>
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                            <a href="booking/booking.jsp" class="bk-btn" data-lang="booking_btn"></a>
                            <a href="booking/reservationViewAction.jsp" class="bk-btn" data-lang="booking_check"></a>
                            <div class="language-option">
                                <!-- ============================= pc 언어 설정 ====================================== -->                           
                                <span data-lang="language"><i class="fa fa-angle-down"></i></span>
                                <div class="flag-dropdown">
                                    <ul>
                                    	<li id="lang-en"><a href="setEn.do">English</a></li>
                                    	<li id="lang-ko"><a href="setKo.do">한국어</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="logo">
                            <img alt="" src="img/shilla-logo.png">THE SHILLA 
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul id="header">
                                    <li class="active"><a href="index.jsp" data-lang="home"></a></li>
									<li><a href="aboutUs/getAboutUs.do" data-lang="about_us"></a>
										<ul class="dropdown">
											<li><a href="aboutUs/getAboutUs.do" data-lang="about_us"></a></li>
											<li><a href="aboutUs/rooms.jsp" data-lang="rooms"></a></li>
										</ul>
									</li>
									<li><a href="event/getAllEvent.do" data-lang="event"></a></li>
					                <li><a href="contactUs/contact.jsp" data-lang="contact_us"></a>
					                	<ul class="dropdown">
					                		<li><a href="contactUs/contact.jsp" data-lang="contact"></a></li>
					                		<li><a href="setLang.do" data-lang="inquiries"></a></li> 
					                	</ul>
					                </li>
									<% if (userID == null) { %>
									<% } else { %>
									<li><a href="user/userInfo.jsp" data-lang="account"></a>
										<ul class="dropdown">
											<li><a href="user/userInfo.jsp" data-lang="account_info"></a></li>
											<li><a href="user/userUpdate.jsp" data-lang="account_edit"></a></li>
											<li><a href="user/userDelete.jsp" data-lang="account_delete"></a></li>
											<li><a href="user/userLogout.jsp" data-lang="logout"></a></li>
										</ul></li>
									<% } %>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
	<!-- Hero Section Begin -->
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
					<!-- ====== 메인 로그인 폼 ===== -->
					<% if (userID == null) { %>
					<div class="booking-form">
						<form action="#">
							<div class="check-date"></div>
							<div class="check-date"></div>
							<button type="button" onclick="location.href='user/login.jsp'" data-lang="login"></button>
							<button type="button" onclick="location.href='user/join.jsp'" data-lang="join"></button>
						</form>
					</div>
					<% } else { %>
					<% } %>
				</div>
			</div>
		</div><!-- ========== -->

		<div class="hero-slider owl-carousel">
		<!-- ********* 상단 슬라이드 이미지(640x426) ************** -->
			<div class="hs-item set-bg" data-setbg="img/index/pool.jpg"></div>
			<div class="hs-item set-bg" data-setbg="img/index/inside.jpg"></div>
			<div class="hs-item set-bg" data-setbg="img/index/hotel-night.jpg"></div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- About Us Section Begin -->
	<section class="aboutus-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="about-text">
						<div class="section-title">
							<span data-lang="about_us"></span>
							<h2> SHILLA STAY GANGSEO </h2>
						</div>
						<p class="f-para" data-lang="about_us_stay"></p>
						<a href="aboutUs/aboutUs.jsp" class="primary-btn about-btn" data-lang="read_more"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="about-pic">
						<div class="row">
						<!-- ========= 메인 about-us 호텔 이미지(480x640) ========= -->
							<div class="col-sm-6">
								<img src="img/index/hotel-winter.jpg" alt="호텔 전경">
							</div>
							<div class="col-sm-6">
								<img src="img/index/hotel-cafe.jpg" alt="호텔 식당">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Us Section End -->

	<!-- Home Room Section Begin -->
	<section class="hp-room-section">
		<div class="container-fluid">
			<div class="hp-room-items">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="hp-room-item set-bg" data-setbg="img/about/standard.jpg">
							<div class="hr-text">
								<h3 data-lang="room_standard"></h3><!-- 스탠다드 룸 -->
								<br><br><br>
								<table>
									<tbody>
										<tr>
											<td class="r-o" data-lang="room_location"></td>
											<td>3~16F</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_size"></td>
											<td>24m²</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_detail_sub"></td>
											<td data-lang="room_detail_con"></td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_service_sub"></td>
											<td data-lang="room_service_con"></td>
										</tr>
									</tbody>
								</table>
								<a href="aboutUs/room-standard.jsp" class="primary-btn" data-lang="read_more"></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6"><!-- 스위트 룸 -->
						<div class="hp-room-item set-bg" data-setbg="img/about/suite.jpg">
							<div class="hr-text">
								<h3 data-lang="room_suite"></h3>
								<br><br><br>
								<table>
									<tbody>
										<tr>
											<td class="r-o" data-lang="room_location"></td>
											<td>17~26F</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_size"></td>
											<td>26m²</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_detail_sub"></td>
											<td data-lang="room_detail_con"></td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_service_sub"></td>
											<td data-lang="room_service_con"></td>
										</tr>
									</tbody>
								</table>
								<a href="aboutUs/room-suite.jsp" class="primary-btn" data-lang="read_more"></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6"><!-- 이그제큐티브 룸 -->
						<div class="hp-room-item set-bg" data-setbg="img/about/executive.jpg">
							<div class="hr-text">
								<h3 data-lang="room_executive"></h3>
								<br><br><br>
								<table>
									<tbody>
										<tr>
											<td class="r-o" data-lang="room_location"></td>
											<td>19F</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_size"></td>
											<td>35m²</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_detail_sub"></td>
											<td data-lang="room_detail_con"></td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_service_sub"></td>
											<td data-lang="room_service_con"></td>
										</tr>
									</tbody>
								</table>
								<a href="aboutUs/room-executive.jsp" class="primary-btn" data-lang="read_more"></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6"><!-- 온돌 룸 -->
						<div class="hp-room-item set-bg" data-setbg="img/about/korean.jpg">
							<div class="hr-text">
								<h3 data-lang="room_korean"></h3>
								<br><br>
								<table>
									<tbody>
										<tr>
											<td class="r-o" data-lang="room_location"></td>
											<td>23~26F</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_size"></td>
											<td>50m²</td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_detail_sub"></td>
											<td data-lang="room_detail_con2"></td>
										</tr>
										<tr>
											<td class="r-o" data-lang="room_service_sub"></td>
											<td data-lang="room_service_con"></td>
										</tr>
									</tbody>
								</table>
								<a href="aboutUs/room-korean.jsp" class="primary-btn" data-lang="read_more"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Home Room Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-text">
				<div class="row">
					<div class="col-lg-4">
						<div class="ft-about">
							<div class="logo-footer"> 
                                SHILLA
                            </div>
                            <p data-lang="home_footer_text"></p>
                            <div class="fa-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<div class="ft-contact">
							<!-- *********** (하단) 호텔 위치 및 연락처 안내 *********** -->
                            <h6 data-lang="location_title"></h6>
                            <ul>
                                <li data-lang="location_content"></li>
                                <li>(MAIL) shillastay@gmail.com</li>
                                <li><span data-lang="hotel_tel"></span></li>
                            </ul>
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<div class="ft-contact">
							<h6 data-lang="contact"></h6>
							<ul>
								<li data-lang="contact_phone"></li>
								<li data-lang="contact_reservation"></li>
                            </ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<ul>
							<!-- ********* 하단부분 문의 클릭시 연락처로 이동 *********  -->
                            <li><a href="contactUs/contact.jsp" data-lang="contact_us"></a></li>
                            <li><a href="#" data-lang="terms_and_conditions"></a></li>
                            <li><a href="#" data-lang="privacy_policy"></a></li>
						</ul>
					</div>
					<div class="col-lg-5">
                        <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

<!-- <span hidden="hidden" id="locale"></span>브라우저 언어처리 -->

	<!-- Js Plugins -->
	<script src="js/language.js"></script> 
	<script src="js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>