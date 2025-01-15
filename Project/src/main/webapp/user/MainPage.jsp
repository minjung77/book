<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- <link rel="stylesheet" href="css/styles.css"> -->
        
        <title>책 판매 메인 페이지</title>	
        <!-- Bootstrap icons-->
       <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"> -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <!-- <link href="resources/css/styles.css" rel="stylesheet" /> -->
        <%@ include file="../user/navbar.jsp" %>
    </head>
    <body>
       
<!-- Hero Start -->
<div class="container-fluid hero-header" style="background-image: url('<%=request.getContextPath()%>/resource/img/bookstore.jpg'); background-size: cover; background-position: center; py-5 mb-5">
    <div class="container py-5">
        <div class="row justify-content-start">
            <div class="col-lg-8 text-center text-lg-start">
                <h1 class="display-1 text-uppercase text-white mb-lg-4">BOOK SHOP</h1>
                <h1 class="text-uppercase text-white mb-lg-4">WELCOME! MY BOOK MARKET</h1>
                <p class="fs-4 text-white mb-lg-4">관심있고 재미있는 책을 찾아보세요!</p>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->



       
    <!-- 소개 섹션 시작 -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded" src="../resource/img/about.jpg" style="object-fit: cover;" alt="책 소개 이미지">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="border-start border-5 border-primary ps-5 mb-5">
                        <h6 class="text-primary text-uppercase">소개</h6>
                        <h1 class="display-5 text-uppercase mb-0">책으로 세상을 연결합니다</h1>
                    </div>
                    <h4 class="text-body mb-4">다양한 독자를 위한 다양한 책을 만나보세요. 소설, 비소설, 학술 서적 등 모든 종류의 책을 제공합니다!</h4>
                    <div class="bg-light p-4">
                        <ul class="nav nav-pills justify-content-between mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item w-50" role="presentation">
                                <button class="nav-link text-uppercase w-100 active" id="pills-1-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-1" type="button" role="tab" aria-controls="pills-1"
                                    aria-selected="true">우리의 미션</button>
                            </li>
                            <li class="nav-item w-50" role="presentation">
                                <button class="nav-link text-uppercase w-100" id="pills-2-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-2" type="button" role="tab" aria-controls="pills-2" 
                                    aria-selected="false">우리의 비전</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">
                                <p class="mb-0">모든 순간에 완벽한 책을 독자에게 연결하는 것이 우리의 목표입니다. 책과 함께 탐험하고, 배우며, 상상의 세계로 빠져보세요.</p>
                            </div>
                            <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
                                <p class="mb-0">우리는 독서를 통해 영감을 받고, 지식을 얻으며, 변화를 만들어가는 독자의 글로벌 커뮤니티를 꿈꿉니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 소개 섹션 끝 -->
        
        
        
        
        
    <!-- 책 목록 섹션 시작 -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="border-start border-5 border-primary ps-5 mb-5" style="max-width: 600px;">
                <h6 class="text-primary text-uppercase">책 목록</h6>
                <h1 class="display-5 text-uppercase mb-0">모든 독자를 위한 책</h1>
            </div>

            <div class="row">
                <div class="col-md-3 mb-5">
                    <div class="product-item position-relative bg-light d-flex flex-column text-center">
                        <img class="img-fluid mb-4" src="../resource/img/product-1.png" alt="소설">
                        <h6 class="text-uppercase">소설</h6>
                        <h5 class="text-primary mb-0">₩19,900</h5>
                        <div class="btn-action d-flex justify-content-center">
			    <a class="btn btn-primary py-2 px-3" href="detail.jsp"><i class="bi bi-cart"></i></a>
			    <a class="btn btn-primary py-2 px-3" href=""><i class="bi bi-eye"></i></a>
			</div>
                    </div>
                </div>
                
                
                <div class="col-md-3 mb-5">
                    <div class="product-item position-relative bg-light d-flex flex-column text-center">
                       <img class="img-fluid mb-4" src="../resource/img/product-2.png" alt="비소설">
                        <h6 class="text-uppercase">비소설</h6>
                        <h5 class="text-primary mb-0">₩24,900</h5>
                        <div class="btn-action d-flex justify-content-center">
                            <a class="btn btn-primary py-2 px-3" href="bookDetail.go?id=2"><i class="bi bi-cart"></i></a>
                            <a class="btn btn-primary py-2 px-3" href=""><i class="bi bi-eye"></i></a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-3 mb-5">
                    <div class="product-item position-relative bg-light d-flex flex-column text-center">
                        <img class="img-fluid mb-4" src="../resource/img/product-3.png" alt="어린이 책">
                        <h6 class="text-uppercase">어린이 책</h6>
                        <h5 class="text-primary mb-0">₩14,900</h5>
                        <div class="btn-action d-flex justify-content-center">
                            <a class="btn btn-primary py-2 px-3" href="detail.jsp"><i class="bi bi-cart"></i></a>
                            <a class="btn btn-primary py-2 px-3" href=""><i class="bi bi-eye"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-5">
                    <div class="product-item position-relative bg-light d-flex flex-column text-center">
                        <img class="img-fluid mb-4" src="../resource/img/product-4.png" alt="학술 서적">
                        <h6 class="text-uppercase">학술 서적</h6>
                        <h5 class="text-primary mb-0">₩29,900</h5>
                        <div class="btn-action d-flex justify-content-center">
                            <a class="btn btn-primary py-2 px-3" href="detail.jsp"><i class="bi bi-cart"></i></a>
                            <a class="btn btn-primary py-2 px-3" href=""><i class="bi bi-eye"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
    <!-- 책 목록 섹션 끝 -->
    
    <!-- Footer-->
  <%@ include file="../user/footer.jsp" %>
    
    <!-- Bootstrap core JS-->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
