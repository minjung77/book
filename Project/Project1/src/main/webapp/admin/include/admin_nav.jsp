<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="col-2 sideBar">
		<div class="accordion accordion-flush" id="accordionFlushExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
		        책
		      </button>
		    </h2>
		    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<a href="<%=request.getContextPath()%>/book_insert.go">책 추가</a>
		      </div>
		    </div>
		    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<a href="book_modify.go">책 수정/삭제</a>
		      </div>
		    </div>
		  </div>
		  
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
		        회원 관리
		      </button>
		    </h2>
		    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<a href="<%=request.getContextPath()%>/user_modify.go">회원 수정/삭제</a>
		      </div>
		    </div>
		  </div>
		  
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
		        게시판
		      </button>
		    </h2>
		    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<a href="#">게시판</a>
		      </div>
		    </div>
		  </div>
		  
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
		        주문 조회
		      </button>
		    </h2>
		    <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">
		      	<a href="<%=request.getContextPath()%>/user_orders.go">회원 주문 조회</a>
		      </div>
		    </div>
		  </div>
		</div>
	</nav>
</body>
</html>