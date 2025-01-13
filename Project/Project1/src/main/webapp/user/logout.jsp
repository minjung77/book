<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
<%
    // 세션 가져오기 (JSP에서 session 객체는 기본적으로 제공됨)
    if (session != null) {
        session.invalidate();  // 세션 무효화 (모든 세션 속성 삭제)
    }

    // 로그아웃 후 메인 페이지로 리다이렉트
    response.sendRedirect("MainPage.jsp");  // 메인 페이지로 리다이렉트
%>
</body>
</html>
