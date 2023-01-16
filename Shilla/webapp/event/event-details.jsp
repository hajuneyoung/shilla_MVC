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
<script>
	var en = document.getElementById("en");
	function go_list(){
		location.href="../event/getAllEvent.do"
	}
	function show_from_to_Ccomment_id(comment_id){
		if(en != null){/* ==== 수정 중 ==== */
			$("#"+comment_id+"_in").append('<br><div class="leave-comment"><h4>Leave a Comment</h4><form action="../event/eventCommentCommentInsert.do" class="comment-form" method="post"><input hidden="hidden" type="text" name="event_id" value="${vo1.event_id }"><input hidden="hidden" type="text" name="title_name" value="${vo1.title_name }"><input hidden="hidden" type="tetx" name="comment_cparent" value='+comment_id+'><div class="row"><div class="col-lg-6"><input type="text" name="comment_writer_name" data-lang="comment_name"></div><div class="col-lg-6"></div><div class="col-lg-12 text-center"><textarea name="comment_context" data-lang="comment"></textarea><button type="submit" class="site-btn" data-lang="leave_a_comment"></button></div></div></form></div>')
		}
		$("#"+comment_id+"_in").append('<br><div class="leave-comment"><h4 data-lang="leave_a_comment"></h4><form action="../event/eventCommentCommentInsert.do" class="comment-form" method="post"><input hidden="hidden" type="text" name="event_id" value="${vo1.event_id }"><input hidden="hidden" type="text" name="title_name" value="${vo1.title_name }"><input hidden="hidden" type="tetx" name="comment_cparent" value='+comment_id+'><div class="row"><div class="col-lg-6"><input type="text" name="comment_writer_name" data-lang="comment_name"></div><div class="col-lg-6"></div><div class="col-lg-12 text-center"><textarea name="comment_context" data-lang="comment"></textarea><button type="submit" class="site-btn" data-lang="leave_a_comment"></button></div></div></form></div>')
	}
</script>
<body>
<jsp:include page="../section/header.jsp"/>
    <!-- Header End -->

    <!-- Blog Details Hero Section Begin -->
    <section class="blog-details-hero set-bg" data-setbg="${vo1.img_title}">
        <div class="container">								<%-- ${vo1.title_img} --%>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="bd-hero-text">
                        <span>${vo1.kategorieOnEvnet}</span>
                        <h2>${vo1.title_name}</h2>
                        <ul>
                            <li class="b-time"><i class="icon_clock_alt"></i>&nbsp;${vo1.write_date}</li>
                            <li><i class="icon_profile"></i>&nbsp;${vo1.writerOnEvnet}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                        <div class="bd-title">
                            <p>${vo1.prologOnevnet}</p>
                        </div>
                        <div class="bd-pic">
                            <div class="bp-item">
                                <img src="${vo1.imgOne}" alt="">
                            </div>
                            <div class="bp-item">
                                <img src="${vo1.imgTwo}" alt="">
                            </div>
                            <div class="bp-item">
                                <img src="${vo1.imgThree}" alt="">
                            </div>
                        </div>
                        <div class="bd-more-text">
                            <div class="bm-item">
                                <h4>${vo1.subTitleOnEvnet}</h4>
                                <p>${vo1.textOnsubTitle}</p>
                            </div>
                        </div>
                        <!-- *********** 카테고리 정리 후 언어처리 하기 ************* -->
                        <div class="tag-share">
                            <div class="tags">
                                <a href="#">Travel Trip</a>
                                <a href="#">Camping</a>
                                <a href="#" data-lang="event"></a>
                            </div>
                            <div class="social-share">
                                <span data-lang="share"></span>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                        <div class="comment-option">
                            <h4 data-lang="comment_list">${comments_count}</h4>
                            <c:forEach var="comments" items="${commentlist}">
								<c:if test="${comments.comment_cdepth == 0}">
		                            <div class="single-comment-item first-comment" id="${comments.comment_id}_in">
		                                <div class="sc-author">
		                                    <img src="${comments.comment_writer_img }" alt="">
		                                </div>
		                                <div class="sc-text">
		                                    <span>${comments.comment_write_date }</span>
		                                    <h5>${comments.comment_writer_name  }</h5>
		                                    <p>${comments.comment_context  }</p>
		                                    <a href="../event/deleteCommentParent.do?comment_id=${comments.comment_id }&title_name=${vo1.title_name}&event_id=${vo1.event_id }" class="comment-btn">Delete</a>
		                                    <button class="comment_btn_Reply" onclick="show_from_to_Ccomment_id(${comments.comment_id})">Reply</button>
		                                </div>
		                            </div>
		                        </c:if>
		                            <c:forEach var="comments_2" items="${commentlist}">
		                            	<c:if test="${comments_2.comment_cparent == comments.comment_id }">
		                            		<div class="single-comment-item reply-comment">
				                                <div class="sc-author">
				                                    <img src="${comments_2.comment_writer_img }" alt="">
				                                </div>
				                                <div class="sc-text">
				                                    <span>${comments_2.comment_write_date }</span>
				                                    <h5>${comments_2.comment_writer_name  }</h5>
				                                    <p>${comments_2.comment_context }</p>
		                               				     <a href="../event/deleteComment.do?comment_id=${comments_2.comment_id }&title_name=${vo1.title_name}&event_id=${vo1.event_id }" class="comment-btn">Delete</a>
				                                </div>
				                            </div>
				                        </c:if>
		                            </c:forEach>
	            
                            </c:forEach>
                        </div>
                        <div class="leave-comment">
                            <h4 data-lang="leave_a_comment"></h4>
                            <form action="../event/eventCommentInsert.do" class="comment-form" method="post">
                            	<input hidden="hidden" type="text" name="event_id" value="${vo1.event_id }">
                            	<input hidden="hidden" type="text" name="title_name" value="${vo1.title_name }">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span data-lang="comment_name"></span><input type="text" name="comment_writer_name">
                                    </div>
                                    <div class="col-lg-6">
                                       <!--  <input type="text" placeholder="Email" name=""> -->
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <!-- <input type="text" placeholder="Website" > -->
                                        <textarea name="comment_context" data-lang="comment"></textarea>
                                        <button type="submit" class="site-btn" data-lang="save_btn"></button>
                                    </div>
                                </div>
                            </form><!-- .blog-details-text .leave-comment .comment-form button -->
                            <br>
                            <div align="center">
                            	<button class="button_blog_details_go_list" onclick="go_list()" data-lang="go_listBtn"></button>
                       		</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br>
    <!-- Blog Details Section End -->

    <!-- Recommend Blog Section Begin -->
	<!-- Recommend Blog Section End -->
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
			document.getElementById("event").outerHTML='<li id="event" class="active"><a href="../event/event.jsp">Event</a></li>';
		}else{
			document.getElementById("event").outerHTML='<li id="event" class="active"><a href="../event/event.jsp">이벤트</a></li>';
		}
		//<li id="aboutUs" class=active><a href="./about-us.html">About Us</a></li>
	});
</script>
</html>