<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 결제 창</title>
<style type="text/css">
h2{
	text-align: center;
}
table {
	margin: 0 auto;
}
table th, table td{
	width: 150px;
	text-align: center;
}
img{
	width: 100px;
	height: 120px;
}
table input[type=checkbox]{
	transform: scale(2);
}
</style>
</head>
<body>

	<jsp:include page="include/admin_header.jsp"></jsp:include>

	<div>
		<h2>주문 상품</h2>
		<table>
			<tr>
				<th>이미지</th>
				<th>제목</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<tr>
				<td>
					<img alt="책 이미지" src="<%=request.getContextPath() %>/book_img/해리포터.jpeg">
				</td>
				<td>제목</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>
					<img alt="책 이미지" src="<%=request.getContextPath() %>/book_img/해리포터.jpeg">
				</td>
				<td>제목</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>
					<img alt="책 이미지" src="<%=request.getContextPath() %>/book_img/해리포터.jpeg">
				</td>
				<td>제목</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
		</table>
		
		<!-- <div class="justify-content-center" style="border:1px solid red; display: flex; justify-content: center; align-items: center;"> -->
		<div class="row">
		    <div class="col-6">
		        <h2>결제 정보</h2>
		        <table class="table table-hover">
		            <tr>
		                <th>상품 금액</th>
		                <td>10000</td>
		            </tr>
		            <tr>
		                <th>할인 금액</th>
		                <td>0</td>
		            </tr>
		            <tr>
		                <th>적립 예정 포인트</th>
		                <td>100</td>
		            </tr>
		            <tr>
		                <th>총 결제 금액</th>
		                <td>10000</td>
		            </tr>
		        </table>
		    </div>
		    <div class="col-6" style="text-align: center;">
		        <h2>현재 ㅇㅇ 님의 예치금</h2>
		        <input type="text" value="10000">
		    </div>
		</div>

		<!-- <div class="justify-content-center" style="border:1px solid red; display: flex; justify-content: center; align-items: center;"> -->
		<div class="row">
		
			<div class="col-6">
				<h2>배송지 정보</h2>
				<table class="table table-hover">
				    <tr>
				        <th>홍길동</th>
				    </tr>
				    <tr>
				        <th>010-1111-2222</th>
				    </tr>
				    <tr>
				        <th>서울특별시 마포구 신촌로</th>
				    </tr>
				    <tr>
				        <td>
				            <input type="button" class="btn " value="배송지 변경" style="width: 100%; padding: 10px;">
				        </td>
				    </tr>
				</table>
			</div>
			
			<div class="col-6">
				<h2>주문자 정보</h2>
				<table class="table table-hover">
					<tr>
						<th>주문 번호</th>
						<td>00001</td>
					</tr>
					<tr>
						<th>주문일</th>
						<td>2025-01-08</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>홍길동</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td>010-1111-2222</td>
					</tr>
				</table>
			</div>
		</div>
			
		
		<div style="text-align: center;">
			<button type="button" class="btn btn-outline-warning btn-lg" onclick="index.go">쇼핑 계속하기</button>
		</div>
	</div>
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>
</html>