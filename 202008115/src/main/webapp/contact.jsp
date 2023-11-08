<%@ page contentType = "text/html;charset=utf-8" %>
<%	
%>
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
<script id="code">
        var elluce = new naver.maps.LatLng(37.50180355734507, 126.98714909796672)
        var map = new naver.maps.Map('map', {
          center: new naver.maps.LatLng(37.50180355734507, 126.98714909796672),
          zoom: 17,
          minZoom: 8, //지도의 최소 줌 레벨
          zoomControl: true, //줌 컨트롤의 표시 여부
          zoomControlOptions: { //줌 컨트롤의 옵션
              position: naver.maps.Position.TOP_RIGHT
        }});
        var marker = new naver.maps.Marker({
            icon: {
              url: "./icon/heart-icon.png",
              scaledSize: new naver.maps.Size(30, 37),
              origin: new naver.maps.Point(0, 0),
            },
            position: elluce,
            map: map
        });

        var contentString = [
        '<div class="iw_inner" style="padding:5px; margin: 5px 0px 5px 0px; width: 150px; height: 45px; text-align: center; ">',
        '   <p style="foint-size: 2rem; margin: 0;">엘루체컨벤션</p>',
        '   <p style="font-size: 0.8rem; margin: 0;">서울 서초구 신반포로 23</p>',
        '</div>'
        ].join('');

        var infowindow = new naver.maps.InfoWindow({
            content: contentString,
            maxWidth: 200,
            height: 50,
            backgroundColor: "white",
            borderColor: "black",
            borderWidth: 2,
            disableAnchor: true,
            textAlign: "center",
            margin: "auto",

            pixelOffset: new naver.maps.Point(0, -5)
        });

        naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
        });

        infowindow.open(map, marker);
    </script>

   <div>
     네비게이션 주소 : 인천광역시 미추홀구 인하로 100 (☏ 
    <a href="tel:032-870-2114">032-870-2114</a>) 

    <jsp:include page="footer.jsp" />
       
</body>
