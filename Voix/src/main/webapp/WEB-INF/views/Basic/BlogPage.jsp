<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Page</title>
<!-- Favicon-->
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
.blog-hit-item {
    white-space: nowrap; /* 줄 바꿈 방지 */
    overflow: hidden; /* 내용 숨기기 */
    text-overflow: ellipsis; /* 긴 내용에 대한 생략 부호 (...) */
    margin-bottom: 5px; /* 아래 여백 추가 (선택적) */
}
.blog-hit-item a {
    color: black; /* 링크 텍스트 색상을 검은색으로 설정 */
    text-decoration: none; /* 밑줄 제거 */
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-9">
				<!-- Featured blog post-->
				<c:forEach items="${BlogListMap}" var="BlogListMap">
					<div class="card mb-4">
						<div class="BlogDiv" style="display: flex;">
							<c:if test="${BlogListMap.BGIMG != null }">
								<div class="BlogImg">
									<a href="/BlogInfoPage?bgcode=${BlogListMap.BGCODE}"><img class="" src="${BlogListMap.BGIMG}"
										alt="..." style="width: 350px; height:300p object-fit: cover;" /></a>
								</div>
							</c:if>
							<c:if test="${BlogListMap.BGIMG == null }">
								<div class="BlogImg">
									<a href="/BlogInfoPage?nwcode=${BlogListMap.BGCODE}"><img class=""
										src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" 
										style="width: 350px; height:300px; object-fit: cover;" 	
										alt="..." /></a>
								</div>
							</c:if>
							<div class="BlogText" style="flex: 1;" >
								<div class="BlogTitle">
									<h2 class="card-title m-2" style ="overflow: hidden; height: 75px;">${BlogListMap.BGTITLE}</h2>
								</div>
								<div class="BlogContents p-2"  style="height: 150px; overflow: hidden;">
									<p class="card-text">${BlogListMap.BGCONTENT}</p>
								</div>
								<div class="small text-mute m-2"style="display: flex; justify-content: space-between; align-items: flex-end;">
		<!-- ---------------------------------------------------------------------------- -->
									<div class="like_article" onclick="like('${BlogListMap.BGCODE}')">
										<a href="#" class="prdLike">	
										<img alt="" src="/resources/assets/heart.png" style="width:30px;">									
										</a>
									</div>
									<a class="Views"
										style="text-decoration-line: none; color: gray;">${BlogListMap.BGWRITER}</a>
									<a class="Views"
										style="text-decoration-line: none; color: gray;">${BlogListMap.BGDATE}</a>
									<a class="Views"
										style="text-decoration-line: none; color: gray;">${BlogListMap.BGBIGHIT}</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
			<!-- end Page content-->
			<%@ include file="/WEB-INF/views/Includes/Side.jsp"%>
		</div>
	</div>
	<ul class="pagination" style="place-content: center;">
		<li><a href="?page=1">1</a></li>
		<li><a href="?page=2">2</a></li>
		<li><a href="?page=3">3</a></li>
		<li><a href="?page=4">4</a></li>
		<li><a href="?page=5">5</a></li>
		<li><a href="?page=6">6</a></li>
		<li><a href="?page=7">7</a></li>
		<!-- 다른 페이지 번호들을 추가하세요 -->
	</ul>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는
				데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	
	<!-- if(loginId.length === 0){ -->
	<script type="text/javascript">
	let loginId = '${sessionScope.loginId}';
	function like(blogCode){
	console.log(loginId);
	console.log(blogCode);
	if(loginId.length === 0){
		alert("로그인을 먼저 해주세요.");
		location.href="/LoginPage";
		
	} else {
	
		$.ajax({
			type : "GET",
			url : "likeNews",
			data : {
				"like" : blogCode
			},
			async : false,
			success : function(response) {
				alert("찜하기가 되었습니다.");
			},
			error: function(){
				console.error("찜하기 요청 중 오류 발생");
				alert("이미 찜이 되어있습니다.");
			}
		});
	
	}
}   
   </script>
	
</body>


</html>
