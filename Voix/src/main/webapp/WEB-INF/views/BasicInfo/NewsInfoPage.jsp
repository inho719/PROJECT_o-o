<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>뉴스상세페이지 - NewsInfoPage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<style type="text/css">
.newsTitle {
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

			<div class="card col-md-12 mb-2 VOIXBODERLINE" style="height: 400px; background-color: whitesmoke;">
				<div class="newsTitle col-md-12 mb-2" style="margin-top: 10px;">
					<h2>${nw.nwtitle}</h2>
				</div>
				<div class="row">
					<img style="width: 450px; height: 300px; margin-top: 4px; border-radius: 30px;" alt="뉴스사진" src="${nw.nwimg }">
					<div class="col-md-6">
						<p>${nw.nwcontent }</p>
					</div>
				</div>
				<span style="font-size: 13px;">작성일: ${nw.nwdate } // 조회수: ${nw.nwbighit }</span>
			</div>





			<div class="row">

				<div class="textdiv2" style="height: 500px; width: 50%;">
					<div class="replyArea">
						<div class="row my-3 scroll" style="width: 100%; margin-left: 5px; padding: 0px; display: inline-block; height: auto; max-height: 450px;">
							<c:forEach items="${reviewList}" var="re">
								<div class="meminfo">
									<span style="font-style: italic;">작성자: ${re.REWRITER} </span>
									<div style="margin-top: 5px; margin-bottom: 5px;">
										<div class="textdiv w-100" style="font-size: large; border: 1px solid #cccc; padding: 10px; background-color: whitesmoke;">${re.RECONTENT}</div>
									</div>
									<c:if test="${sessionScope.loginId == re.REWRITER}">
										<button type="button" onclick="location.href='/deleteNewsReview?recode=${re.RECODE}&nwcode=${nw.nwcode}'" class="btn" style="font-size: 14px; margin-bottom: 4px; width: 88px; height: 33px; float: right; color: #ede9e7; background-color: #5e504e">댓글 삭제</button>
									</c:if>
									<div class="small text-muted" style="font-size: 12px;">작성시간: ${re.REDATE}</div>
								</div>
								<hr>
							</c:forEach>
						</div>
					</div>
				</div>

				<!-- 댓글 관련 부분 시작 -->
				<c:if test="${sessionScope.loginId != null }">
					<div class="reviewWrite" style="width: 50%">
						<form action="newsRegistReview" class="my-3" method="post">
							<input type="text" name="restate" value="${nw.nwcode }" style="display: none">
							<textarea class="w-100 reviewComment" name="recontent" placeholder="댓글을 작성해보세요." style="height: 445px; background-color: whitesmoke; border-radius: 7px;"></textarea>
							<input class="btn w-100" style="background-color: #5e504e; color: white;" type="submit" value="댓글 등록">
						</form>
					</div>
					<hr>
				</c:if>
				
			</div>

		</div>
	</div>
	<!-- 댓글 관련 부분 끝 -->


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
