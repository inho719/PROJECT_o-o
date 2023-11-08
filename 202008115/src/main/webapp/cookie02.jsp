<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie view</title>
</head>
<body>

		<%
		Cookie[] cookies=request.getCookies();
	
		out.println("현재 설정된 쿠키의 개수 => "+cookies.length+"<br>");
		
		for(int i =0; i< cookies.length; i++){
			out.println("Cookie["+i+"] : "+ cookies[i].getName() + ":"+cookies[i].getValue()+"<BR>");
		}
		//response.sendRedirect("index.jsp");
	%>
</body>
</html>