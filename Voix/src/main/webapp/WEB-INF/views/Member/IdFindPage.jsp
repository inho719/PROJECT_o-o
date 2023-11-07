<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
.inputTag {
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<div class="container">

		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 450px; border-radius: 10px; background-color: whitesmoke;">
			<div class="card-body VOIXBODERLINE" style="border-radius: 7px;">
				<div style="font-size: 24px; font-weight: bold; color: #5e504e; justify-content: center; text-align: center; margin-bottom: 20px;">아이디 찾기</div>
				<form action="/memberLogin" method="post" onsubmit="return formCheck(this);">

					<div>
						<input type="text" class="inputTag" name="memailId" id="inputEmailId" placeholder="이메일아이디" style="width: 45%; margin-right: 4px; margin-bottom: 10px;"> @ 
						<input type="text" name="memailDomain" class="inputTag" id="inputDomain" placeholder="이메일도메인" style="width: 45%; margin-left: 4px; margin-bottom: 10px;"> 
						<select onchange="domainSelect(this)" class="inputTag" style="width: 75%; margin-left: 2px; border-radius: 5px;">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
						</select>
						<script type="text/javascript">
							function domainSelect(selObj) {
								document.getElementById("inputDomain").value = selObj.value;
								/*document.querySelector("#inputDomain").value = selObj.value;*/
							}
						</script>
						<button type="button" onclick="gomailCheck()" style="background-color: #5e504e; color: #ede9e7; width: 80px; margin-left: 7px; border-radius: 7px; margin-bottom: 10px;">보내기</button>
					</div>
					<div style="margin-left: 4px">
						<input type="text" class="inputTag" name="Code" id="mail-check-input" placeholder="인증번호" style="width: 75%;">
						<button type="button" class="mb-2" onclick="mailCheck()" style="background-color: #5e504e; color: #ede9e7; border-radius: 7px; width: 80px; margin-left: 7px;">확인</button>

						<div>
							<span id="mail-check-warn"></span>
						</div>
					</div>
					<div>
						<p>
							<a id="IdFind"></a>
						</p>
					</div>
					<div>
						<a type="button" href="LoginPage">로그인하기</a> / <a type="button" href="PwFindPage">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->

	</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는 데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/scripts.js"></script>
</html>
