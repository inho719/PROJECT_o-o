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
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="/WEB-INF/views/Includes/Menu.jsp"%>
	<!-- Page content-->
	<div class="container">
		<div class="newTitle card col-md-12 mb-2">
		</div>
			<input type="checkbox" id="cbx_chkAll" />모두선택
	<form action="DeleteCartList" method="post">
		<c:forEach items="${CartList}" var="CartList" varStatus="loop">
			<div class="card m-2" id="CartList${loop.index}" data-caqty="${CartList.CAQTY}" data-alsaleprice="${CartList.ALSALEPRICE}">
				<div class="row">
					<div class="col-md-1 m-1">
						<input type="checkbox" onclick="CheckCartList()" name="CartCheck" id="cartCheck${loop.index}" onchange="updateTotalPrice()" value="${CartList.CACODE}">
					</div>
					<div class="col-md-10 m-2">
						<table>
							<tr>
								<td rowspan="2" style="width: 10%"><img alt="앨범포스터" src="${CartList.ALIMG}" style="width: 100%;" class="card-img-top"></td>
								<td>${CartList.ALTITLE }</td>
								<td>${CartList.ALPRICE }</td>
								<td rowspan="2">${CartList.CAQTY}</td>
							</tr>
							<tr>
								<td><c:if test="${CartList.ALSITE == 'Y'}">
							예스24
							</c:if> <c:if test="${CartList.ALSITE == 'K'}">
							교보문고
							</c:if> <c:if test="${CartList.ALSITE == 'A'}">
							알라딘
							</c:if> <c:if test="${CartList.ALSITE == 'I'}">
							인터파크
							</c:if></td>
								<td>${CartList.ALSALEPRICE}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>

		<div class="card m-2">
			<div class="row" style="justify-content: center; align-items: center;">
				<div class="card col-md-4 m-2" id="CheckNum"></div>
				<div class="card col-md-4 m-2" id="AllPrice"></div>
				<div class="card col-md-2 m-2">
					<button >선택 항목 삭제</button>
				</div>
				<div class="card col-md-2 m-2">
					<button>결제</button>
				</div>
			</div>
		</div>
	</form>
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
	function CheckCartList()  {
		  // 선택된 목록 가져오기
		  const CartList = 'input[name="CartCheck"]:checked';
		  const selectedElements = 
		      document.querySelectorAll(CartList);
		  
		  // 선택된 목록의 갯수 세기
		  const selectedElementsCnt =
		        selectedElements.length;
		  
		  // 출력
		  document.getElementById('CheckNum').innerText
		    = ('선택한 앨범 : '+selectedElementsCnt+'개');
		  
		}
	</script>
	<script type="text/javascript">
function updateTotalPrice() {
  // 모든 체크박스 가져오기
  const checkboxes = document.querySelectorAll('input[name="CartCheck"]');

  let totalPrice = 0;

  checkboxes.forEach(checkbox => {
    if (checkbox.checked) {
      // 체크박스 ID에서 인덱스 추출
      console.log(checkbox.id);
      let index = checkbox.id.replace('cartCheck', '');
	  console.log("index : " + index)
      // 관련 CartList 요소 가져오기
      let cartList = document.getElementById('CartList' + index);
	  console.log("cartList : " + cartList);
      if (cartList) {
        const caQty = parseInt(cartList.getAttribute('data-caqty'));
        const alSalePrice = parseFloat(cartList.getAttribute('data-alsaleprice'));
        totalPrice += caQty * alSalePrice;
        console.log("totalPrice: " + totalPrice)
      }
    }
  });

  // 합계 금액 표시
  document.getElementById('AllPrice').textContent = '총 금액 : ' + totalPrice+'원';
}
</script>
<script type="text/javascript">
function toggleAllCheckboxes() {
    var cbx_chkAll = document.getElementById('cbx_chkAll');
    var CartCheckboxes = document.getElementsByName('CartCheck');

    for (var i = 0; i < CartCheckboxes.length; i++) {
        CartCheckboxes[i].checked = cbx_chkAll.checked;
    }
}

function checkIfAllChecked() {
    var cbx_chkAll = document.getElementById('cbx_chkAll');
    var CartCheckboxes = document.getElementsByName('CartCheck');
    var allChecked = true;

    for (var i = 0; i < CartCheckboxes.length; i++) {
        if (!CartCheckboxes[i].checked) {
            allChecked = false;
            break;
        }
    }

    cbx_chkAll.checked = allChecked;
}
</script>


</body>
</html>
