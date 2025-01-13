<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
  <%@ include file="navbar.jsp" %>

<!-- Jumbotron -->
<div class="jumbotron py-5 text-center bg-light">
    <div class="container">
    	<h6 class="text-primary text-uppercase text-center">mypage</h6>
        <h2 class="display-6">주문 정보</h2>
    </div>
</div>

<!-- Order Summary -->
<div class="container my-5">
    <div class="row">
        <div class="col-md-8">
            <h3>주문 내역</h3>
            <table class="table table-hover">
                <thead class="table-secondary">
                    <tr>
                        <th>상품</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${selectedItems}">
                        <tr>
                            <td>${product.bookName}</td>
                            <td>${product.unitPrice}</td>
                            <td>${product.quantity}</td>
                            <td>${product.unitPrice * product.quantity}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3" class="text-end"><b>총액:</b></td>
                        <td><b>${totalAmount}</b></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Delivery Info -->
        <div class="col-md-4">
            <h3>배송 정보</h3>
            <form method="POST" action="processOrder.jsp">
                <div class="mb-3">
                    <label for="name" class="form-label">성명</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">배송 주소</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="mb-3">
                    <label for="zipcode" class="form-label">우편번호</label>
                    <input type="text" class="form-control" id="zipcode" name="zipcode" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">전화번호</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>

                <!-- 예치금 결제 -->
                <h3>예치금 결제</h3>
                <div class="mb-3">
                    <label for="balance" class="form-label">현재 예치금</label>
                    <input type="text" class="form-control" id="balance" name="balance" value="${user.balance}" readonly>
                </div>
                <div class="mb-3">
                    <label for="payAmount" class="form-label">결제 금액</label>
                    <input type="number" class="form-control" id="payAmount" name="payAmount" value="${totalAmount}" readonly>
                </div>

                <c:if test="${user.balance < totalAmount}">
                    <div class="alert alert-danger">
                        예치금이 부족합니다. 예치금을 충전해주세요.
                    </div>
                </c:if>

                <button type="submit" class="btn btn-success btn-lg w-100" ${user.balance < totalAmount ? 'disabled' : ''}>주문 완료</button>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Back to Top -->
<a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
