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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/acc1ccb443.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-9">
				<div class="card m-2">예스24, 알라딘, 교보</div>

				<c:forEach items="${ChartList}" var="ChartMap">
					<div class="card m-2">
						<div class="col-md-2">?순위</div>
						<div class="row">

							<c:if test="${ChartMap.SGIMG != null }">
								<div class="col-md-4 ChartImg align-items-center">
									<a href="/ChartInfoPage?sgcode=${ChartMap.SGCODE}">
										<img class="" src="${ChartMap.SGIMG}" alt="..." />
									</a>
								</div>
							</c:if>
							<c:if test="${ChartMap.SGIMG == null }">
								<div class="col-md-4 ChartImg align-items-center">
									<a href="/ChartInfoPage?sgcode=${ChartMap.SGCODE}">
										<img class="" src="http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg" alt="..." />
									</a>
								</div>
							</c:if>

							<div class="col-md-5">
								<div class="pt-2 ps-2" style="width: 100%; display: -webkit-inline-box;">
									<h2>${ChartMap.SGTITLE }</h2>
								</div>
								<div class="card m-2 pt-2 ps-2" style="width: 70%; display: -webkit-inline-box;">
									<p>${ChartMap.SGINFO }</p>
								</div>
							</div>

							<div class="col-md-3">
								<div class="card m-2 pt-2 ps-2" style="width: 30%;">
									<i class="fa-solid fa-play"></i>
								</div>
								<div class="card m-2 pt-2 ps-2" style="width: 30%;">
									<i class="fa-solid fa-stop"></i>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>



				<ul class="pagination" style="place-content: center;">
				    <c:if test="${pageMaker.prev }">
				    <li>
				        <a href="/ChartPage?page=${pageMaker.startPage-1}">
				   			<i class="fa fa-chevron-left"></i>
				   		</a>
				    </li>
				    <!-- <a href='<c:url value="/NewsPage?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a> -->
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/ChartPage?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				    <li>
				        <a href='<c:url value="/ChartPage?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
				    </li>
				    </c:if>
				</ul>

			</div>

			<!-- Side widgets-->
			<%@ include file="/WEB-INF/views/Includes/Side.jsp"%>

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
