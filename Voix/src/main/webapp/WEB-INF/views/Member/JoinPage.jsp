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
.card-body>div {
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

.checkMsg {
	font-size: 12px;
	margin-left: 4px;
	margin-top: 1px;
	margin-bottom: 1px;
}

.IdCheck {
	background-color: green;
	width: 100%;
	border-radius: 10px;
	font-size: 15px;
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
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<div class="container">

		<!-- 컨텐츠 시작 -->
		<div class="card mb-4 mx-auto" style="width: 500px;">
			<div class="card-body">
				<div>회원가입</div>
				<form action="${pageContext.request.contextPath}/Join" method="post" onsubmit="return formCheck(this)">
					<div>
						<input placeholder="아이디" class="formInput p-1" type="text" name="Id" id="inputId">
						<button type="button" class="IdCheck" onclick="checkId(this)">중복확인</button>
						<p class="checkMsg mb-2" id="idMsg">중복확인</p>
						<input placeholder="비밀번호" class="formInput p-1" type="text" name="RePw"> <input placeholder="비밀번호 확인" class="formInput p-1" type="text" name="CkPw"> <input placeholder="이름" class="formInput p-1" type="text" name="Name">
					</div>
					<div>
						<input placeholder="주소" class="formInput p-1" type="text" name="Address">
						<button type="button" class="mb-2">주소찾기</button>
						<input placeholder="상세주소" class="formInput p-1" type="text" name="DetailAddress">
					</div>
					<div>

						<div class="row m-1">
							<input type="text" name="memailId" id="inputEmailId" placeholder="이메일아이디"> @ <input type="text" name="memailDomain" id="inputDomain" placeholder="이메일도메인"> <select onchange="domainSelect(this)">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
							</select>
							<script type="text/javascript">
								function domainSelect(selObj){
				        		document.getElementById("inputDomain").value = selObj.value;
				        		/*document.querySelector("#inputDomain").value = selObj.value;*/
				    			}
							</script>
							<button type="button" onclick="gomailCheck()">보내기</button>
						</div>
						<div>
							<input type="text" name="Code" id="mail-check-input" placeholder="인증번호">
							<button type="button" class="mb-2" onclick="mailCheck()">확인</button>
							<span id="mail-check-warn"></span>
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
			<p class="m-0 text-center text-white">위 페이지의 출력되는 정보는 우측 상단에 있는 데이터 클롤링 및 페이지 양식을 인용하여 제작되었습니다.</p>
		</div>
	</footer>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/scripts.js"></script>
<script type="text/javascript">
	let buttonClicked = false;
	let button = document.getElementById('#IdCheck');
	function domainSelect(obj) {
		document.getElementById("inputDomain").value = obj.value;
	}
	function checkId(obj) {
		let idEl = document.querySelector('#inputId');
		let idMsg = $("#idMsg");
		console.log(idEl.value);
		$.ajax({
			type : "get",
			url : "memberIdCheck",
			data : {
				"inputId" : idEl.value
			},

			success : function(result) {
				if (result == "Y") {
					console.log("사용가능한 아이디");
					idMsg.css("color", "green").text('사용가능한아이디');
					$(obj).parent().removeClass('formInputErr');
					buttonClicked = true;
				} else {
					console.log("중복된 아이디");
					idMsg.css("color", "red").text('이미가입된아이디');
					$(obj).parent().addClass('formInputErr');
					buttonClicked = false;
				}
			}

		});

	}

	function formCheck(obj) {
		let idEl = obj.Id;
		let pwEl = obj.RePw;
		let cpEl = obj.CkPw;
		let emIdEl = obj.memailId;
		let emDoEl = obj.memailDomain;
		let naEl = obj.Name;
		let AdEl = obj.Address;
		if (idEl.value.length == 0) {
			alert('아이디를 입력해주세요');
			idEl.focus();
			return false;
		}
		if (!buttonClicked) {
			alert('중복체크를 해주세요');
			return false;
		}
		if (pwEl.value.length == 0) {
			alert('비밀번호를 입력해주세요');
			pwEl.focus();
			return false;
		}
		if (pwEl.value != cpEl.value) {
			alert('2차 비밀번호 확인을 해주세요');
			cpEl.focus();
			return false;
		}
		if (emIdEl.value.length == 0) {
			alert('이메일을 입력해주세요');
			emIdEl.focus();
			return false;
		}
		if (emDoEl.value.length == 0) {
			alert('이메일을 입력해주세요');
			emDoEl.focus();
			return false;
		}
		if (naEl.value.length == 0) {
			alert('이름 입력해주세요');
			naEl.focus();
			return false;
		}
		if (AdEl.value.length == 0) {
			alert('주소를 입력해주세요');
			AdEl.focus();
			return false;
		}

		else {
		}
		return;
	}

</script>
</html>
