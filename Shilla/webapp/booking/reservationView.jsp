<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="병준">
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
    <style>
    	th{
    	background-color:gray;
    	}
    </style>
    <%
    String userID= null,userName= null,userTel= null;
    if(session.getAttribute("userID")!=null){
    	userID = session.getAttribute("userID").toString();
    }else{
    	userName = request.getParameter("userName");
    	userTel = request.getParameter("userTel");
    }
    %>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <jsp:include page="../section/header.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                    
                        <h2 id="reservation-result" data-lang="check_booking"></h2>
						<table id="reservation" border="1" align="center" cellpadding="10">
							<tbody id="resetvation-tbody">
								<tr>
									<th data-lang="booking_number"></th>
									<th data-lang="id"></th>
									<th data-lang="name"></th>
									<th data-lang="tel"></th>
									<th data-lang="room_checkIn"></th>
									<th data-lang="room_checkOut"></th>
									<th data-lang="room_schedule"></th>
									<th data-lang="room_price"></th>
									<th data-lang="room_type"></th>								
								</tr>
							</tbody>
						
						</table>
						<div class="bt-option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../section/footer.jsp"/>

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
   
    <script>
    var en = document.getElementById("en");
    function getReservation(){
		$.ajax({
			url : "<%=request.getContextPath()%>/reservation.do",
			type : "post",
			data : {"userID" : "<%=userID%>","userName":"<%=userName%>","userTel":"<%=userTel%>"},
			success : function(data){
				if(data.nodata!=null){
					document.getElementById("reservation").remove();
					var en = document.getElementById("en");
					if(en != null){
						document.getElementById("reservation-result").innerHTML="No reservation history"
					}else{
						document.getElementById("reservation-result").innerHTML="예약내역이 없습니다"
					}
				}else{
					$.each(data, function(i,v){					
						document.getElementById("resetvation-tbody").innerHTML+="<tr><td>"
						+v.payNumber+"</td><td>"
						+v.userID+"</td><td>"
						+v.userName+"</td><td>"
						+v.userTel+"</td><td>"
						+v.checkIn+"</td><td>"
						+v.checkOut+"</td><td>"
						+v.schedule+"</td><td>"
						+v.payAmount+"</td><td>"
						+v.roomType+"</td></tr>";
					});
				}
			},
			dataType:"json"
		});
	}
    window.onload=getReservation();
    </script>
</body>

</html>