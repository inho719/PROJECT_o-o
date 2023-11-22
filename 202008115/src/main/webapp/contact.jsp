<%@ page contentType = "text/html;charset=utf-8" %>
<head>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
     <link rel="stylesheet" href="css/style.css">
    <title>Notebook</title>
</head>
<body>
    
<jsp:include page="menu.jsp" />

 <BR><BR>

    <div class="page_title">
      <h1>오시는길</h1>
    </div>


     네비게이션 주소 : 인천광역시 미추홀구 인하로 100 (☏ 
    <a href="tel:032-870-2114">032-870-2114</a>) 
<div id="map" style="width:800px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18a5f71bbe7bc58965ce6ce689f1e211"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.448315883048956, 126.6573770910951), 
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.448315883048956, 126.6573770910951); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position : markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);


    </script>
    <jsp:include page="footer.jsp" />
       
</body>
