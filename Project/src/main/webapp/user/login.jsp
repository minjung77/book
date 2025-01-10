<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .login-container h2 {
            text-align: center;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>로그인</h2>

    <!-- 오류 메시지 출력 -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

    <form action="<%=request.getContextPath() %>/user_login_ok.go" method="post">
        <div class="mb-3">
            <label for="user_id" class="form-label">아이디</label>
            <input type="text" id="user_id" name="user_id" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">로그인</button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/resource/js/bootstrap.bundle.min.js"></script>
</body>
</html>
