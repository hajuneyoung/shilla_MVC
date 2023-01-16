<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="author" content="두성">
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
</head>
    <script type="text/javascript">
	function loadFile(input){
		if(input.id == "about_us_img_one"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_one_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_two"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_two_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_three"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_three_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_four"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_four_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_five"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_five_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_six"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_six_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}else if(input.id == "about_us_img_seven"){
			var fr = new FileReader();
			fr.onload=function(event){
				document.getElementById('img_seven_load').style.backgroundImage="url("+event.target.result+")";
			};
			fr.readAsDataURL(input.files[0]);
		}
	}
	function change_video_href(){
		var change_video_href = prompt("변결한 주소를 입력해 주세요");
		if(change_video_href){
			document.getElementById('video_href').href=change_video_href;
			document.getElementById('input_video_href').value=change_video_href;//=change_video_href;
		}
	}
	</script>
<body>
	<jsp:include page="../section/header.jsp"/>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 data-lang="about_us"></h2>
                        <div class="bt-option">
                            <a href="../index.jsp" data-lang="home"></a>
                            <span data-lang="about_us"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
<form action="../aboutUs/aboutUsUpdate.do" enctype="multipart/form-data" method="post">
    <!-- About Us Page Section Begin -->
    <section class="aboutus-page-section spad">
        <div class="container">
            <div class="about-page-text">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ap-title">
                            <h2><textarea class="insert_textarea_from" style="height: 60px; padding-left: 20px;" placeholder="Welcome To Sona." name="welcome_title" >${AUvo1.welcome_title }</textarea></h2>
                            <p><textarea class="insert_textarea_from" style="height: 150px; padding-left: 20px;" placeholder="Built in 1910 during the Belle Epoque period, this hotel is located in the center of Paris, with easy access to the city’s tourist attractions. It offers tastefully decorated rooms." name="welcome_context">${AUvo1.welcome_context }</textarea></p>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <ul class="ap-services">
                        	<c:forEach var="AUBlist1Context" items="${AUBlist1}">
                            	<li><i class="icon_check"></i>${AUBlist1Context.context }</li>
                            	<%-- <i class="icon_check"></i> <textarea class="insert_textarea_from" style="width: 90%; height: 48px; vertical-align: middle; padding-left: 20px;" placeholder="20% Off On Accommodation." name="context${AUBlist1Context.benefits}">${AUBlist1Context.context}</textarea> --%>
                            </c:forEach>
                        </ul>
                       <a href="../aboutUs/AboutUsBenefitsUpdateFrom.do"><img alt="" src="../img/icon_edit.png" width="38px;"></a>	
                    </div>
                </div>
            </div>
            <div class="about-page-services">
                <div class="row">
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" id="img_one_load" data-setbg="${AUvo1.img_one }">
                            <div class="api-text">
                            <label for="about_us_img_one">
                            	<img alt="" src="../img/icon_backGround.png">
                            </label>
                                <h3><textarea class="insert_textarea_from" style="width: 90%; height: 40px; font-size: 28px; text-align: center;" placeholder="Restaurants Services" name="img_one_title">${AUvo1.img_one_title }</textarea></h3>
                            </div>
                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_one" name="img_one" onchange="loadFile(this)"  style="display: none;">                            
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" id="img_two_load" data-setbg="${AUvo1.img_two }">
                            <div class="api-text">
                            <label for="about_us_img_two">
                            	<img alt="" src="../img/icon_backGround.png">
                            </label>
                                <h3><textarea class="insert_textarea_from" style="width: 90%; height: 40px; font-size: 28px; text-align: center;" placeholder="Travel & Camping" name="img_two_title">${AUvo1.img_two_title }</textarea></h3>
                            </div>
                              <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_two" name="img_two" onchange="loadFile(this)"  style="display: none;">                            
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ap-service-item set-bg" id="img_three_load" data-setbg="${AUvo1.img_three }">
                            <div class="api-text">
                            <label for="about_us_img_three">
                            	<img alt="" src="../img/icon_backGround.png">
                            </label>
                                <h3><textarea class="insert_textarea_from" style="width: 90%; height: 40px; font-size: 28px; text-align: center;" placeholder="Event & Party" name="img_three_title">${AUvo1.img_three_title }</textarea></h3>
                            </div> 
                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_three" name="img_three" onchange="loadFile(this)"  style="display: none;">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Us Page Section End -->

    <!-- Video Section Begin -->
    <section class="video-section set-bg" data-setbg="../img/video-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="video-text">
                        <h2><textarea class="insert_textarea_from" style="width: 70%; height: 65px; text-align: center;" placeholder="Discover Our Hotel & Services." name="video_title">${AUvo1.video_title }</textarea></h2>
                        <p><textarea class="insert_textarea_from" style="width: 50%; height: 32px; text-align: center;" placeholder="It S Hurricane Season But We Are Visiting Hilton Head Island" name="video_context">${AUvo1.video_context }</textarea></p>
                        <a id="video_href" href="${AUvo1.video_href_address }" class="play-btn video-popup"><img
                                src="../img/play.png" alt=""></a>
                                <br><br>
                                	<img alt="" src="../img/icon_youtube.png" width="48px" onclick="change_video_href()">
                                <input hidden="hidden" type="text" id="input_video_href" name="video_href_address" value="${AUvo1.video_href_address }">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Video Section End -->

    <!-- Gallery Section Begin -->
    <section class="gallery-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Our Gallery</span>
                        <h2>Discover Our Work</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="gallery-item set-bg" id="img_four_load" data-setbg="${AUvo1.img_four }">
                        <div class="gi-text">
                        	<label for="about_us_img_four">
                            	<img alt="" src="../img/icon_backGround.png">
                            </label>
                            <h3><textarea class="insert_textarea_from" style="text-align: center; height: 45px;" placeholder="Room Luxury" name="img_four_title">${AUvo1.img_four_title }</textarea></h3>
                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_four" name="img_four" onchange="loadFile(this)"  style="display: none;">                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="gallery-item set-bg" id="img_five_load" data-setbg="${AUvo1.img_five }">
                                <div class="gi-text">
		                            <label for="about_us_img_five">
		                            	<img alt="" src="../img/icon_backGround.png">
		                            </label>
                                    <h3><textarea class="insert_textarea_from" style="text-align: center; height: 45px;" placeholder="Room Luxury" name="img_five_title">${AUvo1.img_five_title }</textarea></h3>
		                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_five" name="img_five" onchange="loadFile(this)"  style="display: none;">                            
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="gallery-item set-bg" id="img_six_load" data-setbg="${AUvo1.img_six }">
                                <div class="gi-text">
                                   	<label for="about_us_img_six">
		                            	<img alt="" src="../img/icon_backGround.png">
		                            </label>
                                    <h3><textarea class="insert_textarea_from" style="text-align: center; height: 45px;" placeholder="Room Luxury" name="img_six_title">${AUvo1.img_six_title }</textarea></h3>
	                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_six" name="img_six" onchange="loadFile(this)"  style="display: none;">                            
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="gallery-item large-item set-bg" id="img_seven_load" data-setbg="${AUvo1.img_seven }">
                        <div class="gi-text">
                     	   <label for="about_us_img_seven">
                            	<img alt="" src="../img/icon_backGround.png">
                            </label>
                            <h3><textarea class="insert_textarea_from" style="text-align: center; height: 45px;" placeholder="Room Luxury" name="img_seven_title">${AUvo1.img_seven_title }</textarea></h3>
                             <input type="file" accept="image/jpeg,image/gif,image/png" id="about_us_img_seven" name="img_seven" onchange="loadFile(this)"  style="display: none;"> 
                        </div>
                    </div>
                </div>
            </div>
			<div align="center">
                 <button type="submit" class="button_blog_details_go_list" data-lang="save_btn"></button>
            </div>
        </div>
    </section>
</form>
    <!-- Gallery Section End -->
	<jsp:include page="../section/footer.jsp"/>
	
<!-- ============================================================================  -->
<span hidden="hidden" id="locale"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<!-- ============================================================================  -->

	<!-- Js Plugins -->
	<script src="../js/language.js"></script> 
	<script src="../js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</body>
<script>
	var en = document.getElementById("en");
	$(function() {
		if(en != null){
			document.getElementById("aboutUs").outerHTML='<li id="aboutUs" class="active"><a href="../aboutUs/getAboutUs.do">About Us</a></li>';
		}else{
			document.getElementById("aboutUs").outerHTML='<li id="aboutUs" class="active"><a href="../aboutUs/getAboutUs.do">호텔 소개</a></li>';
		}
		//<li id="aboutUs" class=active><a href="./about-us.html">About Us</a></li>
	});
</script>
</html>