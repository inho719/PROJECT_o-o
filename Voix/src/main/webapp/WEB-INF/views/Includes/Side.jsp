<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Side widgets-->
<div class="col-lg-4">

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
				<div class="card-header" style="text-align: center;">환영합니다.</div>
				<div class="card-body">
					<div class="loginInfo">
						<div class="d-flex mb-4">

							<c:choose>
								<c:when test="${sessionScope.loginState == 'YC' }">
									<c:choose>
										<c:when test="${sessionScope.loginProfile == null}">
											<%-- 등록된 프로필이 없는 경우 sessionScope.loginProfile --%>
											<img class="img-profile w-50"
												src="${pageContext.request.contextPath }/resources/users/memberProfile/기본프로필.jpg">
										</c:when>
										<c:otherwise>
											<%-- 등록된 프로필이 있는 경우 --%>
											<img class="img-profile w-50"
												src="${pageContext.request.contextPath }/resources/users/memberProfile/${sessionScope.loginProfile }">
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<img class="img-profile w-50 "
										src="${sessionScope.loginProfile }">
								</c:otherwise>
							</c:choose>
							<div class="w-50 text-center">
								<h2 class="card-title mb-0">${sessionScope.loginName }</h2>
								<p class="card-text">${sessionScope.loginId }</p>
							</div>
						</div>
						<div class="d-flex justify-content-center">
							<div class="">
								<a class="nav-link" href="/memberLogout">로그아웃</a>

							</div>
							<div class="ms-sm-5">
								<a class="nav-link" href="/MyInfoPage">내정보</a>
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
										<img alt="" class="me-5" style="width: 35%;"
											src="${pageContext.request.contextPath }/resources/users/album/앨범표지.jpg">
										<a href="재생" class="me-3"> <i class="bi bi-play-circle"
											style="font-size: 35px;"></i></a> <a href="찜"> <i
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
													<img alt="" class="me-5" style="width: 35%;"
														src="${pageContext.request.contextPath }/resources/users/album/${pl.sgimg }">
													<a href="재생" class="me-3"> <i class="bi bi-play-circle"
														style="font-size: 35px;"></i></a> <a href="찜"> <i
														class="bi bi-arrow-through-heart-fill"
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
													<img alt="" class="me-5" style="width: 35%;"
														src="${pageContext.request.contextPath }/resources/users/album/${pl.sgimg }">
													<a href="재생" class="me-3"> <i class="bi bi-play-circle"
														style="font-size: 35px;"></i></a> <a href="찜"> <i
														class="bi bi-arrow-through-heart-fill"
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
					<div class="card mb-4">
						<div class="card-header">높은 조회수</div>
						<div class="card-body">
							<div class="" style="border-bottom: 2px solid black;">1. 내용
								title</div>
							<div class="" style="border-bottom: 2px solid black;">2. 내용
							</div>
							<div class="" style="border-bottom: 2px solid black;">3. 내용
							</div>
							<div class="" style="border-bottom: 2px solid black;">4. 내용
							</div>
						</div>
					</div>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">