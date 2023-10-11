<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<%@ include file = "/WEB-INF/views/Includes/Menu.jsp" %>
	<div class="container">

		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 500px;">
			<div class="card-body">
				<div>내정보 변경</div>
				<form action="/memberLogin" method="post"
					onsubmit="return formCheck(this);">
					<div>
						<input value="Id" class="formInput p-1" type="text" name="Id">
						<input value="Name" class="formInput p-1" type="text" name="Name">
						<input placeholder="변경할 비밀번호" class="formInput p-1" type="text"
							name="RePw"> <input placeholder="변경할 비밀번호 확인"
							class="formInput p-1" type="text" name="CkPw">
					</div>
					<div>
						<input placeholder="주소" class="formInput p-1" type="text"
							name="Address"> <input type="button" value="주소찾기">
						<input placeholder="상세주소" class="formInput p-1" type="text"
							name="DetailAddress">
					</div>
					<div>

						<div class="row m-1">
							<input value="Email" class="formInput p-1" type="text"
								name="Email">
						</div>
						<div>
							<img style="width: 50px; height: 50px;" alt="" src=""> <input class="formInput p-1"
								type="file" name="mfile">
						</div>

						<button type="submit" onclick="LoginPage">회원가입하기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->

	</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는
				데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
