<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
  /* 컨테이너 스타일 */
  .container {
    padding: 20px;
  }

  /* 카드 스타일 */
  .card {
    max-width: 500px;
    margin: 0 auto;
    background-color: #f5f5f5;
  }

  /* 카드 본문 스타일 */
  .card-body {
    padding: 20px;
    background-color: #fff;
  }

  /* 제목 스타일 */
  .card-body > div {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }

  /* 입력 필드 스타일 */
  .formInput {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  /* 중복확인 및 주소찾기 버튼 스타일 */
  input[type="button"] {
    padding: 10px 15px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  /* 이메일 입력 필드 스타일 */
  input[name="memailId"], input[name="memailDomain"] {
    width: 45%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  /* 이메일 도메인 선택 스타일 */
  select {
    width: 45%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  /* 보내기 및 확인 버튼 스타일 */
  button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  /* 인증번호 입력 필드 스타일 */
  input[name="Code"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/Includes/Menu.jsp" %>
	<div class="container">

		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 500px;">
			<div class="card-body">
				<div>회원가입</div>
				<form action="/LoginPage" method="post"
					onsubmit="return formCheck(this);">
					<div>
					<input placeholder="아이디" class="formInput p-1" type="text"
							name="Id">
					<button>중복확인</button>
					<input placeholder="비밀번호" class="formInput p-1" type="text"
							name="RePw">
					<input placeholder="비밀번호 확인" class="formInput p-1" type="text"
							name="CkPw">
					<input placeholder="이름" class="formInput p-1" type="text"
							name="Name">
					</div>
					<div>
					<input placeholder="주소" class="formInput p-1" type="text"
							name="Address">
					<button>주소찾기</button>
					<input placeholder="상세주소" class="formInput p-1" type="text"
							name="DetailAddress">
					</div>
					<div>
					
					<div class="row m-1">
						<input type="text" name="memailId" placeholder="이메일아이디">
					@
					<input type="text" name="memailDomain" id="inputDomain" placeholder="이메일도메인">
					<select onchange="domainSelect(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
					</select>
					<button>보내기</button>
					</div>
					<div>
					<input type="text" name="Code" placeholder="인증번호">
					<button>확인</button>
					</div>
					
					<button type="submit">회원가입하기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->

	</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는 
				데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
