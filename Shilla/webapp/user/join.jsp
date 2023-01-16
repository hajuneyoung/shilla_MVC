<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<!DOCTYPE html>
<html>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<meta name="author" content="준영">
<title>SHILLA STAY GANGSEO</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script type="text/javascript">
	function registerCheckFunction() {
		var userID = $('#userID').val();
		$.ajax({
			type : 'POST',
			url : '../user/UserRegisterCheckServlet.do',
			data : {
				userID : userID
			},
			success : function(result) {
				var currentLang = document.getElementById("en");
				if (result == 0) {
					if(currentLang != null){
						$('#checkMessage').html('This ID can be used.');
						$('#checkType').attr('class', 'modal-content panel-success');
					}else{
						$('#checkMessage').html('사용할 수 있는 아이디 입니다.');
						$('#checkType').attr('class', 'modal-content panel-success');
					}
				} else {
					if(currentLang != null){
						$('#checkMessage').html('This ID cannot be used.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}else{
						$('#checkMessage').html('사용할 수 없는 아이디 입니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}
				}
				$('#checkModal').modal("show");
			}
		})
	}
	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		var currentLang = document.getElementById("en");
		if (userPassword1 != userPassword2) {
			if(currentLang != null){
				$('#passwordCheckMessage').html('Passwords do not match');
			}else{
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}
		} else {
			if(currentLang != null){
				$('#passwordCheckMessage').html('Password Match');
			}else{
				$('#passwordCheckMessage').html('비밀번호가 서로 일치합니다.');
			}
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form method="post" action="../user/userRegister.do">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-exaple-navbar-collapse-1"
						aria-expanded="false">
						<span class="icon-bar"></span><span class="icon-bar"></span> 
						<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="../index.jsp" data-lang="home"></a>
					</div>
					<div class="collapse navbar-collapse" id="bs-exaple-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="login.jsp" data-lang="login"></a></li>
						</ul>
					</div>
				</nav>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5 data-lang="id"></h5></td>
						<td><input class="form-control" type="text" id="userID"
							name="userID" maxLength="20"></td>
						<td style="width: 110px;"><button class="btn btn-primary"
								onclick="registerCheckFunction();" type="button"
								data-lang="duplicate_check"></button>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="pw"></h5></td>
						<td colspan="2"><input class="form-control" type="password"
							id="userPassword1" name="userPassword1" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="pw_check"></h5></td>
						<td colspan="2"><input class="form-control" type="password"
							onkeyup="passwordCheckFunction();" id="userPassword2"
							name="userPassword2" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="name"></h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userName" name="userName" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="age"></h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userAge" name="userAge" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="tel"></h5></td>
						<td colspan="2"><input class="form-control" type="text"
							id="userTel" name="userTel" maxLength="20"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="gender"></h5></td>
						<td colspan="2">
							<div class="form-group"
								style="text-align: center; margin: 0 auto;">
								<div id="genderGroup" class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
									  <input type="radio" id="g1" name="userGender" value="남자" autocomplete="off"
										checked><h6 data-lang="man"></h6>
									</label> 
									<label class="btn btn-primary"> 
									<input type="radio" id="g2"
										name="userGender" value="여자" autocomplete="off"><h6 data-lang="woman"></h6>
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5 data-lang="email"></h5></td>
						<td colspan="2"><input class="form-control" type="email"
							id="userEmail" name="userEmail" maxLength="20"></td>
					</tr>
					<tr>
						<td style="text-align: left" colspan="3"><h5
								style="color: gray;" id="passwordCheckMessage"></h5> 
								<input id="joinBtn"
							class="btn btn-primary pull-right" type="submit" value="회원가입"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%
		String messageContent = null;
		if (session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if (session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		if (messageContent != null) {
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-aligment-helper">
			<div class="modal-dialog vertical-align-center">
				<div
					class="modal-content 
					<% if (messageType.equals("오류메세지") || messageType.equals("Error Message")){
							out.println("panel-warning");
					   }
					   else
							out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">OK
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
			session.removeAttribute("messageContent");
			session.removeAttribute("messageType");
		}
	%>
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-aligment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
						</button>
						<h4 class="modal-title">확인 메세지</h4>
					</div>
					<div class="modal-body" id="checkMessage"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">OK
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Js Plugins -->
	<script src="../js/language.js"></script> 
	<script src="../js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->
</body>
</html>