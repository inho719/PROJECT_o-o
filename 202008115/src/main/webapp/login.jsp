<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Notebook</title>
<style type="text/css">
.button {
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 10px;
	width: 10%;
}

.input {
	border: 1px solid lightgray;
	border-radius: 10px;
	width: 300px;
	padding: 5px;
}
</style>
</head>

<jsp:include page="menu.jsp" />
<body>
	<div> 
	<h3>더욱 빠르게 결제하시려면 로그인하세요.</h3>
	</div> 

	<form action="checkid.jsp" name="myform" method="post">
		<div style="text-align: center; margin-bottom: 20%; margin-top: 5%;">
			<div style="margin-bottom: 50px;">
			<h4>Apple Store에 로그인하세요</h4>
			</div>
			<div>
				<div style="margin-bottom: 5px;">
					<input class="input" type="text" name="id" placeholder="아이디">
					
				</div>
				<div style="margin-bottom: 20px;">
					<input class="input" type="password" name="pw"  placeholder="비밀번호">
				</div>
				<div>
					<input class="button" type="submit" value="Sign in"
						onClick="return check()">
					<a href="SignUp.jsp" class="button" type="button"
						style="text-decoration: none; color: black;">Sign up</a>
				</div>
				
				
			</div>


		</div>

	</form>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function check() {
			if (myform.id.value.length == 0) {
				alert("아이디가 누락되었습니다.");
				myform.id.focus();
				return false;
			}
			if (myform.pw.value.length == 0) {
				alert("패스워드가 누락되었습니다.");
				myform.pw.focus();
				return false;
			}
		}
	</script>

</body>
</html>
