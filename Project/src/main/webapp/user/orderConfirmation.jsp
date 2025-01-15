<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 확인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>
	<c:set var="list" value="${cartList }"></c:set>
    <div class="container my-5">
        <!-- 상품 확인 -->
        <div class="row">
            <div class="col-md-8">
                <h3>주문 상품</h3>
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
                        <c:forEach var="product" items="${cartList}">
                            <tr>
                                <td>${product.getTitle()}</td>
                                <td>${product.getPrice()}원</td>
                                <td>${product.getQuantity()}개</td>
                                <td>${product.getQuantity() * product.getPrice()}원</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3" class="text-end"><b>총액:</b></td>
                            <td><b>${totalAmount}원</b></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 배송 정보 -->
            <div class="col-md-4">
		    <h3>배송 정보</h3>
		    <form action="<%= request.getContextPath() %>/user_orderComplete.go" method="post">
		        <div class="mb-3">
		            <label for="name" class="form-label">성명</label>
		            <input type="text" class="form-control" id="name" name="name" value="${user_name}" readonly>
		        </div>
		       
		        <div class="mb-3">
		            <label for="roadAddress" class="form-label">도로명 주소</label>
		            <input type="text" class="form-control" id="roadAddress" name="roadAddress" required>
		        </div>
		        <div class="mb-3">
		            <label for="detailAddress" class="form-label">세부 주소</label>
		            <input type="text" class="form-control" id="detailAddress" name="detailAddress" required>
		        </div>


                    <!-- 예치금 결제 -->
                    <h3>예치금 결제</h3>
                    <div class="mb-3">
                        <label for="money" class="form-label">현재 예치금</label>
                        <input type="text" class="form-control" id="money" name="money" value="${user.money}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="payAmount" class="form-label">결제 금액</label>
                        <input type="number" class="form-control" id="payAmount" name="payAmount" value="${totalAmount}" readonly>
                    </div>

                    <c:if test="${user.money < totalAmount}">
                        <div class="alert alert-danger">
                            예치금이 부족합니다. 예치금을 충전해주세요.
                        </div>
                    </c:if>

                    <button type="submit" class="btn btn-success btn-lg w-100" ${user.money < totalAmount ? 'disabled' : ''}>주문 완료</button>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>