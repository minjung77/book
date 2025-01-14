<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>
<%@ include file="navbar.jsp" %>
<c:set var="list" value="${bookList }"></c:set>
<!-- Blog Start -->
    <div class="container py-5">
        <div class="row g-5">
            <!-- Blog list Start -->
            <div class="col-lg-8">

			<c:if test="${empty bookList }">
				<div><h3>책 목록이 없습니다.</h3></div>
			</c:if>      
			
			
			<c:if test="${!empty bookList }">
				<c:forEach items="${list }" var="dto">
	                <div class="blog-item mb-5">
	                    <div class="row g-0 bg-light overflow-hidden">
	                        <div class="col-12 col-sm-5 h-100">
	                            <img class="img-fluid h-100" src="../admin${dto.getImage_url() }" style="object-fit: cover;">
	                        </div>
	                        <div class="col-12 col-sm-7 h-100 d-flex flex-column justify-content-center">
	                            <div class="p-4">
	                                <div class="d-flex mb-3">
	                                    <small class="me-3"><i class="bi bi-bookmark-heart" style="margin-right: 10px;"></i>좋아요</small>
	                                    <small><i>출판사 :</i> &nbsp; ${dto.getPublisher() }</small>
	                                </div>
	                                <h5 class="text-uppercase mb-3">${dto.getTitle() }</h5>
	                                <p>${dto.getDescription() }</p>
	                                <a class="text-primary text-uppercase" href="bookDetail.go?id=${dto.getBook_id() }">더보기<i class="bi bi-chevron-right"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
                
			</c:if>            	
                
                <div class="col-12">
                    <nav aria-label="Page navigation">
                      <ul class="pagination pagination-lg m-0">
                        <li class="page-item disabled">
                          <a class="page-link rounded-0" href="#" aria-label="Previous">
                            <span aria-hidden="true"><i class="bi bi-arrow-left"></i></span>
                          </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link rounded-0" href="#" aria-label="Next">
                            <span aria-hidden="true"><i class="bi bi-arrow-right"></i></span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                </div>
            </div>
            <!-- Blog list End -->

            <!-- Sidebar Start -->
            <div class="col-lg-4">
                <!-- Search Form Start -->
                <div class="mb-5">
                    <div class="input-group">
                        <input type="text" class="form-control p-3" placeholder="Keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
                <!-- Search Form End -->
            </div>
            <!-- Sidebar End -->
        </div>
    </div>
<!-- Blog End -->
<%@ include file="footer.jsp" %>
</body>
</html>
