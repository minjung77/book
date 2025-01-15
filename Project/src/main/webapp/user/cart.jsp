<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <!-- External Resources -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style type="text/css">
input[type=checkbox]{
	transform:scale(2.0);
	margin: 5px;
}
img{
	width: 80px;
	height: 100px;
}
</style>
</head>
<body>
  	<%@ include file="navbar.jsp" %>

	<c:set var="list" value="${cartList }"></c:set>
	
<!-- Jumbotron -->
<div class="jumbotron py-5 text-center bg-light">
    <div class="container">
    	  <h6 class="text-primary text-uppercase">Cart</h6>
        <h1 class="display-6">장바구니</h1>
    </div>
</div>

<!-- Cart Container -->
<div class="container my-5">
    <!-- Cart Actions -->
    <div class="row bg-light rounded p-3">
        <div class="col-md-6">
            <input type="checkbox" id="allChk" checked> <b>전체</b>
        </div>
        <div class="col-md-6 text-end">
            <a href="javascript:void(0)"class="btn btn-danger btn-sm" onclick="checkDeleteList()">삭제하기</a>
            <a href="<%=request.getContextPath() %>/user_order.go?user_id=${user.user_id}" class="btn btn-success btn-sm">주문하기</a>
        </div>
    </div>
    
    <!-- Cart Table -->
    <div class="table-responsive mt-4">
        <table class="table table-hover">
            <thead class="table-secondary">
                <tr>
                    <th></th>
                    <th></th>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${!empty cartList }">
	                <c:forEach var="dto" items="${list}">
	                    <tr>
	                        <td><input type="checkbox" class="chk" name="chk" value="${dto.getCart_id() }" checked data-totalprice="${dto.getQuantity() * dto.getPrice() }"></td>
	                        <th style="text-align: center;">
	                        	<img alt="책 이미지" src="../admin/${dto.getImage_url() }">
	                        </th>
	                        <td>${dto.getTitle() }</td>
	                        <td>${dto.getPrice() }</td>
	                        <td>${dto.getQuantity() }</td>
	                        <td>${dto.getQuantity() * dto.getPrice() }</td>
	                        <td>
	                            <a href="<%=request.getContextPath() %>/removeCart.go?cart=${dto.getCart_id() }" class="btn btn-outline-danger btn-sm">
	                                <i class="bi bi-backspace-fill"></i> 삭제
	                            </a>
	                        </td>
	                    </tr>
	                </c:forEach>
            	</c:if>
                <c:if test="${empty cartList}">
                    <tr>
                        <td colspan="6" class="text-center">장바구니가 비어 있습니다.</td>
                    </tr>
                </c:if>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" class="text-end"><b>총액:</b></td>
                    <td colspan="3"><span id="totalMoney">0</span>원</td>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="mt-3">
        <a href="./books.jsp" class="btn btn-secondary btn-sm"> &laquo; 쇼핑 계속하기</a>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Back to Top -->
<a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 전체 선택/해제 기능
	window.onload = () => {
		document.getElementById("allChk").addEventListener("click", function () {
		const isChecked = this.checked;
		document.querySelectorAll(".chk").forEach(chk => {
			chk.checked = isChecked;
		});
		});
	    totalMoney();
	}
  
	function totalMoney() {
	console.log('전체 계산 진입');
	let result = 0;
	let checks = document.querySelectorAll('.chk');
	
	checks.forEach(checkBox => {
		if(checkBox.checked){
			result += parseInt(checkBox.getAttribute('data-totalprice'));
		}
	});
	document.getElementById('totalMoney').textContent = result;
	};
	
	document.querySelectorAll('.chk').forEach(checkBox => {
		console.log('선택 이벤트 진입');
		checkBox.addEventListener('change', totalMoney);
	});
	
	//선택한 책 삭제
	function checkDeleteList() {
		let checkedBoxs =  document.querySelectorAll(".chk:checked");
		let selectedIds = Array.from(checkedBoxs).map(checkbox => checkbox.value).filter(value => value);
		
		/* 
		let checkboxes = document.getElementsByClassName('chk');
		Array.from(checkboxes).forEach(checkbox => {
		    console.log(checkbox.value); 
		}); 
		*/
		//length:속성,괄호를 붙이지 않음.
		if(selectedIds.length === 0){
			alert('삭제할 책을 선택해주세요.');
			return;
		}else {
			console.log(selectedIds);
			/* parameters 가 왜 안나오는거야ㅛ!!!!! */
//			let parameters = selectedIds.map(a => `id=${a}`);//id=&id=
//			alert(parameters);
//			console.log(parameters);
			let b = selectedIds.join(',');//3,4
			console.log(b);
			
			location.href='<%=request.getContextPath()%>checkDeleteCart.go?num='+b;
		}
	}
	
/* 나중에 개별 삭제 ajax로 해보기 */
</script>
</body>
</html>
