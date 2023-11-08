<%@ page contentType = "text/html;charset=utf-8" %>

<html>
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    
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
</html>

<body>
    
    <jsp:include page="menu.jsp" />
	<BR><BR>
    <h2>회원가입</h2>
	
	<form action="join_ok.jsp" name="myform" method="post">
		<table width=60% align=center>
		<tr>
			<td> 항목 </td>
			<td> 내용 </td>
		</tr>
		<tr>
			<td>아이디  </td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<select name="phone1">
					<option>010</option>
					<option>02</option>
					<option>031</option>
					<option>051</option>
				</select>
				- <input type="text" name="phone2" maxlength=4 size="4">
				- <input type="text" name="phone3" maxlength=4 size="4">
			</td>
		</tr>
		<tr>
			<td colspan=2>        
				<input type="submit" value="가입" onClick="return check()">
				<input type="reset" value="Reset">
			</td>
		</tr>
		</table>
		
	</form>
    <jsp:include page="footer.jsp" />
</body>