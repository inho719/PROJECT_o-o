<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
.menubar1 {
	border-style: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<div class="container">
				<div class="navbar-header">
					<table>
						<tr>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
							<th class="menubar1"><a class="navbar-brand"
								href="./welcome.jsp">Home</a></th>
						</tr>
					</table>
				</div>
			</div>
		</nav>
	</div>




	<%!String greeting = "Inhatc Shopping Mall";
	String tagline = "Welcome to Web Market!";%>
	<div class="jumbotron">

		<div class="container">
			<h1 class="display-3" style="color: #077D6E;">
				<%=greeting%>
			</h1>
			<div>
				<%@ page import="java.util.Date"%>
				Today is
				<%=new Date()%>

			</div>


		</div>

	</div>

	<div>
		<div class="" style="width: 100%;">
			<div>
				<table class="navbar navbar-expend"
					style="border-bottom: 5px solid #212529; border-top: 5px solid #212529; padding: 5px; margin-left: auto; margin-right: auto;">
					<tr style="margin-left: auto; margin-right: auto;">
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
						<th><a class="navbar-brand" href="./welcome.jsp">Home</a></th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>