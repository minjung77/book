<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp"%>
    <div class="container mt-5">
        <h2>회원 탈퇴</h2>
        <p>정말로 회원 탈퇴를 진행하시겠습니까?</p>
        <form action="<%=request.getContextPath() %>/user_deleteUser.go" method="post">
            <div class="mb-3">
                <label for="confirm" class="form-label">탈퇴 확인</label>
                <input type="text" class="form-control" id="confirm" name="confirm" placeholder="탈퇴를 원하면 'yes' 입력" required>
            </div>
            <button type="submit" class="btn btn-danger">회원 탈퇴</button>
        </form>
        <a href="<%=request.getContextPath() %>/user/mypage.jsp" class="btn btn-secondary mt-2">취소</a>
    </div>
<%@ include file="footer.jsp"%>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
