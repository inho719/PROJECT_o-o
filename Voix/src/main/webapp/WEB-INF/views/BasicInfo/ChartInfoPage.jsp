<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>랭킹상세페이지 - ChartInfoPage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<style type="text/css">
.textdiv {
	height: 100%;
	max-height: 150px;
	background: #f8f9fa;
	overflow: scroll;
	overflow-x: hidden;
}

.textdiv::-webkit-scrollbar {
	width: 10px;
}

.textdiv::-webkit-scrollbar-track {
	background: #f8f9fa; /* Track color */
}

.textdiv::-webkit-scrollbar-thumb {
	background-color: #888; /* Thumb color */
	border-radius: 10px; /* Rounded thumb */
}

.textdiv2 {
	height: 100%;
	overflow: scroll;
	overflow-x: hidden;
}

.textdiv2::-webkit-scrollbar-thumb {
	background-color: whitesmoke; /* Thumb color */
	border-radius: 10px; /* Rounded thumb */
}

.textdiv2::-webkit-scrollbar {
	width: 10px;
}

.scroll::-webkit-scrollbar {
	width: 10px;
}

.scroll::-webkit-scrollbar-thumb {
	background-color: #ede9e7;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.scroll::-webkit-scrollbar-track {
	background-color: whitesmoke;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
</style>

</head>



<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>


	<!-- Responsive navbar-->
	<!-- Page content-->
	<div class="container">



		<c:forEach items="${ChartInfoList}" var="ChartInfoList">
			<div class="row">
				<div class="card col-md-4 mb-4" style="background-color: #ede9e7; border: none;">
					<img alt="랭킹 포스터" class="VOIXBODERLINE" src="${ChartInfoList.sgimg}" style="border-radius: 7px;">
				</div>

				<div class="card col-md-8 mb-4 VOIXBODERLINE" style="border-radius: 10px; background-color: whitesmoke;">
					<p>${ChartInfoList.sgartitle}</p>
					<p id="sgtitle">${ChartInfoList.sgtitle}</p>
					<p>${ChartInfoList.sginfo}</p>
					<p>아티스트:${ChartInfoList.sgartist}</p>

					<c:choose>
						<c:when test="${sessionScope.SGLIKED eq 'true'}">
							<div class="like_article" style="position: absolute; right: 20px; bottom: 20px;" onclick="like('${ChartInfoList.sgcode}', this)">
								<a class="prdLike" style="cursor: pointer;">
									<img alt="" src="/resources/assets/heart.png" style="width: 30px;">
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="like_article" style="position: absolute; right: 20px; bottom: 20px;" onclick="like('${ChartInfoList.sgcode}', this)">
								<a class="prdLike" style="cursor: pointer;">
									<img alt="" src="/resources/assets/blankheart.png" style="width: 30px;">
								</a>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>


			<div class="row">

				<div class="col mb-4" style="margin-right: -10px;">
					<div id="player"></div>
				</div>

				<div class="card col mb-4 VOIXBODERLINE " style="height: 515px; border-radius: 10px; background-color: whitesmoke;">
					<div style="text-align: center; background-color: #5e504e; color: #ede9e7; border: 1px solid #5e504e; border-radius: 10px; margin-top: 4px; margin-bottom: 7px;">가사</div>
					<div class="scroll" style="height: 515px; overflow: scroll; overflow-x: hidden; overflow-y: auto; margin-left: 10px;">${ChartInfoList.sglyric}</div>
				</div>

			</div>
		</c:forEach>

		<div class="row">

			<div class="textdiv2" style="height: 500px; width: 50%;">
				<div class="replyArea">
					<div class="row my-3 scroll" style="width: 100%; margin-left: 5px; padding: 0px; display: inline-block; height: auto; max-height: 450px;">
						<c:forEach items="${reviewList}" var="re">
							<div class="meminfo">
								<span style="font-style: italic;">작성자: ${re.REWRITER} </span>
								<div style="margin-top: 5px; margin-bottom: 5px;">
									<div class="textdiv w-100" style="font-size: large; border: 1px solid #cccc; padding: 10px;">${re.RECONTENT}</div>
								</div>
								<c:if test="${sessionScope.loginId == re.REWRITER}">
									<button type="button" onclick="location.href='/deleteChartReview?recode=${re.RECODE}&sgcode=${SgInfo.sgcode}'" class="btn" style="font-size: 14px; margin-bottom: 4px; width: 88px; height: 33px; float: right; color: #ede9e7; background-color: #5e504e">댓글 삭제</button>
								</c:if>
								<div class="small text-muted">작성시간: ${re.REDATE}</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>
			</div>

			<c:if test="${sessionScope.loginId != null }">
				<div class="reviewWrite" style="width: 50%">
					<form action="ChartRegistReview" class="my-3" method="post">
						<input type="text" name="restate" value="${SgInfo.sgcode }" style="display: none">
						<textarea class="w-100 reviewComment" name="recontent" placeholder="댓글을 작성해보세요." style="height: 445px; background-color: whitesmoke; border-radius: 7px;"></textarea>
						<input class="btn w-100" style="background-color: #5e504e; color: white;" type="submit" value="댓글 등록">
					</form>
				</div>
				<hr>
			</c:if>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		let loginId = '${sessionScope.loginId}';
		function like(SongCode) {
			console.log(loginId);
			console.log(SongCode);
			if (loginId.length == 0) {
				alert("로그인을 먼저 해주세요.");
				location.href = "/LoginPage";
			} else {

				$
						.ajax({
							type : "GET",
							url : "likeSong",
							data : {
								"like" : SongCode
							},
							//async: false,
							success : function(response) {
								if (response == 1) {
									// '찜' 성공
									alert("찜하기가 되었습니다.");
									// 이미지 업데이트
									document
											.querySelector('body > div > div:nth-child(1) > div.card.col-md-8.mb-4 > div > a > img').src = '/resources/assets/heart.png';
								} else if (response == 0) {
									// '찜' 취소
									alert("찜하기가 취소되었습니다.");
									// 이미지 업데이트
									document
											.querySelector('body > div > div:nth-child(1) > div.card.col-md-8.mb-4 > div > a > img').src = '/resources/assets/blankheart.png';
								}
							},
							error : function() {
								console.error("찜하기 요청 중 오류 발생");
								alert("찜하기에 실패했습니다.");
							}
						});
			}
		}
	</script>
	<script src="https://www.youtube.com/iframe_api"></script>

	<script type="text/javascript">
		let videoId = null;
		$(function() {

			var player = document.querySelector("#player");

			var searchKeyWord = document.getElementById('sgtitle').innerText;

			console.log(searchKeyWord);
			$.ajax({
				type : 'get',
				url : 'https://www.googleapis.com/youtube/v3/search',
				data : ({

					'part' : 'snippet',
					'maxResult' : '1',
					'q' : searchKeyWord,
					'type' : 'video',
					'key' : 'AIzaSyDwUScxFiKbqnG1VbtM33itvJtDmaIdKI8'
				}),
				dataType : 'json',
				async : false,
				success : function(result) {
					console.log(result);
					console.log(result.items[0].id.videoId);
					videoId = result.items[0].id.videoId;

					return videoId;
				}
			});
		});
		console.log('시작');
		setTimeout(function onYouTubeIframeAPIReady(result) {
			console.log('1.5초경과');
			player = new YT.Player('player', {
				height : '100%',
				width : '1000',
				videoId : videoId,
				playerVars : {
					'controls' : 0,
				},
				events : {
					'onReady' : onPlayerReady,
					'onStateChange' : onPlayerStateChange,
					'onError' : onPlayerError
				}
			});
			console.log(player);
		}, 1500);

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

		function stopVideo() {
			player.stopVideo();
		}
	</script>
</body>

</html>
