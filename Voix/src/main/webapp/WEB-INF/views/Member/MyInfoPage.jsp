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
				<div>
					<img alt="" src="">
					<div>
						<p>이름</p>
						<p>이메일</p>
						<p>주소</p>
						<input type="button" value="내정보 변경하기 버튼">
					</div>
					<div>
						<div>구매내역</div>
						<div>찜목록</div>
						<div>내가쓴 댓글</div>
					</div>
					<div>
						<a>뉴스에서 만든 형식</a>
						<div>
							<a>블로그에서 만든 형식</a>
						</div>
						<div>
							<a>엘범에서 만든 형식</a>
						</div>
						<div>
							<a>노래에서 만든 형식</a>
						</div>
						<div>
							<a>티켓에서 만든 형식</a>
						</div>
						<div>
							<a>가격에서 만든 형식</a>
						</div>
					</div>
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
