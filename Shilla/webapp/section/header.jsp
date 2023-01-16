<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<% String userID = (String) pageContext.getSession().getAttribute("userID"); %>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="header">
	<meta name="author" content="미나">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SHILLA STAY GANGSEO</title>
</head>

<body>
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
                      	<li id="lang-en"><a href="<%=request.getContextPath()%>/setEn.do">English</a></li>
                      	<li id="lang-ko"><a href="<%=request.getContextPath()%>/setKo.do">한국어</a></li>
                      </ul>
                 </div>
            </div>
            <a href="<%=request.getContextPath()%>/booking/booking.jsp" class="bk-btn" data-lang="booking_btn"></a>
            <a href="<%=request.getContextPath()%>/booking/reservationViewAction.jsp" class="bk-btn" data-lang="booking_check"></a>
        </div>
        <nav class="mainmenu mobile-menu">
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp" data-lang="home"></a></li>
                <li><a href="<%=request.getContextPath()%>/aboutUs/aboutUsUpdate.do" data-lang="about_us"></a>
					<ul class="dropdown">
						<li><a href="<%=request.getContextPath()%>/aboutUs/aboutUsUpdate.do" data-lang="about_us"></a></li>
						<li><a href="<%=request.getContextPath()%>/aboutUs/rooms.jsp" data-lang="rooms"></a></li>
					</ul>
				</li>
                <li><a href="<%=request.getContextPath()%>/event/getAllEvent.do" data-lang="event"></a></li>
                <li><a href="<%=request.getContextPath()%>/contactUs/contact.jsp" data-lang="contact_us"></a>
                	<ul class="dropdown">
                		<li><a href="<%=request.getContextPath()%>/contactUs/contact.jsp" data-lang="contact"></a></li>
                		<li><a href="<%=request.getContextPath()%>/setLang.do" data-lang="inquiries"></a></li>
                	</ul>
                </li>
                <% if (userID == null) { %>
				<% } else { %>
				<li><a href="<%=request.getContextPath()%>/user/userInfo.jsp" data-lang="account"></a>
					<ul class="dropdown">
						<li><a href="../user/userInfo.jsp" data-lang="account_info"></a></li>
						<li><a href="<%=request.getContextPath()%>/user/userUpdate.jsp" data-lang="account_edit"></a></li>
						<li><a href="<%=request.getContextPath()%>/user/userDelete.jsp" data-lang="account_delete"></a></li>
						<li><a href="<%=request.getContextPath()%>/user/userLogout.jsp" data-lang="logout"></a></li>
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
                            
                            <a href="<%=request.getContextPath()%>/booking/booking.jsp" class="bk-btn" data-lang="booking_btn"></a>
                            <a href="<%=request.getContextPath()%>/booking/reservationViewAction.jsp" class="bk-btn" data-lang="booking_check"></a>
                            <div class="language-option">
                                <!-- ============================= pc 언어 설정 ====================================== -->                           
                                <span data-lang="language"><i class="fa fa-angle-down"></i></span>
                                <div class="flag-dropdown">
                                    <ul>
                                    	<li id="lang-en"><a href="<%=request.getContextPath()%>/setEn.do">English</a></li>
                                    	<li id="lang-ko"><a href="<%=request.getContextPath()%>/setKo.do">한국어</a></li>
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
                            <img alt="" src="<%=request.getContextPath()%>/img/shilla-logo.png">THE SHILLA 
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul id="header">
                                    <li><a href="<%=request.getContextPath()%>/index.jsp" data-lang="home"></a></li>
									<li><a href="<%=request.getContextPath()%>/aboutUs/getAboutUs.do" id="aboutUs" data-lang="about_us"></a>
										<ul class="dropdown">
											<li><a href="<%=request.getContextPath()%>/aboutUs/getAboutUs.do" data-lang="about_us"></a></li>
											<li><a href="<%=request.getContextPath()%>/aboutUs/rooms.jsp" data-lang="rooms"></a></li>
										</ul>
									</li>
									<li><a href="<%=request.getContextPath()%>/event/getAllEvent.do" id="event" data-lang="event"></a></li>
					                <li><a href="<%=request.getContextPath()%>/contactUs/contact.jsp" id="contactUs" data-lang="contact_us"></a>
					                	<ul class="dropdown">
					                		<li><a href="<%=request.getContextPath()%>/contactUs/contact.jsp" data-lang="contact"></a></li>
					                		<li><a href="<%=request.getContextPath()%>/setLang.do" data-lang="inquiries"></a></li> 
					                	</ul>
					                </li>
									<% if (userID == null) { %>
									<% } else { %>
									<li><a href="<%=request.getContextPath()%>/user/userInfo.jsp" data-lang="account"></a>
										<ul class="dropdown">
											<li><a href="<%=request.getContextPath()%>/user/userInfo.jsp" data-lang="account_info"></a></li>
											<li><a href="<%=request.getContextPath()%>/user/userUpdate.jsp" data-lang="account_edit"></a></li>
											<li><a href="<%=request.getContextPath()%>/user/userDelete.jsp" data-lang="account_delete"></a></li>
											<li><a href="<%=request.getContextPath()%>/user/userLogout.jsp" data-lang="logout"></a></li>
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

</body>
</html>