<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <%-- ***************** 여기 진짜  --%>
<html lang="zxx">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		table{
		text-align : center;
		}
		th:first-child{
		color:red;
		}
		th:last-child{
		color:blue;
		}
		td{
		width:80px;
		height:110px;
		}
		td:first-child{
		color:red;
		}
		td:last-child{
		color:blue;
		}
	</style>
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
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<jsp:include page="../section/header.jsp"/>
    
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div>
                    <div>
                        <div id="result"></div><br>
						<span style="font-size:20px;" id="year"></span>
						<span style="font-size:20px;" data-lang="year"></span>
						<span> / </span>
						<span style="font-size:20px;" id="month"></span>
						<span style="font-size:20px;" data-lang="month"></span>
						<button onclick="PrevCalendar();" id="prevBtn" data-lang="last_month"></button>
						<button onclick="NextCalendar();" id="nextBtn" data-lang="next_month"></button>
						<table id="cal" bgcolor="lightgrey" 
						        cellspacing="0" cellpadding="0" border="1"></table>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                    <div class="booking-form">
                        <h3 data-lang="booking_btn"></h3>
                        <form action="../checkAvailability.do">
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="date" id="date-in" name="date-in" required="required">
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="date" id="date-out" name="date-out" required="required">
                            </div>
                            <div class="select-option">
                                <label for="room-type">Room Type:</label>
                                <select id="room-type" name="room-type">
                                    <option value="standard">standard</option>
                                    <option value="suite">suite</option>
                                    <option value="executive">executive</option>
                                    <option value="korean">korean</option>
                                </select>
                            </div>
                            <button type="submit" data-lang="check_availability"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
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
    
    <script>
    var en = document.getElementById("en");
    
	var date=new Date();
	var fullYear=date.getFullYear();
	var month=date.getMonth()+1;
	
	var last1=new Date(fullYear,month-1,0);
	var last2=new Date(fullYear,month,0);
	var today=date.getDate();
	var lastDate=last2.getDate();
	var firstDate=new Date(last1.setDate(last1.getDate()+1));
	var firstDate1=firstDate.getDate();
	var firstDay=firstDate.getDay();
	var lastDay=last2.getDay();
	var sFirstDate=firstDate.toLocaleDateString();
	
	var sDate=firstDate.toLocaleDateString();
	var numberCount=lastDate-firstDate1+1;
	
	function PrevCalendar(){
		month--;
		if(month==0){
			month=12;
			fullYear--;
		}
		last1=new Date(fullYear,month-1,0);
		last2=new Date(fullYear,month,0);
		lastDate=last2.getDate();
		firstDate=new Date(last1.setDate(last1.getDate()+1));
		firstDate1=firstDate.getDate();
		firstDay=firstDate.getDay();
		lastDay=last2.getDay();
		sDate=firstDate.toLocaleDateString();
		numberCount=lastDate-firstDate1+1;
	
		createCalendar();
		ajaxRoomNumber();
	}
	function NextCalendar(){
		month++;
		if(month==13){
			month=1;
			fullYear++;
		}
		last1=new Date(fullYear,month-1,0);
		last2=new Date(fullYear,month,0);
		lastDate=last2.getDate();
		firstDate=new Date(last1.setDate(last1.getDate()+1));
		firstDate1=firstDate.getDate();
		firstDay=firstDate.getDay();
		lastDay=last2.getDay();
		sDate=firstDate.toLocaleDateString();
		numberCount=lastDate-firstDate1+1;
		
		createCalendar();
		ajaxRoomNumber();
	}
	
	function createCalendar(){
		if(document.getElementById("calBody")){
			document.getElementById("calBody").remove();
		}
		var Count7=0;
		var weekCount=2;
		var dayCount=0;
		var month1=month;
		if(month<10){
			month1="0"+month
		}
		document.getElementById("year").innerHTML=fullYear;
		document.getElementById("month").innerHTML=month;
		if (en != null){
			document.getElementById("cal").innerHTML
			= '<tbody id="calBody"><tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr></tbody>';
		}else{
			document.getElementById("cal").innerHTML
			= '<tbody id="calBody"><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr></tbody>';
		}
		document.getElementById("calBody").innerHTML+='<tr id="week1"></tr>';
		for(var i=0;i<firstDay;i++){		
			document.getElementById("week1").innerHTML+='<td></td>';				
			
		}
		for(var i=0;i<7-firstDay;i++){
			dayCount++;
	// 		document.getElementById("week1").innerHTML+='<td id=tdName>'+dayCount+'</td>';
			if(dayCount<10){
				var td=document.createElement("td");
				td.setAttribute("id",""+fullYear+month1+"0"+dayCount);
				
				td.innerHTML='<p>'+dayCount+'</p>';
				document.getElementById("week1").appendChild(td);
			}else{
				var td=document.createElement("td");
				td.setAttribute("id",""+fullYear+month1+dayCount);
				td.innerHTML='<p>'+dayCount+'</p>';
				document.getElementById("week1").appendChild(td);
			}
		}
		while(true){
			var tr = document.createElement("tr");
			tr.setAttribute("id","week"+weekCount);
			document.getElementById("calBody").appendChild(tr);
			for(var i=0;i<7;i++){
				dayCount++;
				
				if(dayCount<10){
					var td=document.createElement("td");
					td.setAttribute("id",""+fullYear+month1+"0"+dayCount);
					td.innerHTML='<p>'+dayCount+'</p>';
					document.getElementById("week"+weekCount).appendChild(td);
				}else{
					var td=document.createElement("td");
					td.setAttribute("id",""+fullYear+month1+dayCount);
					td.innerHTML='<p>'+dayCount+'</p>';
					document.getElementById("week"+weekCount).appendChild(td);
				}
				if(dayCount==lastDate){
					return;
				}
			}
			weekCount++;
		}
	}
	
	function ajaxRoomNumber(){
		$.ajax({
			url : "<%=request.getContextPath()%>/calendar.do",
			type : "post",
			data : {"sDate" : sDate, "count":numberCount},
			success : function(data){
				$.each(data, function(i,v){
					if(document.getElementById(v.rdate)){
						if(en != null){
							document.getElementById(v.rdate).innerHTML+='<p style="font-size:5px;padding:0;line-height:120%;">Standard : '+v.StandardRoom+'<br>Suite : '+v.SuiteRoom+'<br>Executive : '+v.ExecutiveRoom+'<br>Ondol : '+v.KoreanRoom+'</p>'
						}else{
							document.getElementById(v.rdate).innerHTML+='<p style="font-size:5px;padding:0;line-height:120%;">스탠다드 : '+v.StandardRoom+'<br>스위트 : '+v.SuiteRoom+'<br>이그제큐티브 : '+v.ExecutiveRoom+'<br>온돌 : '+v.KoreanRoom+'</p>'
						}
					}
	// 				document.getElementById("test").innerHTML+=v.rdate+'<br>'
				});
			},
			dataType:"json"
		});
	}
	window.onload=createCalendar();
	window.onload=ajaxRoomNumber();
</script>
</body>

</html>