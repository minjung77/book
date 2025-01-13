<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 게시글 ID 가져오기
    int id = Integer.parseInt(request.getParameter("id"));

    // 게시글 목록 가져오기
    ArrayList<HashMap<String, String>> posts = (ArrayList<HashMap<String, String>>) application.getAttribute("posts");

    // 게시글 유효성 검사
    if (id < 0 || id >= posts.size()) {
        response.sendRedirect("errorPage.jsp");
        return;
    }

    // 게시글 가져오기
    HashMap<String, String> post = posts.get(id);

    // 출처 확인 (default: 일반 게시판)
    String source = request.getParameter("source");
    if (source == null) {
        source = "general";
    }

    // 목록으로 버튼의 링크 설정
    String returnLink = "index.jsp"; // 일반 게시판 기본값
    if ("admin".equals(source)) {
        returnLink = "adminBoard.jsp"; // 관리자 게시판으로 리다이렉트
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>게시글 상세 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* 부드러운 배경색 */
        }

        .container {
            margin-top: 50px;
            max-width: 800px;
            background: #ffffff; /* 흰 배경 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            border-radius: 10px; /* 둥근 모서리 */
            padding: 20px;
        }

        .content {
            white-space: pre-line; /* 줄바꿈 반영 */
        }

        .btn-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">게시글 상세 보기</h1>

        <div class="mb-3">
            <h2><%= post.get("title") %></h2>
            <p class="text-muted">작성일: <%= post.get("date") %></p>
        </div>

        <hr>

        <div class="content mb-4">
            <p><%= post.get("content").replaceAll("\n", "<br>") %></p>
        </div>

        <hr>

        <div class="btn-container text-center">
            <a href="<%= returnLink %>" class="btn btn-outline-primary">목록으로</a>
        </div>
    </div>
</body>
</html>
