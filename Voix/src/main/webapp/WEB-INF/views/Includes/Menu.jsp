
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
	.homePageLink{
	font-size: 16px;
    margin-right: 12px;
    color: #ccc;
    text-decoration: none;
	
	}
	.navBarMain{
	margin-left: 60px;
    margin-right: 60px;
	}

.VoixImg{
    width: 100%;
    height: 200px;
    overflow: hidden;
}
</style>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

	<div class="container">
		<a class="homePageLink" href="https://www.melon.com/">멜론</a> <a
			class="homePageLink" href="https://vibe.naver.com/today">바이브</a> <a
			class="homePageLink" href="https://music.bugs.co.kr/">벅스</a> <a
			class="homePageLink" href="https://www.genie.co.kr/">지니</a> <a
			class="homePageLink" href="https://www.billboard.com/charts/hot-100/">빌보드</a>
		<a class="homePageLink" href="http://ticket.yes24.com/">예스24</a> <a
			class="homePageLink" href="https://www.interpark.com/">인터파크</a> <a
			class="homePageLink" href="https://www.aladin.co.kr/m/main.aspx">알라딘</a>
		<a class="homePageLink"
			href="https://product.kyobobook.co.kr/detail/S000001913217">교보문고</a>
		<a class="homePageLink" href="https://www.youtube.com/">유튜브</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${sessionScope.loginId == null}">
						<li class="nav-item"><a class="nav-link" href="/LoginPage">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="/JoinPage">회원가입</a></li>
					</c:when>

					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="/memberLogout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/MyInfoPage">내정보</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<!-- Page header with logo and tagline-->
<header class="py-5 border-bottom mb-4" style="background-color: #D9F0DE;">
	<div class="container">
		<div class="text-center my-5 VoixImg">
			
			<img class="w-100" alt="" src="/resources/assets/VoixImg5.png">  
			<h1 class="fw-bolder">VOIX</h1>
			<p class="lead mb-0"></p>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container navBarMain">
				<a class="navbar-brand" href="/NewsPage">뉴스</a> <a
					class="navbar-brand" href="/BlogPage">블로그</a> <a
					class="navbar-brand" href="/TicketPage">티켓</a> <a
					class="navbar-brand" href="/AlbumPage">엘범</a> <a
					class="navbar-brand" href="/ChartPage">랭킹비교</a> <a
					class="navbar-brand" href="/PricePage">가격비교</a>
			</div>

		</nav>
		<div>
			<input class="form-control" type="text"
				placeholder="Enter search term..." aria-label="Enter search term..."
				aria-describedby="button-search" />
			<button class="btn btn-primary" id="button-search" type="button">Go!</button>
		</div>
	</div>
</header>
