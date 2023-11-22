<%@ page contentType="text/html;charset=utf-8"%>
<%

%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>사이트 설명</title>
</head>

<jsp:include page="menu.jsp" />
<body>
<div>	
	
	<p>제품 번호: <%= request.getParameter("num") %></p>
	<p>제품 번호: <%= request.getParameter("num") %></p>
    <p><%= request.getParameter("name") %></p>    
   	<img src="image/Image<%= request.getParameter("num") %>.png" width="300" height="200">
    <p>제조사: <%= request.getParameter("maker") %></p>
    <p>화면 크기: <%= request.getParameter("DisplayCm") %></p>
    <p>화면 인치: <%= request.getParameter("DisplayInch") %></p>
    <p>해상도: <%= request.getParameter("DisplayRes") %></p>
    <p>CPU 제조사: <%= request.getParameter("CPUMaker") %></p>
    <p>CPU: <%= request.getParameter("CPUName") %></p>
</div>


</body>
<jsp:include page="footer.jsp" />
</html>

