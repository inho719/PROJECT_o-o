

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
.img-profile{
	width: 60%;
    border-radius: 100%;
}
</style>


<!-- Side widgets-->
<div class="col-lg-3">

	<c:choose>
		<c:when test="${sessionScope.loginId == null }">
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header" style="text-align: center;">로그인 후 이용
					해주세요!</div>
				<div class="card-body">
					<div class="input-group">
						<a href="/LoginPage" class="btn btn-primary" style="width: 100%;">로그인</a>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header" style="text-align: center;">${sessionScope.loginId} ${sessionScope.loginName }</div>
				<div class="card-body">
					<div class="loginInfo">
						<div class="d-flex justify-content-between">

							<c:choose>
								<c:when test="${sessionScope.loginState == 'YC' }">
									<c:choose>
										<c:when test="${sessionScope.loginProfile == null}">
											<%-- 등록된 프로필이 없는 경우 sessionScope.loginProfile --%>
											<img class="img-profile"
												src="${pageContext.request.contextPath }/resources/users/memberProfile/기본프로필.jpg">
										</c:when>
										<c:otherwise>
											<%-- 등록된 프로필이 있는 경우 --%>
											<img class="img-profile" 
												src="${pageContext.request.contextPath }/resources/users/memberProfile/${sessionScope.loginProfile }">
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<img class="img-profile "
										src="${sessionScope.loginProfile }">
								</c:otherwise>
							</c:choose>
							<div class="" style="text-align: center;align-self: center;width: 40%;">
							<div class="mb-3">
								<a class="nav-link" href="/memberLogout">로그아웃</a>
							</div>
							<div class="mb-3">
								<a class="nav-link" href="/MyInfoPage">내정보</a>
							</div>
							<div class="mb-3">
								<a class="nav-link" href="/CartPage">장바구니</a>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">플레이리스트</div>
				<div class="">
					<div class="row">
						<div class="">
							<div id="playlist">

								<div class="card-body d-flex">
									<div class="card-img">
										<div class="player" id="player"></div>
										<img alt="" class="me-5" style="width: 35%;"
											src="${pageContext.request.contextPath }/resources/users/album/앨범표지.jpg">
										<i onclick="playVideo()" class="bi bi-play-circle me-3"
											style="font-size: 35px;"></i> <a href="찜"> <i
											class="bi bi-arrow-through-heart-fill"
											style="font-size: 35px;"></i>
										</a>
									</div>
								</div>
								<div class="card-text card-body text-lg-center">
									<a>뜨거운 여름밤은 가고 남은건 볼품..</a> <br> <a>잔나비</a>
								</div>

								<c:choose>
									<c:when test="${sessionScope.sideState == 'M'}">
										<!-- 랭킹비교, 메인페이지일때 -->
										<c:forEach var="pl" items="${sessionScope.playlist}">

											<div class="card-body d-flex">
												<div class="card-img">
													<div id="player"></div>
													<img alt="" class="me-5" style="width: 35%;"
														src="${pageContext.request.contextPath }/resources/users/album/${pl.sgimg }">
													<a href="" class="me-3" id="playbtn"> <i
														class="bi bi-play-circle" style="font-size: 35px;"></i></a> <a
														href="찜"> <i class="bi bi-arrow-through-heart-fill"
														style="font-size: 35px;"></i>
													</a>
												</div>
											</div>
											<div class="card-text card-body text-lg-center">
												<a>${pl.sgtitle }</a> <br> <a>${pl.sgartist } </a>
											</div>
										</c:forEach>
									</c:when>

									<c:when test="${sessionScope.sideState == 'N'}">
										<!-- 뉴스,블로그,티켓 일때 -->
										<c:forEach var="pl" items="${sessionScope.playlist}" end="1">
											<div class="card-body d-flex">
												<div class="card-img">
													<div id="player"></div>
													<img alt="" class="me-5" style="width: 35%;"
														src="${pageContext.request.contextPath }/resources/users/album/${pl.sgimg }">
													<a href="" class="me-3" id="playbtn"> <i
														class="bi bi-play-circle" style="font-size: 35px;"></i></a> <a
														href="찜"> <i class="bi bi-arrow-through-heart-fill"
														style="font-size: 35px;"></i>
													</a>
												</div>
											</div>
											<div class="card-text card-body text-lg-center">
												<a>${pl.sgtitle }</a> <br> <a>${pl.sgartist } </a>
											</div>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:choose>
				<c:when test="${sessionScope.sideState == 'N'}">
					<!-- 조회수 뉴스,블로그,티켓,앨범페이지 -->
					<c:choose>
					<c:when test="${sessionScope.rankState == 'NW'}" >
					<div class="card mb-4">
						<div class="card-header">높은 조회수</div>
						<div class="card-body">
							<div class="" style="border-bottom: 2px solid black;" id = "NewsHit">
							
							</div>
						</div>
					</div>
					</c:when>
					<c:when test="${sessionScope.rankState == 'BL'}" >
					<div class="card mb-4">
						<div class="card-header">높은 조회수</div>
						<div class="card-body">
							<div class="" style="border-bottom: 2px solid black;" id = "BlogHit">
							
							</div>
						</div>
					</div>
					</c:when>
					</c:choose>

				</c:when>
				<c:when test="${sessionScope.sideState == 'P'}">
					<!-- 가격비교 페이지일때 -->
					<div class="card mb-4">
						<div class="card-header">가격비교</div>
						<div class="card-body">
							<img alt=""
								src="https://dummyimage.com/150x150/c1e3cd/ffffff.jpg">
						</div>
					</div>
				</c:when>

			</c:choose>


		</c:otherwise>

	</c:choose>

