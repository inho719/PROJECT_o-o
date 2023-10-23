<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>AlbumInfoPage</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
line {
   display: inline-block;
}

albuminfo {
   padding: 5px !important;
}

button {
   width: 100%;
   background-color: gray;
   border: none;
}
.disNone{
   display: none;
}
.AlbumImg{
	width:100%;
}
.selectbox{
	border: 1px solid #ccc;
    border-radius: 20px;
    text-align: center;
    width: 100px;
}
.infoBox{
    height: 600px;
    overflow: overlay;
}
.infoBox::-webkit-scrollbar{
width: 10px;
}

</style>
</head>
<body>
   <!-- Responsive navbar-->
   <%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
   <!-- Page content-->
   <div class="container">
      <div>
         <div class="row">

            <c:if test="${ALInfo.alimg != null }">
               <div class="col mb-4">
                  <img class="AlbumImg" src="${ALInfo.alimg}" alt="..." />
               </div>
            </c:if>
            <c:if test="${ALInfo.alimg == null }">
               <div class="col">
                  <img class="AlbumImg" src="https://dummyimage.com/200x200/c1e3cd/ffffff.jpg" alt="..." />
               </div>
            </c:if>
            <div class="card col-md-5 mb-4" style="font-size: x-large;">
            	<div class="card-title text-lg-center">
            		<p style="font-size: xx-large;">${ALInfo.alartist}</p>
            	</div>
              	<div class="card-body infoBox">
              		<p style="font-size:">${ALInfo.alinfo}</p>
              	</div>
              	<div class="card-footer text-lg-center" style="background-color: unset;">
              		<p>${ALInfo.aldate}</p>
              	</div>
            </div>


         </div>
      </div>

      <div class="col-md-12 mb-2" style="font-size: xxx-large;">${ALInfo.allist}</div>

      <div>
         <div class="row">
            <div class="card col-md-8 mb-2 p-3" style="font-size: x-large;">
               <div class="mb-2 m-3">원가 : ${ALInfo.alprice}원</div>
               <c:forEach items="${AlbumInfoList}" var="AlbumInfoList">
                  <div class="mb-2 m-3">
                     <input type="radio" name="al" id="${AlbumInfoList.alcode}" oninput ="is_checked(this)" value="${AlbumInfoList.alcode}">
		                   ${AlbumInfoList.alsaleprice}원
                     <!--내일 이거 해야함 체크 표시 해야 나오게  -->
                     <input id="selectQty_${AlbumInfoList.alcode}" type="number" value="1" min="1" placeholder="수량" class="disNone selectbox">
                  </div>
               </c:forEach>
            </div>
            <div class=" col-md-4 mb-2 " style="display: inline-block;align-self: center;">
               <div>
                  <button type="submit" class="btn btn-success mb-4" style="font-size: x-large;"onclick="formsubmit('InsertCartPage')">장바구니 바로가기</button>
               </div>
               <div>
                  <button class="btn btn-success" style="font-size: x-large;"onclick="formsubmit('PayPage')">결제 바로가기</button>
               </div>
            </div>
            
         </div>
      </div>
		<div>
			<div class="replyArea">
				<div class="row my-3 scroll"
					style="width: 100%; margin-left: 5px; padding: 0px; display: inline-block; height: auto; max-height: 450px;">
					<c:forEach items="${reviewList}" var="re">
						<div class="meminfo">
							<span>작성자: ${re.REWRITER} </span>
							<div style="margin-top: 5px; margin-bottom: 5px;">
								<textarea rows="" cols="" class="rvcomm scroll"
									disabled="disabled">${re.RECONTENT}</textarea>
							</div>
							<c:if test="${sessionScope.loginId == re.REWRITER}">
								<button type="button"
									onclick="location.href='/albumDeleteReview?recode=${re.RECODE}&altitle=${ALInfo.altitle}'"
									class="btn btn-danger"
									style="font-size: 10px; margin-bottom: 4px; width: 70px; height: 30px; float: right;">댓글
									삭제</button>
							</c:if>
							<div class="small text-muted">작성시간: ${re.REDATE}</div>
						</div>
						<hr>
					</c:forEach>
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
   <script src="/resources/js/scripts.js"></script>
   <script type="text/javascript">
      function is_checked(radio) {

         let radioEls = document.querySelectorAll('input[type="radio"]');
         for(let radioEl of radioEls){
            
            if(radioEl.checked){
               radioEl.nextElementSibling.classList.remove('disNone');
            } else {
               radioEl.nextElementSibling.classList.add('disNone');
            }
            
            
         }
      }
      function formsubmit(url){ //   /장바구니, /결제
        console.log(url);
        
        //let Qty = document.getElementById('').value;
        let checkEl = document.querySelector('input[type="radio"]:checked');
        console.log(checkEl.value);
        console.log(checkEl.nextElementSibling.value);
        if(url == "InsertCartPage"){
      	  location.href= "/"+url+"?caalcode="+checkEl.value+'&caqty='+ checkEl.nextElementSibling.value;
        	
        }else if (url == "PayPage"){
          location.href= "/"+url+"?selAl="+checkEl.value+'_1';
        }
          
          
   
      }
   </script>
</body>
</html>
