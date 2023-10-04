<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>News Page</title>
<!-- Favicon-->
<style type="text/css">
.pagination {
	list-style-type: none;
	display: inline-block;
}

.pagination li {
	display: inline;
	margin-right: 5px;
}

.pagination li a {
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ccc;
	background-color: #f7f7f7;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<div class="NewsDiv" style="display: flex;">
						<div class="NewsImg">
							<a href="#뉴스코드"><img class=""
								src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" alt="..." /></a>
						</div>
						<div class="NewsText">
							<div class="NewsTitle" style="border: 1px solid black;">
								<a>뉴스제목</a>
							</div>
							<div class="NewsContents" style="border: 1px solid black;">
								<a>뉴스내용블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</a>
							</div>
							<div class="card-body" style="text-align: -webkit-right;">
								<a href="찜"><img alt="" src="/resources/assets/heart.png"></a>
								<a class="Views" style = "text-decoration-line: none; color: gray;">조회수</a>
							</div>
						</div>
					</div>

				</div>
				<div class="card mb-4">
					<div class="NewsDiv" style="display: flex;">
						<div class="NewsImg">
							<a href="#뉴스코드"><img class=""
								src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" alt="..." /></a>
						</div>
						<div class="NewsText">
							<div class="NewsTitle" style="border: 1px solid black; ">
								<a>뉴스제목</a>
							</div>
							<div class="NewsContents" style="border: 1px solid black;">
								<a>뉴스내용블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</a>
							</div>
							<div class="card-body" style="text-align: -webkit-right;">
								<a href="찜"><img alt="" src="/resources/assets/heart.png"></a>
								<a class="Views" style = "text-decoration-line: none; color: gray;">조회수</a>
							</div>
						</div>
					</div>

				</div>				<div class="card mb-4">
					<div class="NewsDiv" style="display: flex;">
						<div class="NewsImg">
							<a href="#뉴스코드"><img class=""
								src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" alt="..." /></a>
						</div>
						<div class="NewsText">
							<div class="NewsTitle" style="border: 1px solid black;">
								<a>뉴스제목</a>
							</div>
							<div class="NewsContents" style="border: 1px solid black;">
								<a>뉴스내용블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</a>
							</div>
							<div class="card-body" style="text-align: -webkit-right;">
								<a href="찜"><img alt="" src="/resources/assets/heart.png"></a>
								<a class="Views" style = "text-decoration-line: none; color: gray;">조회수</a>
							</div>
						</div>
					</div>

				</div>
				<ul class="pagination" style="place-content: center;">
					<li><a href="?page=1">1</a></li>
					<li><a href="?page=2">2</a></li>
					<li><a href="?page=3">3</a></li>
					<li><a href="?page=4">4</a></li>
					<li><a href="?page=5">5</a></li>
					<li><a href="?page=6">6</a></li>
					<li><a href="?page=7">7</a></li>
					<!-- 다른 페이지 번호들을 추가하세요 -->
				</ul>

			</div>
			<!-- end Page content-->
			<%@ include file="/WEB-INF/views/Includes/Side.jsp"%>

		</div>
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