</div>

<script>
	// 2. This code loads the IFrame Player API code asynchronously.
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	var player = document.querySelector("#playlist > div.card-body.d-flex > div > div");

	function onYouTubeIframeAPIReady() {
		player = new YT.Player('player', {
			videoId : 'gfk3QLU1x0E',
			playerVars : {
				'controls' : 0
			},
			events : {
				'onReady' : onPlayerReady,
				'onStateChange' : onPlayerStateChange,
				'onError' : onPlayerError
			}
		});
		$('iframe').addClass('d-none');
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
</script>
<script type="text/javascript">
if (${sessionScope.rankState == 'NW'}) {
    $.ajax({
        type: "GET",
        url: "NewsHitList",
        dataType: 'json',
        success: function (result) {
            var newsHitDiv = document.getElementById("NewsHit");

            for (let i = 0; i < result.length; i++) {
                var hitNews = result[i];

                // Create a new div element
                var newsHitItemDiv = document.createElement("div");
                newsHitItemDiv.className = "news-hit-item";

                // Create a new anchor link
                var newsHitItem = document.createElement("a");
                newsHitItem.href = "javascript:void(0);"; // Set a dummy href

                // Set data-nwcode as a custom data attribute
                newsHitItem.setAttribute("data-nwcode", hitNews.NWCODE);

                newsHitItem.textContent = (i + 1) + ". " + hitNews.NWTITLE; // Adding the number
                newsHitItem.onclick = function () {
                    // Define an onclick function
                    // Get the NWCODE from the data attribute
                    var nwcode = this.getAttribute("data-nwcode");
                    // Redirect to the NewsInfoPage with the NWCODE
                    window.location.href = "NewsInfoPage?nwcode=" + nwcode;
                };

                // Append the anchor link to the div
                newsHitItemDiv.appendChild(newsHitItem);
                // Append the div to the NewsHit div
                newsHitDiv.appendChild(newsHitItemDiv);
            }
        },
    });
}
if (${sessionScope.rankState == 'BL'}) {
    $.ajax({
        type: "GET",
        url: "BlogHitList",
        dataType: 'json',
        success: function (result) {
            var BlogHitDiv = document.getElementById("BlogHit");

            for (let i = 0; i < result.length; i++) {
                var hitBlog = result[i];

                // Create a new div element
                var BlogHitItemDiv = document.createElement("div");
                BlogHitItemDiv.className = "Blog-hit-item";

                // Create a new anchor link
                var BlogHitItem = document.createElement("a");
                BlogHitItem.href = "javascript:void(0);"; // Set a dummy href

                // Set data-nwcode as a custom data attribute
                BlogHitItem.setAttribute("data-bgcode", hitBlog.BGCODE);

                BlogHitItem.textContent = (i + 1) + ". " + hitBlog.BGTITLE; // Adding the number
                BlogHitItem.onclick = function () {
                    // Define an onclick function
                    // Get the NWCODE from the data attribute
                    var bgcode = this.getAttribute("data-bgcode");
                    // Redirect to the NewsInfoPage with the NWCODE
                    window.location.href = "BlogInfoPage?bgcode=" + bgcode;
                };

                // Append the anchor link to the div
                BlogHitItemDiv.appendChild(BlogHitItem);
                // Append the div to the NewsHit div
                BlogHitDiv.appendChild(BlogHitItemDiv);
            }
        },
    });
}
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
