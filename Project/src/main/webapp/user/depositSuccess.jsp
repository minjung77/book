<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>충전 완료</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container my-5">
        <h2 class="text-center mb-4">예치금 충전 완료</h2>
      <div class="alert alert-success">
		    예치금이 성공적으로 충전되었습니다. 현재 예치금: ${user.money}원
		</div>
        
   		<a href="<%=request.getContextPath() %>/user/mypage.jsp" class="btn btn-primary w-100">마이페이지로 돌아가기</a>
        
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
