<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영수증</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container my-5">
    <h2 class="text-center mb-4">영수증</h2>
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">주문 요약</h4>
        </div>
        <div class="card-body">
            <!-- User Info -->
            <h5>사용자 정보</h5>
            <p><strong>이름:</strong> ${user.user_name}</p>
            <p><strong>이메일:</strong> ${user.email}</p>
            <hr>

            <!-- Order Info -->
            <h5>상품 정보</h5>
            <table class="table">
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${cartList}">
                            <tr>
                                <td>${product.getTitle()}</td>
                                <td>${product.getPrice()}원</td>
                                <td>${product.getQuantity()}개</td>
                                <td>${product.getQuantity() * product.getPrice()}원</td>
                            </tr>
                        </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3" class="text-end">총액:</th>
                        <th>${totalAmount}</th>
                    </tr>
                </tfoot>
            </table>
            <hr>

            <!-- Payment Info -->
            <h5>결제 정보</h5>
            <p><strong>사용된 예치금:</strong> ${totalAmount}</p>
            <p><strong>잔여 예치금:</strong> ${user.money - totalAmount}</p>
            <hr>

            <!-- Delivery Info -->
           
           <h5>배송 정보</h5>
			<p><strong>성명:</strong> ${user.user_name}</p> <!-- 사용자 이름 -->
			<p><strong>주소:</strong> ${delivery.address1} ${delivery.address2}</p> <!-- 도로명 주소 + 세부 주소 -->
			<p><strong>주문일:</strong> ${delivery.deliveryStart}</p> 
			
			<hr>
			  <!-- 홈으로 가는 버튼 (사용자가 로그인한 경우에만 표시) -->
            <c:if test="${not empty user}">
                <a href="MainPage.jsp" class="btn btn-primary">홈으로 가기</a>
            </c:if>
			
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




