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
                <a href="novel.jsp" class="dropdown-item">소설</a>
                <a href="nonFiction.jsp" class="dropdown-item">비소설</a>
                <a href="fantasy.jsp" class="dropdown-item">판타지</a>
            </div>
        </div>

        <!-- 게시판-->
      <a href="board.jsp" class="nav-item nav-link">게시판</a>
    </div>
</div>

            <!-- 로그인, 회원가입, 마이페이지 항목을 오른쪽에 배치 -->
            <div class="navbar-nav right-nav">
                <!-- 로그인 버튼을 a 태그로 변경하고 클래스 추가 -->
                <a href="#" class="nav-item nav-link text-uppercase fw-bold px-3" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
                <a href="joinForm.jsp" class="nav-item nav-link">회원가입</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu m-0">
                        <a href="mypage.jsp" class="dropdown-item">회원정보</a>
                        <a href="cart.jsp" class="dropdown-item">장바구니</a>
                       
                     
                    </div>
                </div>
                <a href="orderConfirmation.jsp" class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">주문하기 <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
    </nav>
 <!-- Navbar End -->

 <!-- 로그인 모달 시작 -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="was-validated">
                    <div class="mb-3">
                        <label for="memberId" class="form-label">아이디</label>
                        <input type="text" class="form-control form-control-sm" id="memberId" placeholder="아이디를 입력하세요" required>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                    </div>
                    <div class="mb-3">
                        <label for="memberPw" class="form-label">비밀번호</label>
                        <input type="password" class="form-control form-control-sm" id="memberPw" placeholder="비밀번호를 입력하세요" required>
                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm w-100">로그인</button>
                </form>
                <div class="text-center mt-3">
                    <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#resetPasswordModal">비밀번호를 잊으셨나요?</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 로그인 모달 끝 -->

<!-- 비밀번호 재설정 모달 시작 -->
<div class="modal fade" id="resetPasswordModal" tabindex="-1" aria-labelledby="resetPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resetPasswordModalLabel">비밀번호 재설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="resetPasswordForm" class="was-validated">
                    <div class="mb-3">
                        <label for="email" class="form-label">등록된 이메일</label>
                        <input type="email" class="form-control form-control-sm" id="email" placeholder="이메일을 입력하세요" required>
                        <div class="invalid-feedback">이메일을 입력해주세요.</div>
                    </div>
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">새 비밀번호</label>
                        <input type="password" class="form-control form-control-sm" id="newPassword" placeholder="새 비밀번호를 입력하세요" required>
                        <div class="invalid-feedback">새 비밀번호를 입력해주세요.</div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm w-100">비밀번호 재설정</button>
                </form>
                <div class="text-center mt-3" id="resetMessage" style="display: none;">
                    <p id="messageText"></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 비밀번호 재설정 모달 끝 -->

<script>
    // 비밀번호 재설정 처리
    document.getElementById('resetPasswordForm').addEventListener('submit', function(event) {
        event.preventDefault();
        
        var email = document.getElementById('email').value;
        var newPassword = document.getElementById('newPassword').value;
        
        // 서버와 이메일을 비교하는 로직을 추가해야 합니다.
        // 여기서는 이메일이 "example@example.com"일 때 비밀번호를 재설정 가능하도록 예시를 듬
        var storedEmail = "example@example.com"; // 실제로는 서버에서 가져와야 합니다.

        if (email === storedEmail) {
            // 이메일이 일치하면 비밀번호를 변경하는 로직
            // 예: 서버에 비밀번호 변경 요청을 보낸다.

            document.getElementById('resetPasswordForm').reset(); // 입력 폼 초기화
            document.getElementById('resetMessage').style.display = 'block';
            document.getElementById('messageText').innerText = '비밀번호가 성공적으로 변경되었습니다.';
        } else {
            document.getElementById('resetMessage').style.display = 'block';
            document.getElementById('messageText').innerText = '등록된 이메일이 아닙니다.';
        }
    });
</script>
<!-- 로그인 모달 끝 -->

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
