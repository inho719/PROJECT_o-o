<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<div class="container">

		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 1000px;">
			<div class="card-body">
				<div>

					<div class="row">

						<img alt="" src="${mInfo.mimg }" style="width: 150px; height: 130px;">


						<div class="col">
							이름: <input type="text" name="joinName" value="${mInfo.mname}" disabled> <br> 이메일: <input type="text" name="joinName" value="${mInfo.memail}" disabled> <br> 주소: <input type="text" name="postcode" value="${mInfo.maddr}" disabled> <br> <br> <input type="button" onclick="/MyInfoUpdate()" value="내정보 변경하기 버튼">
						</div>
				

					</div>

					<br>

					<div class="row">
						<div class="col" style="text-align: center;">구매내역(링크)</div>
						<div class="col" style="text-align: center;">찜목록</div>
						<div class="col" style="text-align: center;">내가쓴 댓글</div>
					</div>

					<br>
					<hr>

					<div class="card mb-4">
						<div class="NewsDiv" style="display: flex;">

							<c:forEach items="${newsLikeList}" var="news">
								<div class="NewsImg">
									<a href="#뉴스코드"><img style="width: 350px; height: 200px;" src="${news.NWIMG}" alt="..." /></a>
								</div>
								<div class="NewsText" style="flex: 1;">
									<div class="NewsTitle">

										<h4>${news.NWTITLE}</h4>
									</div>
									<div class="NewsContents p-2">
										<p class="card-text">${news.NWCONTENT}</p>
									</div>
									<div class="small text-mute m-2" style="display: flex; justify-content: space-between; align-items: flex-end;">
										<a href="찜"><img alt="" src="/resources/assets/heart.png"></a> <a class="Views" style="text-decoration-line: none; color: gray;">조회수:${news.NWBIGHIT }</a>
									</div>
								</div>

							</c:forEach>


						</div>
					</div>
					<a>블로그에서 만든 형식(해야함 디비가 안들어가 해줘)</a>
				</div>
				<div>
					<div class="card mb-4">
						<div class="AlbumDiv" style="display: flex;">
							<c:forEach items="${albumsLikeList}" var="albums">
								<div class="AlbumImg">
									<a href="#앨범코드"><img class="" style="width: 350px; height: 200px;" src="${albums.ALIMG}" alt="..." /></a>
								</div>
								<div class="NewsText" style="flex: 1;">
									<div class="AlbumTitle">
										<h4 class="card-title m-2">${albums.ALTITLE}</h4>
									</div>
									<div class="AlbumContentsWrapper">
										<div class="AlbumText p-2 d-flex" style="justify-content: space-between;">
											<p class="card-text">${albums.ALARTIST}</p>
											<p class="card-text">${albums.ALINFO}</p>
										</div>
									</div>
									<div class="small m-2 d-flex" style="justify-content: space-between;">
										<p class="text-mute">${albums.ALPRICE}원</p>
										<a href="찜" class=""><img alt="" src="/resources/assets/heart.png"></a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div>
					<div class="card mb-4">
						<div class="NewsDiv" style="display: flex;">

							<c:forEach items="${songsLikeList}" var="songs">
								<div class="NewsImg">
									<a href="#뉴스코드"><img style="width: 350px; height: 200px;" src="${songs.SGIMG}" alt="..." /></a>
								</div>
								<div class="NewsText" style="flex: 1;">
									<div class="NewsTitle">

										<h4>${songs.SGARTIST}</h4>
									</div>
									<div class="NewsContents p-2">
										<p class="card-text">${songs.SGINFO}</p>
									</div>
									<div class="small text-mute m-2" style="display: flex; justify-content: space-between; align-items: flex-end;">
										<a href="찜"><img alt="" src="/resources/assets/heart.png"></a> <a class="Views" style="text-decoration-line: none; color: gray;"></a>
									</div>
								</div>

							</c:forEach>


						</div>
					</div>
				</div>
				<div>
					<div class="card mb-4">
						<div class="TicketDiv" style="display: flex;">
							<c:forEach items="${ticketsLikeList}" var="tickets">
								<div class="TicketImg">
									<a href="#티켓코드"><img class="" src="${tickets.TKIMG}" alt="..." /></a>
								</div>
								<div class="TicketContents w-100">
									<div class="TicketTitle">
										<h2 class="card-title m-2">${tickets.TKARTIST}</h2>
									</div>
									<div class="TicketContentsWrapper">
										<div class="TicketText p-2 d-flex" style="justify-content: space-between;">
											<p class="card-text">${tickets.TKINFO}</p>
											<p class="card-text small"></p>
										</div>
									</div>
									<div class="small text-mute m-2" style="text-align: end;">
										<a href="찜" class=""><img alt="" src="/resources/assets/heart.png"></a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div></div>

			</div>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->




	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는 데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>