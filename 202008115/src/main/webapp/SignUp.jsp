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
	padding: 5px;
}

select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid lightgray;
	border-radius: 10px;
	width: 50px;
	text-align: center;
}
select::-ms-expand {
  /* for IE 11 */
  display: none;
}
</style>
</head>

<jsp:include page="menu.jsp" />
<body>
	<div>
		<h3>더욱 빠르게 결제하시려면 로그인하세요.</h3>
	</div>

	<form action="join_ok.jsp" name="myform" method="post">
		<div style="text-align: center; margin-bottom: 20%; margin-top: 5%;">
			<div style="margin-bottom: 50px;">
				<h4>Apple Store에 회원가입하세요</h4>
			</div>
			<div>
				<div style="margin-bottom: 5px;">
					<input class="input" type="text" name="id" placeholder="아이디"
						style="width: 300px;">

				</div>
				<div style="margin-bottom: 5px;">
					<input class="input" type="password" name="pw" placeholder="비밀번호"
						style="width: 300px;">
				</div>
				<div style="margin-bottom: 5px;">
					<input class="input" type="text" name="name" placeholder="이름">
				</div>
				<div style="margin-bottom: 20px;" >
					<select name="phone1">
						<option>010</option>
						<option>02</option>
						<option>031</option>
						<option>051</option>
					</select> - <input class="input" type="text" name="phone2" maxlength=4
						size="4" style="margin-bottom: 5px;"> - <input class="input" type="text" name="phone3"
						maxlength=4 size="4" style="margin-bottom: 5px;">
				</div>
				<div>
					<input class="button" type="submit" value="Sign up"
						onClick="return check()">
				</div>


			</div>


		</div>

	</form>

	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
        function check(){
             if(myform.id.value.length == 0){
                 alert("아이디가 누락되었습니다.");
                 myform.id.focus();
                 return false;
             }  
             if(myform.pw.value.length == 0){
                 alert("패스워드가 누락되었습니다.");
                 myform.pw.focus();
                 return false;
             }  
              if(myform.name.value.length == 0){
                 alert("이름이 누락되었습니다.");
                 myform.name.focus();
                 return false;
             }  
            if(myform.phone1.value.length == 0){
                 alert("전화번호1이 누락되었습니다.");
                 myform.phone1.focus();
                 return false;
             }  
             if(myform.phone2.value.length < 4){
                 alert("전화번호2이 누락되었습니다.");
                 myform.phone2.focus();
                 return false;
             }  
             if(myform.phone3.value.length < 4){
                 alert("전화번호3이 누락되었습니다.");
                 myform.phone3.focus();
                 return false;
             }  
        }
    </script>

</body>
</html>