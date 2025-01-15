<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp"%>

    <div class="container mt-5">
        <h2>회원 정보 수정</h2>

        <!-- 사용자 정보 수정 폼 -->
        <form action="<%=request.getContextPath() %>/user_updateUser.go" method="post">
        	<input type="hidden" name="user_id" value="${sessionScope.user.getUser_id() }">
            <div class="mb-3">
                <label for="memberName" class="form-label">이름${sessionScope.user.getUser_id() }</label>
                <input type="text" class="form-control" id="memberName" name="memberName" value="${user.user_name}" required>
            </div>
            <div class="mb-3">
                <label for="memberEmail" class="form-label">이메일</label>
                <input type="email" class="form-control" id="memberEmail" name="memberEmail" value="${user.email}" required>
            </div>
            <div class="mb-3">
                <label for="memberPhone" class="form-label">전화번호</label>
                <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${user.phone}" required>
            </div>
            <!-- 비밀번호 수정 필드 추가 -->
            <div class="mb-3">
                <label for="memberPw" class="form-label">새 비밀번호</label>
                <input type="password" class="form-control" id="memberPw" name="memberPw">
            </div>
            <button type="submit" class="btn btn-primary">정보 수정</button>
        </form>

        <a href="<%=request.getContextPath() %>/user/mypage.jsp" class="btn btn-secondary mt-2">취소</a>
    </div>

<%@ include file="footer.jsp"%>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
