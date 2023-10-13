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
					<img alt="공연포스터" src="${tk.tkimg}" style="width: 100%;" class="card-img-top">
				</div>
				<div class="card col-md-8 mb-4">
					<p>${tk.tktitle}</p>
					<p>${tk.tkartist}</p>
					<p id="tkplace">${tk.tkplace}</p>
					<p>${tk.tktime}</p>
					<p>${tk.tkdate}</p>
					<p>${tk.tkinfo}</p>
				</div>


			</div>
		</div>

		<div>
			<div class="row">
				<div class="card col-md-8 mb-2" id="mapInfo">
					<div id="map" style="width: 100%; height: 350px; margin-left: 5px; margin-top: 5px; border: 5px solid bisque; border-radius: 10px;"></div>
				</div>
				<div class="card col-md-4 mb-2 " style="display: inline-block;">
					<div>
						<button class="button mb-4 mt-4" onclick="location.href='공연페이지'">바로가기</button>
					</div>
				</div>
			</div>
		</div>

		<c:if test="${sessionScope.loginId != null }">
			<div class="replyWrite">
				<h3>댓글 작성 양식 - 로그인한 경우 출력</h3>
				<form action="registReview" class="my-3" method="post">
					<input type="text" name="restate" value="${tk.tkcode }" style="display: none">
					<textarea class="w-100 reviewComment" name="recontent"></textarea>
					<input class="btn btn-success w-100" type="submit" value="댓글 등록">
				</form>
			</div>
			<hr>
		</c:if>

		<div class="borderline" style="overflow: scroll; height: 500px; width: 100%;">
			<div class="replyArea">
				<div class="row my-3 scroll" style="width: 100%; margin-left: 5px; padding: 0px; display: inline-block; height: auto; max-height: 450px;">
					<c:forEach items="${reviewList}" var="re">
						<div class="meminfo">
							<span>작성자: ${re.REWRITER} </span>
							<div style="margin-top: 5px; margin-bottom: 5px;">
								<textarea rows="" cols="" class="rvcomm scroll" disabled="disabled">${re.RECONTENT}</textarea>
							</div>
							<c:if test="${sessionScope.loginId == re.REWRITER}">
								<button type="button" onclick="location.href='/deleteReview?recode=${re.RECODE}&tkcode=${tk.tkcode}'" class="btn btn-danger" style="font-size: 10px; margin-bottom: 4px; width: 70px; height: 30px; float: right;">댓글 삭제</button>
							</c:if>
							<div class="small text-muted">작성시간: ${re.REDATE}</div>

						</div>
						<hr>
					</c:forEach>
				</div>

			</div>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18a5f71bbe7bc58965ce6ce689f1e211"></script>
	<script type="text/javascript">
		let tkplace = document.getElementById('tkplace').innerHTML;
		let xMap = null;
		let yMap = null;
		$.ajax({
			type : "get",
			url : "getMapXY",
			data : {
				"tkplace" : tkplace
			},
			async : false,
			dataType : "json",
			success : function(result) {
				console.log('xy성공');
				yMap = result.x;
				xMap = result.y;
			}
		});
		var mapContainer = document.getElementById('map'), mapCenter = new kakao.maps.LatLng(
				xMap, yMap), mapOption = {
			center : mapCenter,
			level : 4
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			var latlng = mouseEvent.latLng;
		});
		var mMarker = new kakao.maps.Marker({
			position : mapCenter,
			map : map
		});
		var iwContent = '<div style="padding:5px; font-size:10px;">'
				+ tkplace
				+ '<br><a href="https://map.kakao.com/link/map/'+tkplace+','+xMap+','+yMap+'" style="color:purple" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+tkplace+','+xMap+','+yMap+'" style="color:blue" target="_blank">길찾기</a></div>'
		var mLabel = new kakao.maps.InfoWindow({
			position : mapCenter,
			content : iwContent
		});
		mLabel.open(map, mMarker);
	</script>

</body>
</html>
