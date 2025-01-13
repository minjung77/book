<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="include/admin_header.jsp"></jsp:include>
	
	<div class="main">
		<jsp:include page="include/admin_nav.jsp"></jsp:include>
		
		<section class="user_orders">
			<h3>회원 주문 내역</h3>
			<table class="table table-hover shadow p-3 mb-5 bg-body-tertiary rounded">
				<tr>
					<th>주문 번호</th>
					<th>사용자 아이디</th>
					<th>주문 내역</th>
					<th>주문 내역</th><!-- 여러개일 경우 ~외 n개 이런식으로 표시 > 클릭 시 모달창에서 상세내역 뜨게-->
					<th>주문 상태</th>
					<th>결제 상태</th><!-- 결제/미결제/배송중/도착/반품/취소/환불완료 버튼으로 상태 변할수 있게. -->
					<th>총 금액</th>
					<th>배송 주소</th>
					<th>주문 도착일</th>
				</tr>
			</table>
		</section>
	</div>
	
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>
</html>