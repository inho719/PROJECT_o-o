<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Core theme JS-->
<html>
<body>
	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
	
	<div id="player"></div>
	<button class="btn-info" onclick="playVideo()">재생</button>
	<a href="" class="me-3"id="playbtn"> <i class="bi bi-play-circle"
		style="font-size: 35px;"></i></a>
		
		
		
		
		
		<input type ="checkbox" value="" id="ch11">
		
	<script>
		// 2. This code loads the IFrame Player API code asynchronously.
		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		var player;
		var playbtn = document.getElementById("playbtn");
		function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				videoId : 'BzYnNdJhZQw',
				playerVars : {
					'autoplay' : 1,
					'controls' : 0
				},
				events : {
					'onReady' : onPlayerReady,
					'onStateChange' : onPlayerStateChange,
					'onError' : onPlayerError
				}
			});
			$('iframe').addClass('d-none');
			playbtn.addEventListener('click', function(event) {
				  player.playVideo();
			  });
		}

		function onPlayerReady(event) {
			event.target.setVolume(100);
		}

		function onPlayerStateChange(event) {
			if (event.data == YT.PlayerState.ENDED) {
				// 동영상이 종료되면 필요한 작업을 수행할 수 있습니다.
			}
		}

		function onPlayerError(event) {
			// 동영상 재생 중에 오류가 발생한 경우 처리할 수 있습니다.
		}

		function playVideo() {
			if (player) {
				player.playVideo();
			}
		}
		const checkbox = document.getElementById('ch11');
		checkbox.addEventListener('change',function(){
			console.log(checkbox.checked);
			
		});
		
		
	</script>

</body>
</html>
