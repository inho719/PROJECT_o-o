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
				<div>로그인</div>
				<form action="/memberLogin" method="post"
					onsubmit="return formCheck(this);">
					<div class="row m-1">
						<input placeholder="아이디" class="formInput p-1" type="text"
							name="Id">
					</div>
					<div class="row m-1">
						<input placeholder="비밀번호" class="formInput p-1" type="text"
							name="Pw">
					</div>
					<div class="row m-1">
						<input class="formInput p-1 btn btn-primary" type="submit"
							value="로그인">
					</div>
					<p>
						<a href="IdFindPage">아이디</a>/ <a href="PwFindPage">비밀번호</a> 찾기
					</p>
				</form>
				<p>간편로그인</p>
				<div class="row m-1">
					<button onclick="memberLogin_kakao()" class="btn btn-warning">카카오
						로그인</button>
					<button onclick="memberLogin_kakao()" class="btn btn-warning">네이버
						로그인</button>
					<button onclick="memberLogin_kakao()" class="btn btn-warning">구글
						로그인</button>
				</div>
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
