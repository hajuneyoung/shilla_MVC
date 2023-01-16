<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String userTel,userName,userID=null;
	if(session.getAttribute("userID")==null){
		userID="비회원";
		userName=request.getParameter("userName");
		userTel=request.getParameter("userTel");
	}else{
		userName=session.getAttribute("userName").toString();
		userID=session.getAttribute("userID").toString();
		userTel=session.getAttribute("userTel").toString();
	}
	
	String checkIn=session.getAttribute("dateIn").toString();
	String checkOut=session.getAttribute("dateOut").toString();
	String schedule=session.getAttribute("schedule").toString();
	String roomType=session.getAttribute("roomType").toString();
	int payAmount=Integer.parseInt(session.getAttribute("payAmount").toString());

%>
<script>
	var en = document.getElementById("en");
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp35533753"); // 예: imp00000000
	function pay() {
		var userID;
		if("<%=userID%>"=="비회원"&&"<%=userName%>"=="null"){
			if(en != null){
				alert("Please Login or make a non-member payment");
				history.back();
			}
			else{
				alert("로그인을 하거나 비회원 결제로 진행해주세요");
				history.back();
			}
		}
		var schedule="<%=schedule%>";
		var payNumber = new Date().getTime();
		
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : "",
		    merchant_uid: payNumber, // 상점에서 관리하는 주문 번호
		    name : schedule+'/<%=roomType%>'+'/<%=checkIn%>',
		    amount : <%=payAmount%>,
		    buyer_email : '',
		    buyer_name : '<%=userName%>',
		    buyer_tel : '<%=userTel%>'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "<%=request.getContextPath()%>/insertReservation.do", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		"payNumber" : payNumber,
			    		"userID" : "<%=userID%>",
			    		"userName" : "<%=userName%>",
			    		"userTel" : "<%=userTel%>",
			    		"checkIn" : "<%=checkIn%>",
			    		"checkOut" : "<%=checkOut%>",
			    		"schedule" : schedule,
			    		"payAmount" : "<%=payAmount%>",
			    		"roomType" : "<%=roomType%>"
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {	    		
		    		location.href="booking/payCompleted.jsp";
		    	});
		    } else {
		    	var msg = null;
		    	if(en != null){
		    		msg = 'Payment failed. Please contact the hotel. (TEL) 82-2-2603 6789';
		    	    alert(msg);
		    	    location.href="contactUs/contact.jsp";
		    	}else{
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			        location.href="booking/booking.jsp";
		    	}
		    }
		});
	}
	window.onload=pay();
</script>