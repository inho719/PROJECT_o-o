<%@ page contentType="text/html;charset=utf-8"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>사이트 설명</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	padding-top: 56px; /* Adjust according to your navigation bar height */
}

.product-details {
	max-width: 600px;
	margin: auto;
	padding: 20px;
	margin-top: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

img {
	max-width: 100%;
	height: auto;
}

button {
	margin-top: 10px;
}

input[type="text"] {
	border: 2px solid lightgray;
	border-radius: 10px;
	margin-bottom: 5px;
	padding: 10px;
	width: 100%;
	height: 15px;
	font-weight: bold;
}

input[type="text"]:hover {
	background-color: lightgray;
}
</style>
</head>

<body>

	<jsp:include page="menu.jsp" />

	<div class="container">
		<div class="product-details">
			<div>
				<h5>
					Product Num
					<%=request.getParameter("num")%></h5>
			</div>
			<div>
				<h3><%=request.getParameter("name")%></h3>
			</div>
			<hr style="background-color: gray;">
			<div>
				<img src="image/Image<%=request.getParameter("num")%>.png"
					class="img-fluid" alt="Product Image">
			</div>
			<hr style="background-color: gray;">
			<div>
				<input type="text" value="제조사: 		<%=request.getParameter("Maker")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text"
					value="화면 크기:   	<%=request.getParameter("DisplayCm")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text"
					value="화면 인치:   	<%=request.getParameter("DisplayInch")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text"
					value="해상도:      	<%=request.getParameter("DisplayRes")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text"
					value="CPU 제조사:	<%=request.getParameter("CPUMaker")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text" value="CPU:		 <%=request.getParameter("CPUName")%>"
					disabled="disabled">
			</div>
			<div>
				<input type="text" value="가격: 		<%=request.getParameter("Price")%>"
					disabled="disabled">
			</div>

			<button class="btn btn-primary">장바구니</button>
			<button class="btn btn-success">구매하기</button>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>

