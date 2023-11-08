<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Welcome</title>
<style type="text/css">
th {
	border: 1px solid black;
	padding: 10px;
}

td {
	border: 1px solid black;
	padding: 10px;
}

#popupDiv { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background: blue;
	width: 500px;
	height: 500px;
	display: none;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main role="main" style="background-color: #DFE9DF; margin: 0;">
		<%-- DFE9DF D9F0DE --%>
		<div class="container row">
			<div class="text-center col-md-8">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/_Hu4GYtye5U?si=ij5KIcjOOQFIo5Am"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/gfk3QLU1x0E?si=GVXEzFglm8iX7nDF"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>

			</div>

			<div class="text-center col-md-4"
				style="margin-top: 10px; display: block;">
				<div style="border: 3px solid #212529;">
					<div>
						<button>로그인</button>
					</div>
					<div>
						<button>회원가입</button>
					</div>
				</div>

				<div
					style="border: 3px solid #212529; margin-top: 10px; height: 500px;">
					<div>
						<div>

							<button id="btnPlay">재생 버튼</button>
							<button id="btnPause">일시정지 버튼</button>
							<button id="btnStop">정지 버튼</button>
						</div>

						<button id="popOpenBtn">Popup Open</button>

						<div id="popup_mask"></div>
						<!-- 팝업 배경 DIV -->

						<div id="popupDiv">
							<!-- 팝업창 -->
							<br> <br> <br> <br> <br> <br>
							<form action="">
								<div>
									<button>AA</button>
									<button>BB</button>
									<button>CC</button>
								</div>
								<div>
									<button>DD</button>
									<button>EE</button>
									<button>FF</button>
								</div>

							</form>
							<div style="position: fixed; margin-left: 16%;">
								<button id="popCloseBtn">close</button>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>

	</main>


	<footer class="">
		<div>
			<nav class="navbar navbar-expand navbar-dark bg-dark">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href="./welcome.jsp">고객센터</a>
						<p>&copy; WebMarket</p>
					</div>
				</div>
			</nav>
		</div>
		<p>&copy; WebMarket</p>
	</footer>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#popOpenBtn").click(function(event) { //팝업 Open 버튼 클릭 시 

			$("#popupDiv").css({

			//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

			});

			$("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
			$("#popupDiv").css("display", "block"); //팝업창 display block
			$("#popupDiv").css("background-color", "white");
			popdiv = $("#popupDiv").createElement("div");

			$("body").css("overflow", "hidden");//body 스크롤바 없애기
		});

		$("#popCloseBtn").click(function(event) {
			$("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
			$("#popupDiv").css("display", "none"); //팝업창 display none
			$("body").css("overflow", "auto");//body 스크롤바 생성
		});

	});

	// Audio 객체 설정
	const myAudio = new Audio();
	myAudio.src = "./sounds/bg.mp3";

	// 오디오 재생: 크롬브라우저에서 작동 안함
	myAudio.play();

	// Audio 객체 설정
	const myAudio = new Audio();
	myAudio.src = "./sounds/bg.mp3";

	// 오디오 재생: 크롬브라우저에서 작동 안함
	myAudio.play();

	// 버튼 취득
	const btnPlay = document.getElementById("btnPlay");
	const btnPause = document.getElementById("btnPause");
	const btnStop = document.getElementById("btnStop");

	// 재생 버튼
	btnPlay.onclick = function() {
		myAudio.play();
	}

	// 일시정지 버튼
	btnPause.onclick = function() {
		myAudio.pause();
	}

	// 정지 버튼
	btnStop.onclick = function() {
		myAudio.pause();
		myAudio.currentTime = 0; // 재생시간을 처음으로 설정
	}
</script>
</html>
