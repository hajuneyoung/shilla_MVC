<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
    <meta name="description" content="footer">
    <meta name="author" content="미나">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SHILLA STAY GANGSEO</title>
	
</head>
<body>
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
                            <li><a href="<%=request.getContextPath()%>/contactUs/contact.jsp" data-lang="contact_us"></a></li>
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

</body>
</html>