
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<a href="/LoginPage" class="btn btn-primary"
							style="width: 100%;">로그인</a>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<!-- Search widget-->
			<div class="card mb-4">
				<div class="card-header" style="text-align: center;">MOVIE
					PROJECT</div>
				<div class="card-body">
					<div class="loginInfo">
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
								<img class="img-profile" src="${sessionScope.loginProfile }">
							</c:otherwise>
						</c:choose>

						<h2 class="card-title mb-0">${sessionScope.loginName }</h2>
					</div>
				</div>
			</div>

			<!-- Categories widget-->
			<div class="card mb-4">
				<div class="card-header">플레이리스트</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-6">
							<img alt="" src="">
							<button>플래이버튼</button>
							<button>찜버튼</button>
							<a>제목</a> <a>작곡가</a>
						</div>
						<a>노래 리스트</a> <a>노래 리스트</a> <a>노래 리스트</a> <a>노래 리스트</a> <a>노래
							리스트</a> <a>노래 리스트</a>
					</div>
				</div>
			</div>

		</c:otherwise>

	</c:choose>


</div>
