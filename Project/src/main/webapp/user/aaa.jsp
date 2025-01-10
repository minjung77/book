<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 게시글 저장소 초기화
    ArrayList<HashMap<String, String>> posts = (ArrayList<HashMap<String, String>>) application.getAttribute("posts");
    if (posts == null) {
        posts = new ArrayList<>();
        application.setAttribute("posts", posts);

        // 예제 데이터 추가
        HashMap<String, String> post1 = new HashMap<>();
        post1.put("title", "공지사항 예제 1");
        post1.put("content", "공지사항 내용입니다.");
        post1.put("category", "notice");
        post1.put("date", "2025-01-01");
        posts.add(post1);

        HashMap<String, String> post2 = new HashMap<>();
        post2.put("title", "상품 문의 예제 1");
        post2.put("content", "상품 문의 내용입니다.");
        post2.put("category", "product");
        post2.put("date", "2025-01-02");
        posts.add(post2);
    }
%>
<%@ include file="../user/navbar.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            flex: 1;
            margin-top: 40px;
        }
        .table-container {
            margin-top: 20px;
        }
        .category-nav {
            margin-bottom: 20px;
        }
        .category-nav a {
            margin-right: 10px;
        }
        .new-post-btn {
            text-align: center;
            margin-top: 20px;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: relative;
            width: 100%;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center shadow p-3 mb-4 bg-white rounded">게시판</h1>

        <!-- 카테고리 네비게이션 -->
        <div class="category-nav text-center">
            <a href="?category=all" class="btn btn-outline-primary">전체보기</a>
            <a href="?category=notice" class="btn btn-outline-success">공지사항</a>
            <a href="?category=product" class="btn btn-outline-warning">상품문의</a>
                 <a href="addPost.jsp" class="btn btn-outline-info">새 글 쓰기</a>
        </div>




        <!-- 테이블 -->
        <div class="table-container">
            <table class="table table-bordered table-hover bg-white">
                <thead class="table-dark">
                    <tr>
                        <th style="width: 10%;">번호</th>
                        <th style="width: 30%;">제목</th>
                        <th style="width: 35%;">내용</th>
                        <th style="width: 15%;">작성일</th>
                        <th style="width: 10%;">보기</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // 카테고리 필터링
                        String category = request.getParameter("category") != null ? request.getParameter("category") : "all";

                        // 페이징 설정
                        int postsPerPage = 10;
                        int totalPosts = 0;

                        ArrayList<HashMap<String, String>> filteredPosts = new ArrayList<>();
                        for (HashMap<String, String> post : posts) {
                            if ("all".equals(category) || category.equals(post.get("category"))) {
                                filteredPosts.add(post);
                            }
                        }
                        totalPosts = filteredPosts.size();

                        int totalPages = (int) Math.ceil(totalPosts / (double) postsPerPage);
                        int currentPage = 1;
                        String pageParam = request.getParameter("page");
                        if (pageParam != null) {
                            currentPage = Integer.parseInt(pageParam);
                        }

                        int startIndex = (currentPage - 1) * postsPerPage;
                        int endIndex = Math.min(startIndex + postsPerPage, totalPosts);

                        for (int i = startIndex; i < endIndex; i++) {
                            HashMap<String, String> post = filteredPosts.get(i);
                    %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= post.get("title") %></td>
                        <td><%= post.get("content") %></td>
                        <td><%= post.get("date") %></td>
                        <td>
                            <a href="viewPost.jsp?id=<%= i %>" class="btn btn-sm btn-primary">보기</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

       

        <!-- 페이지네이션 -->
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <%
                    for (int i = 1; i <= totalPages; i++) {
                        if (i == currentPage) {
                %>
                    <li class="page-item active">
                        <span class="page-link"><%= i %></span>
                    </li>
                <%
                        } else {
                %>
                    <li class="page-item">
                        <a class="page-link" href="?category=<%= category %>&page=<%= i %>"><%= i %></a>
                    </li>
                <%
                        }
                    }
                %>
            </ul>
        </nav>
    </div>
    <%@ include file="../user/footer.jsp" %>
</body>
</html>
