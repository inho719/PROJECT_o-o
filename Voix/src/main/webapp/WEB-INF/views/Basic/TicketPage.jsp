<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Ticket Page</title>
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
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Ticket entries-->
			<div class="col-lg-9">
				<div class="w-100">
					<div class="list-group">
						<ul class="list-group list-group-horizontal" style="list-style: none;">
							<li class="w-25"><a class="list-group-item" href="/choosSite?siteVal=melon">멜론</a></li>
							<li class="w-25"><a class="list-group-item" href="/choosSite?siteVal=interpark">인터파크</a></li>
							<li class="w-25"><a class="list-group-item" href="/choosSite?siteVal=yes24">예스24</a></li>
							<li class="w-25"><a class="list-group-item" href="/choosSite?siteVal=11bunga">11번가</a></li>
						</ul>
					</div>
				</div>



				<!-- Featured Ticket post-->
				<c:forEach items="${TkListMap}" var="TkMap">
					<div class="card mb-3">
						<div class="TicketDiv" style="display: flex;">
							<c:if test="${TkMap.TKIMG != null }">
								<div class="TicketImg" style="margin-right: 4px;">
									<a href="/TicketInfoPage?tkcode=${TkMap.TKCODE}">
										<img style="width: 240px; height: 340px;" class="" src="${TkMap.TKIMG}" alt="..." />
									</a>
								</div>
							</c:if>
							<c:if test="${TkMap.TKIMG == null }">
								<div class="TicketImg">
									<a href="/TicketInfoPage?tkcode=${TkMap.TKCODE}">
										<img style="width: 240px; height: 340px;" class="" src="https://dummyimage.com/150x150/c1e3cd/ffffff.jpg" alt="..." />
									</a>
								</div>
							</c:if>
							<div class="TicketContents w-100">
								<div class="TicketTitle">
									<h3 class="card-title m-2">${TkMap.TKTITLE}</h3>
								</div>
								<div class="TicketContentsWrapper">
									<div class="TicketText p-2 d-flex" style="justify-content: space-between;">
										<div>
											<p class="card-text small"><br>${TkMap.TKDATE}</p>
											<br>
											<p class="card-text small">${TkMap.TKPLACE}</p>
											<br>
											<p class="card-text small">${TkMap.TKTIME}</p>
											<br>
											<p class="card-text small">${TkMap.TKARTIST}</p>
										</div>
									</div>
								</div>
								<div class="small text-mute m-2" style="text-align: end;">
									<c:choose>
									    <c:when test="${TkMap.TKLIKED eq 'true'}">
									        <div class="like_article" onclick="like('${TkMap.TKCODE}', this)">
									            <a class="prdLike" style="cursor: pointer;">
									                <img alt="" src="/resources/assets/heart.png" style="width: 30px;">
									            </a>
									        </div>
									    </c:when>
									    <c:otherwise>
									        <div class="like_article" onclick="like('${TkMap.TKCODE}', this)">
									            <a class="prdLike" style="cursor: pointer;">
									                <img alt="" src="/resources/assets/blankheart.png" style="width: 30px;">
									            </a>
									        </div>
									      
									    </c:otherwise>
									</c:choose>
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
	<script type="text/javascript">
    let loginId = '${sessionScope.loginId}';
    function like(ticketCode, element) {
        console.log(loginId);
        console.log(ticketCode);
        if (loginId.length === 0) {
            alert("로그인을 먼저 해주세요.");
            location.href = "/LoginPage";
        } else {

        	$.ajax({
        	    type: "GET",
        	    url: "likeTicket",
        	    data: {
        	        "like": ticketCode
        	    },
        	    //async: false,
        	    success: function(response) {
        	        if (response === 1) {
        	            // '찜' 성공
        	            alert("찜하기가 되었습니다.");
        	            // 이미지 업데이트
        	            element.querySelector('img').src = '/resources/assets/heart.png';
        	        } else if (response === 0) {
        	            // '찜' 취소
        	            alert("찜하기가 취소되었습니다.");
        	            // 이미지 업데이트
        	            element.querySelector('img').src = '/resources/assets/blankheart.png';
        	        } else {
        	            // 이미 '찜'한 경우
        	            alert("이미 찜이 되어있습니다.");
        	            // 이미지 업데이트
        	            element.querySelector('img').src = '/resources/assets/blankheart.png'; 
        	        }
        	    },
        	    error: function() {
        	        console.error("찜하기 요청 중 오류 발생");
        	        alert("찜하기에 실패했습니다.");
        	    }
        	});
        }
    }
</script>
	
</body>
</html>
