<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>PET SHOP - Pet Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resource/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto:wght@700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/lib/flaticon/font/flaticon.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        /* Ensure navbar items are displayed horizontally */
        .navbar-nav {
            display: flex;
            justify-content: center; /* Center align items for domestic, international, and popular books */
        }

        .navbar-nav .nav-item {
            margin-left: 30px; /* Space between items */
        }

        /* Adjust the navbar to have space between the logo and the menu */
        .navbar-brand {
            margin-right: 50px; /* Add margin to separate the logo and the menu */
        }

        .navbar-nav .nav-link {
            text-transform: uppercase; /* Make text uppercase */
            font-weight: 600;
            padding: 8px 16px;
        }

        .navbar-nav .nav-link.active {
            color: #fff; /* White text */
            border-radius: 5px; /* Rounded corners for better look */
        }

        /* Navbar brand styling */
        .navbar-brand h1 {
            font-weight: bold;
        }

        .navbar-toggler-icon {
            background-color: #000;
        }

        /* Make sure the dropdown works as expected */
        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none; /* Hide dropdown by default */
        }

        .nav-item.dropdown:hover .dropdown-menu {
            display: block; /* Show dropdown on hover */
        }

        /* For the login and signup buttons to be aligned to the right */
        .navbar-nav.right-nav {
            margin-left: auto; /* Align items to the right */
        }
    </style>
</head>
<body>

 <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <a href="MainPage.jsp" class="navbar-brand ms-lg-5">
            <h1 class="m-0 text-uppercase text-dark"><i class="bi bi-shop fs-1 text-primary me-3"></i>BOOK MARKET</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse" id="navbarCollapse">
    <div class="navbar-nav ms-auto py-0">
        <!-- 메뉴 항목들: 장르 -->
        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">장르</a>
            <div class="dropdown-menu">
                <a href="fantasy.jsp" class="dropdown-item">소설</a>
                <a href="fantasy.jsp" class="dropdown-item">에세이</a>
                <a href="totalNovel.go" class="dropdown-item">역사</a>
                <a href="nonFiction.jsp" class="dropdown-item">자연과학</a>
            </div>
        </div>

        <!-- 게시판-->
      <a href="board.jsp" class="nav-item nav-link">게시판</a>
    </div>
</div>

            <!-- 로그인, 회원가입, 마이페이지 항목을 오른쪽에 배치 -->
            <div class="navbar-nav right-nav">
                <!-- 로그인 상태에 따라 로그인/회원명 표시 -->
                <% String userName = (String) session.getAttribute("userName"); %>
                <% if (userName != null) { %>
                    <span class="nav-item nav-link text-uppercase fw-bold px-3">안녕하세요, <%= userName %>님</span>
                    <a href="logout.jsp" class="nav-item nav-link">로그아웃</a>
                <% } else { %>
                    <a href="login.jsp" class="nav-item nav-link text-uppercase fw-bold px-3">로그인</a>
                    <a href="joinForm.jsp" class="nav-item nav-link">회원가입</a>
                <% } %>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="mypage.jsp" class="dropdown-item">회원정보</a>
                        <a href="cartList.go" class="dropdown-item">장바구니</a>
                    </div>
                </div>
                <a href="<%= request.getContextPath() %>/user/orderConfirmation.jsp" class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">주문하기 <i class="bi bi-arrow-right"></i></a>
             
            </div>
        </div>
    </nav>
 <!-- Navbar End -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
