
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="resources/css/styles.css" rel="stylesheet" />
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="https://www.melon.com/">멜론</a> <a
			class="navbar-brand" href="#!">바이브</a> <a class="navbar-brand"
			href="#!">벅스</a> <a class="navbar-brand" href="#!">지니</a> <a
			class="navbar-brand" href="#!">빌보드</a> <a class="navbar-brand"
			href="#!">예스24</a> <a class="navbar-brand" href="#!">인터파크</a> <a
			class="navbar-brand" href="#!">알라딘</a> <a class="navbar-brand"
			href="#!">교보문고</a> <a class="navbar-brand" href="#!">유튜브</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- Page header with logo and tagline-->
<header class="py-5 bg-light border-bottom mb-4">
	<div class="container">
		<div class="text-center my-5">
			<h1 class="fw-bolder">VOIX</h1>
			<p class="lead mb-0">A Bootstrap 5 starter layout for your next
				blog homepage</p>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
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