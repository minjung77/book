<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.js"></script>

</head>
<body>
	<jsp:include page="include/admin_header.jsp"></jsp:include>
	
	<div class="main">
	<jsp:include page="include/admin_nav.jsp"></jsp:include>
	
		<section class="book_insert justify-content-center">
			<form method="post" action="<%=request.getContextPath() %>/bookInsertOk.go"  enctype="multipart/form-data">
				<h3 class="title">도서 추가</h3>
				<div class="book_insert">
					<table class="table table-hover shadow p-3 mb-5 bg-body-tertiary rounded">
						<tr>
							<th><label for="book_0">책 번호</label></th>
							<td>
								<input type="text" id="book_0" name="num" value="${bookNum }" class="form-control col-6">
							</td>
						</tr>
						<tr>
							<th><label for="book_1">책 제목</label></th>
							<td>
								<input type="text" id="book_1" name="title" value="어린왕자" class="form-control col-6">
							</td>
						</tr>
						<tr>
							<th><label for="book_2">저자</label></th>
							<td>
								<input type="text" id="book_2" name="author" value="생텍쥐페리" class="form-control col-6">
							</td>
						</tr>
						<tr>
							<th><label for="book_3">장르</label></th>
							<td>
								<select class="form-select" name="genre" aria-label="Default select example" id="book_3">
									<option value="1">추리</option>
									<option value="2">스릴러</option>
									<option value="3">공포</option>
									<option value="4">로맨스</option>
									<option value="5">판타지</option>
									<option value="6">게임</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="book_4">정가</label></th>
							<td>
								<input type="text" id="book_4" name="price" class="form-control col-6">
							</td>
						</tr>
						<tr>
							<th><label for="book_5">수량</label></th>
							<td>
								<input type="text" id="book_5" name="quantity" class="form-control col-6"
									placeholder="숫자만 가능하도록 부트스트랩 경고창 띄우게 하기">
							</td>
						</tr>
						<tr>
							<th><label for="book_6">줄거리</label></th>
							<td>
								<div class="mb-3">
									<textarea class="form-control" rows="3" id="book_6" name="description"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th><label for="book_7">이미지</label></th>
							<td>
								<input type="file" name="image_url" id="book_7">
							</td>
						</tr>
						<tr>
							<th><label for="book_8">출판사</label></th>
							<td>
								<input type="text" id="book_8" name="publisher" class="form-control col-6">
							</td>
						</tr>
						<tr>
							<th><label for="book_9">출판일</label></th>
							<td>
								<input type="text" id="book_9" name="publish_date" class="form-control col-6"
									placeholder="yyyy-MM-dd">
							</td>
						</tr>
					</table>
				</div>
			<div class="subBtn">
				<input type="submit" class="btn btn-primary" value="등록">
			</div>
		</form>
	</section>
	</div>
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>
</html>