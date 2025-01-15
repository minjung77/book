<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예치금 충전</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container my-5">
        <h2 class="text-center mb-4">예치금 충전</h2>

        <form method="POST" action="${pageContext.request.contextPath}/user_deposit.go">
            <!-- 현재 예치금 표시 (읽기 전용) -->
            <div class="mb-3">
                <label for="money" class="form-label">현재 예치금</label>
                <input type="text" class="form-control" id="money" name="money" value="${user.money}" readonly>
            </div>

            <!-- 충전할 금액 입력 필드 -->
            <div class="mb-3">
                <label for="depositAmount" class="form-label">충전할 금액</label>
                <input type="number" class="form-control" id="depositAmount" name="depositAmount" min="1" required>
            </div>

            <button type="submit" class="btn btn-success w-100">충전하기</button>
        </form>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
