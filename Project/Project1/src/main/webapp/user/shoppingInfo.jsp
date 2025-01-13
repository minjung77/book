<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 정보</title>

    <!-- External Resources -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom Stylesheet -->
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .jumbotron {
            background-color: #f8f9fa;
            padding: 50px 0;
        }
        .container {
            max-width: 800px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-container {
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>
     <%@ include file="navbar.jsp" %>

    <!-- Jumbotron -->
    <div class="jumbotron text-center">
        <div class="container">
            <h6 class="text-primary text-uppercase">Order</h6>
            <h1 class="display-5">배송 정보</h1>
        </div>
    </div>

    <!-- Form Container -->
    <div class="container my-5">
        <form action="./processShippingInfo.jsp" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>" />

            <!-- Name -->
            <div class="mb-3">
                <label for="name" class="form-label">성명</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <div class="invalid-feedback">이름을 입력해주세요.</div>
            </div>

            <!-- Shipping Date -->
            <div class="mb-3">
                <label for="shippingDate" class="form-label">배송일</label>
                <input type="date" class="form-control" id="shippingDate" name="shippingDate" required>
                <div class="invalid-feedback">배송일을 선택해주세요.</div>
            </div>

            <!-- Country -->
            <div class="mb-3">
                <label for="country" class="form-label">국가</label>
                <input type="text" class="form-control" id="country" name="country" required>
                <div class="invalid-feedback">국가를 입력해주세요.</div>
            </div>

            <!-- Zip Code -->
            <div class="mb-3">
                <label for="zipCode" class="form-label">우편번호</label>
                <input type="text" class="form-control" id="zipCode" name="zipCode" pattern="\d{5}" required>
                <div class="invalid-feedback">올바른 우편번호를 입력해주세요. (5자리 숫자)</div>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label for="addressName" class="form-label">주소</label>
                <input type="text" class="form-control" id="addressName" name="addressName" required>
                <div class="invalid-feedback">주소를 입력해주세요.</div>
            </div>

            <!-- Buttons -->
            <div class="btn-container">
                <a href="./cart.jsp?cartId=<%= request.getParameter("cartId") %>" class="btn btn-secondary">이전</a>
                <button type="submit" class="btn btn-primary">등록</button>
                <a href="./checkOutCancelled.jsp" class="btn btn-danger">취소</a>
            </div>
        </form>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Bootstrap Form Validation
        (function () {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');

            Array.from(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
