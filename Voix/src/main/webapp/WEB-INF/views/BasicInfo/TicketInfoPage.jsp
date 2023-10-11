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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18a5f71bbe7bc58965ce6ce689f1e211"></script>
	<script type="text/javascript">
		let tkplace = document.getElementById('tkplace').innerHTML;
		$.ajax({
			type : "get",
			url : "getMapXY",
			data : {
				"tkplace" : tkplace
			},
			dataType : "json",
			success : function(result) {
				console.log(result);
			}
		});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
				center : new kakao.maps.LatLng(35.543002909765484, 129.2599315712139), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			//지도에 클릭 이벤트를 등록합니다
			//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				// 클릭한 위도, 경도 정보를 가져옵니다		
				var latlng = mouseEvent.latLng;

			});
		마커를 클릭하면 장소명을 표출할 인포윈도우 입니다

	</script>
</body>
</html>
