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

        /* About Section Styles */
        .quantity-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin-top: 30px;
        }

        .quantity-container .form-group {
            display: flex;
            align-items: center;
        }

        .quantity-container .form-control {
            width: 60px;
            text-align: center;
            font-size: 16px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .quantity-container .quantity-btn {
            width: 30px;
            height: 30px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 50%;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .quantity-container .quantity-btn:hover {
            background-color: #0056b3;
        }

        .quantity-container .quantity-btn:focus,
        .quantity-container .form-control:focus {
            outline: none;
            border-color: #007bff;
        }

        /* Button Container */
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn-container .btn {
            width: 200px; /* Equal width for both buttons */
            font-size: 16px;
        }

        /* About Section Styling */
        .about-container {
            display: flex;
            justify-content: space-between;
            gap: 50px;
            margin-top: 30px;
        }

        .about-container img {
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="about-container">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded" src="../resource/img/about.jpg" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="border-start border-5 border-primary ps-5 mb-5">
                        <h6 class="text-primary text-uppercase">About Us</h6>
                        <h1 class="display-5 text-uppercase mb-0">We Keep Your Pets Happy All Time</h1>
                    </div>
                    <h4 class="text-body mb-4">Diam dolor diam ipsum tempor sit. Clita erat ipsum et lorem stet no labore lorem sit clita duo justo magna dolore</h4>
                    <div class="bg-light p-4">
                        <ul class="nav nav-pills justify-content-between mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item w-50" role="presentation">
                                <button class="nav-link text-uppercase w-100 active" id="pills-1-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-1" type="button" role="tab" aria-controls="pills-1"
                                    aria-selected="true">책 소개</button>
                            </li>
                            <li class="nav-item w-50" role="presentation">
                                <button class="nav-link text-uppercase w-100" id="pills-2-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-2" type="button" role="tab" aria-controls="pills-2"
                                    aria-selected="false">저자 정보</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">
                                <p class="mb-0">Tempor erat elitr at rebum at at clita aliquyam consetetur. Diam dolor diam ipsum et, tempor voluptua sit consetetur sit. Aliquyam diam amet diam et eos sadipscing labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit. Sanctus clita duo justo et tempor consetetur takimata eirmod, dolores takimata consetetur invidunt magna dolores aliquyam dolores dolore. Amet erat amet et magna</p>
                            </div>
                            <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
                                <p class="mb-0">Tempor erat elitr at rebum at at clita aliquyam consetetur. Diam dolor diam ipsum et, tempor voluptua sit consetetur sit. Aliquyam diam amet diam et eos sadipscing labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit. Sanctus clita duo justo et tempor consetetur takimata eirmod, dolores takimata consetetur invidunt magna dolores aliquyam dolores dolore. Amet erat amet et magna</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- Quantity Selector and Action Buttons -->
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-12">
                <div class="quantity-container">
                    <button type="button" class="quantity-btn" id="decrease-btn">-</button>
                    <div class="form-group">
                        <input type="number" class="form-control" id="quantity" name="quantity" value="1" min="1" />
                    </div>
                    <button type="button" class="quantity-btn" id="increase-btn">+</button>
                </div>

                <div class="btn-container">
                    <a href="cart.jsp" class="btn btn-primary">장바구니 담기</a>
                    <a href="checkout.jsp" class="btn btn-success">바로구매</a>
                </div>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
    <!-- Add Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    <script>
        const decreaseBtn = document.getElementById('decrease-btn');
        const increaseBtn = document.getElementById('increase-btn');
        const quantityInput = document.getElementById('quantity');

        decreaseBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        });

        increaseBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        });
    </script>
</body>
</html>
