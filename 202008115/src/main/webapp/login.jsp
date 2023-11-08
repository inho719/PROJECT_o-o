<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Notebook</title>
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
        }
    </script>
</head>
    
<jsp:include page="menu.jsp" />
<body>
	<BR><BR>
	<form action="checkid.jsp" name="myform" method="post">
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
			<td colspan=2>        
				<input type="submit" value="Login" onClick="return check()">
				<input type="reset" value="Reset">
			</td>
		</tr>
		</table>
		
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>