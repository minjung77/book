<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>새 글 작성</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.js"></script>
    <style>
        body {
            background-color: #f8f9fa; /* 연한 회색 배경 */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            width: 100%;
            max-width: 500px;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }

        .form-container .btn-primary {
            width: 100px;
        }

        .form-container .btn-secondary {
            width: 100px;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <%@ include file="../user/navbar.jsp" %>

    <!-- 메인 컨텐츠 -->
    <div class="container">
        <div class="form-container">
            <h1>새 글 작성</h1>
            <form method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="8" placeholder="내용을 입력하세요" required></textarea>
                </div>
                <div class="d-flex justify-content-between mt-3">
                    <button type="submit" class="btn btn-primary">저장</button>
                    <a href="board.jsp" class="btn btn-secondary">취소</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="../user/footer.jsp" %>
</body>
</html>
