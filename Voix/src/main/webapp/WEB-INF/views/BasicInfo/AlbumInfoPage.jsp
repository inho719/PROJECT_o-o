<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
line {
	display: inline-block;
}

albuminfo {
	padding: 5px !important;
}
button {
	width: 100%;
	background-color: gray;
	border: none;
}
</style>
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div>
			<div class="row">

				<div class="card col-md-4 mb-4">
					<img alt="앨범포스터" src="http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg" style="width: 100%;" class="card-img-top">
				</div>
				<div class="card col-md-8 mb-4">
					<p>앨범정보</p>
					<p>asdf</p>
					<p>asdf</p>
				</div>


			</div>
		</div>
		
			<div class="card col-md-12 mb-2">수록곡</div>
		
		<div >
			<div class="row">
				<div class="card col-md-8 mb-2">
					<div class="card mb-2 mt-2" >asdf</div>
					<div class="card mb-2" >asdf</div>
					<div class="card mb-2" >asdf</div>
					<div class="card mb-2" >asdf</div>


				</div>
				<div class="card col-md-4 mb-2 " style="display: inline-block;">
					<div>
						<button class="button mb-4 mt-4" onclick="location.href='CartPage.jsp'">바로가기</button>
					</div>
					<div>
						<button class="button"  onclick="location.href='PayPage.jsp'">바로가기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="borderline" style="overflow: scroll; height: 500px; width: 80%;">
			<div>
				댓글 <input value="댓글모음">
			</div>
			<div>댓글</div>
			<div>댓글</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는 데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>
</body>
</html>
