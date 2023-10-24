<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>가격비교페이지 - PricePage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<style type="text/css">

.Melon{
	background:white !important;;
}
.Vibe{
	background:black !important;;
}
.Bugs{
	background:#ff3c28 !important;;
}
.Genie{
	background:white !important;;	
}
</style>
</head>



<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>


	<!-- Responsive navbar-->
	<!-- Page content-->
	<div class="container">
		<div class="row text-center">
			<div class="col-lg-9">
			
			
			<c:forEach items="${PriceList}" var="PriceList">
				<div class="mb-2">
						<div class="row">
							<div class="card col-md-4 justify-content-center ${PriceList.page}" style="height: 220px;	">
								<img alt="" src="${PriceList.pageimg}" class="w-100 ${PriceList.page}">
							</div>
							<div class="card col-md-8 justify-content-center">
								<h2>${PriceList.pricename}</h2>
								<p style="font-size: 18px; margin-top: 3px;">${PriceList.strprice}</p>
							</div>
						</div>
				</div>
			</c:forEach>
			</div>

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
