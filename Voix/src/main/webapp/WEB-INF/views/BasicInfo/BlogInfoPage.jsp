<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>블로그상세페이지 - BlogInfoPage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<style type="text/css">
.blogTitle {
	font-size: 32px;
	font-weight: bold;
	letter-spacing: -0.08em;
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

.textdiv {
	height: 100%;
	max-height: 150px;
	background: whitesmoke;
	overflow: scroll;
	overflow-x: hidden;
}

.textdiv::-webkit-scrollbar {
	width: 10px;
}

.textdiv::-webkit-scrollbar-track {
	background: whitesmoke; /* Track color */
}

.textdiv::-webkit-scrollbar-thumb {
	background-color: #ede9e7; /* Thumb color */
	border-radius: 10px; /* Rounded thumb */
}
</style>

</head>



<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>


	<!-- Responsive navbar-->
	<!-- Page content-->
	<div class="container">

		<div class="row">

			<div class="card col-md-12 mb-2 VOIXBODERLINE" style="background-color: whitesmoke;">
				<div class="blogTitle col-md-12 mb-2" style="margin-top: 10px;">
					<h2>${bg.bgtitle}</h2>
				</div>
				<div class="row">
				<c:if test="${bg.bgimg != null }">
					<img style="width: 350px; height: 300px object-fit: cover; margin-top: 4px;" alt="블로그사진" src="${bg.bgimg }">
				</c:if>
				<c:if test="${bg.bgimg == null }">
					<img class="AlbumImg" style="width: 350px; height: 300px;" src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" alt="..." />
				</c:if>
					<div class="card col-md-8 my-md-2 mx-md-3 ">
						<p>${bg.bgcontent }</p>
					</div>
				</div>
				<span style="font-size: 13px;">작성자: ${bg.bgwriter } // 작성일: ${bg.bgdate } // 조회수: ${bg.bgbighit }</span>
			</div>

		<div class="row">

			<div class="textdiv2" style=" height: 500px; width: 50%;">
				<div class="replyArea">
					<div class="row my-3 scroll" style="width: 100%; margin-left: 5px; padding: 0px; display: inline-block; height: auto; max-height: 450px;">
						<c:forEach items="${reviewList}" var="re">
							<div class="meminfo">
								<span>작성자: ${re.REWRITER} </span>
								<div style="margin-top: 5px; margin-bottom: 5px;">
									<!--
									<textarea rows="" cols="" class="rvcomm scroll" disabled="disabled">${re.RECONTENT}</textarea>
									-->	
									<div class="textdiv w-100" style="font-size: large; border:1px solid #cccc;">${re.RECONTENT}</div>
								</div>
								<c:if test="${sessionScope.loginId == re.REWRITER}">
									<button type="button" onclick="location.href='/deleteBlogReview?recode=${re.RECODE}&bgcode=${bg.bgcode}'" class="btn btn-danger" style="font-size: 14px; margin-bottom: 4px; width: 88px; height: 33px; float: right;">댓글 삭제</button>
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
					<form action="BlogRegistReview" class="my-3" method="post">
						<input type="text" name="restate" value="${bg.bgcode }" style="display: none">
						<textarea class="w-100 reviewComment" name="recontent" placeholder="댓글을 작성해보세요." style="height: 445px; background-color: whitesmoke; border-radius: 7px;"></textarea>
						<input class="btn w-100" style="background-color: #5e504e; color: white;" type="submit" value="댓글 등록">
					</form>
				</div>
				<hr>
			</c:if>
	</div>
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

</body>

</html>
