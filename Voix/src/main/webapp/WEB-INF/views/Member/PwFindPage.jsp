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
				<div>비밀번호 찾기</div>
				<form action="/memberLogin" method="post"
					onsubmit="return formCheck(this);">
					<input placeholder="아이디" class="formInput p-1" type="text"
							name="Id">
					<div class="row m-1">
						<input type="text" name="memailId" placeholder="이메일아이디">
					@
					<input type="text" name="memailDomain" id="inputDomain" placeholder="이메일도메인">
					<select onchange="domainSelect(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
					</select>
					<button>보내기</button>
					</div>
					<div>
					<input type="text" name="Code" placeholder="인증번호">
					<button>확인</button>
					</div>
					<div>
					<p>변경할 비밀번호</p>
					<input placeholder="변경할 비밀번호" class="formInput p-1" type="text"
							name="RePw">
					<input placeholder="변경할 비밀번호 확인" class="formInput p-1" type="text"
							name="CkPw">
					</div>
					<div>
					
					<a type="button" href ="LoginPage">로그인하기</a>
					<a type="button" href ="IdFindPage">아이디 찾기</a>
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
