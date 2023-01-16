/*  ---------------------------------------------------
    File Name: sendmail
    Description: inquiries.jsp - send mail check & alert msg
    Author: 이미나
---------------------------------------------------------  */
window.onload = function(){
	document.getElementById("sendBtn").onclick = function() {
		var name = document.getElementById("inq-name").value;
		var email = document.getElementById("inq-email").value;
		var phone = document.getElementById("inq-phone").value;
		var sub = document.getElementById("inq-sub").value;
		var msg = document.getElementById("inq-msg").value;
		
		if(!name || !email || !phone || !sub || !msg){ // 어느 한 곳이 빈칸인 경우
			if(document.getElementById("sendBtn").value == "Submit"){ // 언어설정 English
				alert("Please fill in the blank.");
			}else{ // 언어설정 한국어
				alert("빈칸을 채워주세요.");
			}
		}else{ // 빈칸이 없을 경우 메일 send
			if(document.getElementById("sendBtn").value == "Submit"){ // 언어설정 English
				alert("Submit Complete");
				document.getElementById("sub").submit();
				window.location.reload();
			}else{ // 언어설정 한국어
				alert("메일 전송 성공");
				document.getElementById("sub").submit();
				window.location.reload();
			}
		}
	}
}// -메일 전송 function end-