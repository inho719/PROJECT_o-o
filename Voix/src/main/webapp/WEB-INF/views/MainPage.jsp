<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<script src="https://kit.fontawesome.com/acc1ccb443.js" crossorigin="anonymous"></script>
<style type="text/css">
.popup {
	margin: 20%;
}

.image {
	margin: 2%;
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

.image:hover {
	border: 3px solid yellow;
}

.button {
	margin-left: 35%;
}

.p {
	text-align: center;
}

.popup1 {
	display: flex;
}

.clickicon {
	border: 3px solid yellow;
	background-color: yellow;
}
.sliderImg{
	width: 100%;
	height: auto;
	object-fit: cover;
	display: block !important;
	width: 100%; 
 	position: absolute; 
 	top: 50%;
 	left: 50%; 
 	transform: translate(-50%, -50%);
	
}

.carousel-item{
	height: 460px;
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
				<!-- 슬라이더 부분 -->
				<div id="carouselExampleInterval" class="carousel slide VOIXBODERLINE" data-bs-ride="carousel" style="margin-bottom: 30px; box-shadow: 1px 1px 12px 0px #5e504e8a;">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="2000" >
							<a href="#" id="slide1">
								<img src="" class="d-block w-70 sliderImg" id="img1" alt="..." >
							</a>
						</div>
						<div class="carousel-item" data-bs-interval="2000" >
							<a href="#" id="slide2">
								<img src="" class="d-block w-70 sliderImg" id="img2" alt="...">
							</a>
						</div>
						<div class="carousel-item" data-bs-interval="2000" >
							<a href="#" id="slide3">
								<img src="" class="d-block w-70 sliderImg" id="img3" alt="...">
							</a>
						</div>
						<div class="carousel-item" data-bs-interval="2000" >
							<a href="#" id="slide4">
								<img src="" class="d-block w-70 sliderImg" id="img4" alt="...">
							</a>
						</div>
						<div class="carousel-item" data-bs-interval="2000" >
							<a href="#" id="slide5">
								<img src="" class="d-block w-70 sliderImg" id="img5" alt="...">
							</a>
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
					</button>
				</div>



				<!-- Featured blog post-->
				<div id="mainContents" class="d-none ">

					<div class="card mb-4 mainContainer VOIXBODERLINE " id="content1" >
						<a href="" style="height: 500px; overflow: hidden;">
							<img class="card-img-top" style="width: 100%;" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." />
						</a>
						<div class="card-body">
							<div class="small text-muted">January 1, 2023</div>
							<h2 class="card-title"></h2>
							<p class="card-text"></p>

						</div>
					</div>

					<div class="card mb-4 mainContainer VOIXBODERLINE " id="content2"  >
						<a href="" style="height: 500px; overflow: hidden;">
							<img class="card-img-top" style="width: 100%;" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." />
						</a>
						<div class="card-body">
							<div class="small text-muted">January 1, 2023</div>
							<h2 class="card-title">Featured Post Title</h2>
							<p class="card-text"></p>

						</div>
					</div>

					<div class="card mb-4 mainContainer VOIXBODERLINE " id="content3"  >
						<a href="" style="height: 500px; overflow: hidden;">
							<img class="card-img-top" style="width: 100%; " src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." />
						</a>
						<div class="card-body">
							<div class="small text-muted">January 1, 2023</div>
							<h2 class="card-title">Featured Post Title</h2>
							<p class="card-text"></p>

						</div>
					</div>

				</div>

			</div>

			<%@ include file="/WEB-INF/views/Includes/Side.jsp"%>

		</div>
	</div>
	<!-- 모달부분  -->
	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-centered " style="width: 100%; justify-content: center;">
			<!-- Blog post-->
			<div class="popup modal-content">
				<div class="modal-header">
					<h5 class="modal-title">메인페이지에 표기할 항목을 3가지 골라주세요 !!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="popup1">
						<div class="m-4">
							<img class="image" id="news" src="https://cdn-icons-png.flaticon.com/512/9494/9494759.png " alt="..." />
						</div>
						<div class="m-4">
							<img class="image" id="blog" src="   https://cdn-icons-png.flaticon.com/512/1187/1187544.png " alt="..." />
						</div>
						<div class="m-4">
							<img class="image" id="ticket" src="   https://cdn-icons-png.flaticon.com/512/432/432312.png " alt="..." />
						</div>
					</div>

					<div>
						<div class="popup1">
							<div class="m-4">
								<img class="image" id="album" src="https://cdn-icons-png.flaticon.com/512/2204/2204830.png" alt="..." />
							</div>
							<div class="m-4">
								<img class="image" id="chart" src="https://cdn-icons-png.flaticon.com/512/4498/4498210.png" alt="..." />
							</div>
							<div class="m-4">
								<img class="image" id="price" src="https://cdn-icons-png.flaticon.com/512/726/726478.png" alt="..." />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<p class="p">관심항목을 골라주새요(최대 3가지)</p>
					<button class="btn" id="btn" onclick="goMain()">선택완료</button>
				</div>
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
	<script type="text/javascript" src="/resources/js/scripts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
	let ST = '${ST}';
	console.log(ST.length);
		var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
			keyboard : false,
		});
		
		if( ST.length == 0 ){
		myModal.show();			
		}else if( ST.length > 0){
			
			let body = document.querySelector("#mainContents");
			body.classList.remove("d-none");

			$.ajax({
				url : "getSelContents",
				type : "post",
				dataType : "json",
//	 			traditional : true,			배열을 ajax에서 컨트롤러로 보낼수잇게 하는 구문 JSON.stringify(ST)
				async : false,
				data : { "selThemas" : ST },
				success : function(results){
					console.log(results);
					let i = 0;
					for(let re of results){
						i++;
						let title = re.TITLE;
						let img = re.IMG;
						let date = re.DAT2;
						let content = re.CONTENT;
						let code = re.CODE;
						let first_char = code.charAt(0);
						console.log(code);
						console.log(first_char);
						document.querySelector("#content"+i+"> div > h2").innerText = title;
						document.querySelector("#content"+i+"> a > img").src = img;
						document.querySelector("#content"+i+"> div > div").innerText = date;
						document.querySelector("#content"+i+"> div > p").innerText = content;
						switch (first_char) {
						case 'N':
							document.querySelector("#content"+i+"> a").setAttribute('href',"/NewsPage" );
							break;
						case 'B':
							document.querySelector("#content"+i+"> a").setAttribute('href', "/BlogPage");
							break;
						case 'T':
							document.querySelector("#content"+i+"> a").setAttribute('href', "/TicketPage");
							break;
						case 'A':
							document.querySelector("#content"+i+"> a").setAttribute('href',"/AlbumPage");
							break;
						case 'S':
							document.querySelector("#content"+i+"> a").setAttribute('href',"/ChartPage");
							break;
						case 'P':
							document.querySelector("#content"+i+"> a").setAttribute('href',"/PricePage");
							break;
						}
						
					}
				}
				// #content1 > a   #content1 > div > a #content2 > img
			});	
		}
		//myModal.hide()
	</script>
	<script type="text/javascript">
	let img = document.querySelectorAll('.image');
	let clickedImageIds = [];

	img.forEach(function(menu) {
	    menu.addEventListener("click", function() {
	        if (menu.classList.contains("clickicon")) {
	            // 이미 클릭된 이미지인 경우, 클래스 제거 및 배열에서 제거
	            menu.classList.remove("clickicon");
	            const clickedImageId = menu.getAttribute("id");
	            const index = clickedImageIds.indexOf(clickedImageId);
	            if (index !== -1) {
	                clickedImageIds.splice(index, 1);
	            }
	        } else {
	            // 이미지에 "clickicon" 클래스가 3개 미만인 경우만 클래스 추가 및 배열에 추가
	            if (clickedImageIds.length < 3) {
	                menu.classList.add("clickicon");
	                const clickedImageId = menu.getAttribute("id");
	                clickedImageIds.push(clickedImageId);
	            }
	        }
	    });
	});

	document.getElementById("btn").addEventListener("click", function() {
	    if (clickedImageIds.length >= 3) {
	        goMain(clickedImageIds);
	    }else{
	    	location.reload();
	    }
	});

	
	
	function goMain(clickImgs) {
		let body = document.querySelector("#mainContents");
		body.classList.remove("d-none");
		myModal.hide();
		
		let selThemas = [];
		for(let thema of clickImgs){
			let thamaJson = { "thema" : thema };
			selThemas.push(thamaJson);
		}
		
		$.ajax({
			url : "getSelContents",
			type : "post",
			dataType : "json",
// 			traditional : true,			배열을 ajax에서 컨트롤러로 보낼수잇게 하는 구문
			async : false,
			data : { "selThemas" :  JSON.stringify(selThemas)},
			success : function(results){
				console.log(results);
				let i = 0;
				for(let re of results){
					i++;
					let title = re.TITLE;
					let img = re.IMG;
					let date = re.DAT2;
					let content = re.CONTENT;
					let code = re.CODE;
					let first_char = code.charAt(0);
					console.log(title);
					document.querySelector("#content"+i+"> div > h2").innerText = title;
					document.querySelector("#content"+i+"> a > img").src = img;
					document.querySelector("#content"+i+"> div > div").innerText = date;
					document.querySelector("#content"+i+"> div > p").innerText = content;
				}
			}
			// #content1 > a   #content1 > div > a #content2 > img
		});

	}
	</script>
	<script type="text/javascript">
	let i = 0;
	$.ajax({
		url : "getAllImg",
		type : "post",
		async : false,
		success : function(results){
			console.log(results);
			for(let re of results){
				i++;
				let imgTag = document.querySelector("#img"+i).src = re.IMG;
				console.log(imgTag);		
				let code = re.CODE; // CODE 정보 추출
				console.log(code);		
				
				 if (code.startsWith("N")) {
					 document.getElementById("slide1").addEventListener("click", function() {
						    window.location.href = "/NewsInfoPage?nwcode=" + re.CODE; // 여기서 re.CODE를 사용하여 동적으로 URL을 생성
						});
	                } else if (code.startsWith("B")) {
	                	document.getElementById("slide2").addEventListener("click", function() {
	    				    window.location.href = "/BlogInfoPage?bgcode=" + re.CODE;
	    				});
	                } else if (code.startsWith("A")) {
	                	document.getElementById("slide3").addEventListener("click", function() {
	    				    window.location.href = "/AlbumInfoPage?alcode=" + re.CODE;
	    				});
	                } else if (code.startsWith("T")) {
	                	document.getElementById("slide4").addEventListener("click", function() {
	    				    window.location.href = "/TicketInfoPage?tkcode=" + re.CODE;
	    				});
	                } else if (code.startsWith("S")) {
	                	document.getElementById("slide5").addEventListener("click", function() {
	    				    window.location.href = "/ChartInfoPage?sgcode=" + re.CODE;
	    				});
	                }
			}
		}
	});
	
	</script>

</body>
</html>
