<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="list" value="${bookList }"/>
	<jsp:include page="include/admin_header.jsp"></jsp:include>
	
	<div class="main">
	<jsp:include page="include/admin_nav.jsp"></jsp:include>
		
		
		<section class="bookModify">
			<h3 class="title">책 수정 및 삭제</h3>
			<table class="table table-hover shadow p-3 mb-5 bg-body-tertiary rounded">
				<tr>
					<th>책 번호</th>
					<th>이미지</th>
					<th>제목</th>
					<th>저자</th>
					<th>장르</th>
					<th>정가</th>
					<th>줄거리</th>
					<th>등록일</th>
					<th>수량</th>
					<th>수정/삭제</th>
				</tr>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="10"> 현재 등록된 책이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getBook_id() }</td>
							<td>
								<img alt="책 이미지" src="${dto.getImage_url() }">
							</td>
							<td>${dto.getTitle() }</td>
							<td>${dto.getAuthor() }</td>
							<td>${dto.getGenre_id() }</td>
							<td>${dto.getPrice() }</td>
							<td>${dto.getDescription() }</td>
							<td>${dto.getInsertdate() }</td>
							<td>${dto.getQuantity() }</td>
							<td>
								<!-- modal 창 -->
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#updateUser">
					            		수정
									</button>
									<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#removeUser" data-id="${dto.getBook_id()}" id="deleteBtn">
					            		삭제
									</button>
					        	</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			
			
				<!-- updateUser Modal -->
				<div class="modal fade" id="updateUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">책 정보 수정 페이지</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form method="post" action="<%=request.getContextPath()%>/tbl_write_ok.go">
				        	<div class="form-group row">
				        		<label for="a1" class="col-sm-4 text-sm-right">제목</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a1" class="form-control" name="title">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a2" class="col-sm-4 text-sm-right">이미지</label>
				        		<div class="col-sm-8">
				        			<input type="file" id="a2" class="form-control" name="file">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a3" class="col-sm-4 text-sm-right">저자</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a3" class="form-control" name="author">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a4" class="col-sm-4 text-sm-right">장르</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a4" class="form-control" name="gerne">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a5" class="col-sm-4 text-sm-right">정가</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a5" class="form-control" name="price">
				        		</div>
				        	</div>
				        	
			
				        	
							<div class="form-group row">
							    <label for="a6" class="col-sm-4 text-sm-right">줄거리</label>
							    <!-- input-group의 부모 div에 col-sm-8 적용 -->
							    <div class="col-sm-8">
							        <textarea rows="7" cols="30" name="cont">줄거리</textarea>
							    </div>
							</div>
								        	
			
				        	
			        		<div class="form-group row">
				        		<label for="a7" class="col-sm-4 text-sm-right">발행일</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a7" class="form-control" name="publish_date">
				        		</div>
				        	</div>
				        	
			    		    <br>
			    		    <div class="form-group row">
				      			<div align="center">
				      				<input type="submit" class="btn btn-primary" value="수정">
				      				<input type="reset" class="btn btn-primary" value="다시작성">
				      			</div>
				      		</div>

				        </form>
				      </div>
			
				    </div>
				  </div>
				</div>
	<!-- updateUser Modal -->
	
	
	<!-- removeUser Modal -->
				<div class="modal fade" id="removeUser" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">회원 삭제</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        선택한 책을 삭제하시겠습니까? 
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="confirmDeleteBtn" data-id="">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
	<!-- removeUser Modal -->
	
	
	<!-- user search -->
<div class="userSearch">
  <form action="" method="post" class="d-flex align-items-center">
    <div class="col-2 me-2">
      <select class="form-select mb-3">
        <option selected>제목</option>
        <option value="1">저자</option>
        <option value="2">줄거리</option>
      </select>
    </div>
    <input type="text" name="keyword" class="form-control mb-3 me-2" style="width: 200px;">
    <input type="submit" value="검색" class="btn btn-outline-success mb-3">
  </form>
</div>

	

	<!-- paging -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				      <a class="page-link">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>
	<!-- paging -->
	
			
		</section>
	</div>
	
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>

<!-- ///////////////공부하기/////////////// -->
<script>
  // 모달이 열릴 때마다 삭제 버튼에 책 ID 값 설정
  document.getElementById('removeUser').addEventListener('show.bs.modal', function (event) {
    var button = event.relatedTarget; // 클릭된 버튼을 가져옴
    var bookId = button.getAttribute('data-id'); // 버튼에서 data-id 값(책의 ID)

    // 삭제 버튼에 ID 값 설정
    var confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
    confirmDeleteBtn.setAttribute('data-id', bookId); // 삭제 버튼의 data-id 속성에 책의 ID 값 설정
  });

  // 삭제 버튼을 클릭하면 해당 ID로 책을 삭제
  document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
    var bookId = this.getAttribute('data-id'); // 삭제 버튼의 data-id 값 가져오기
    if (bookId) {
      // 책 삭제 URL로 이동 (예: bookDelete.go?num=bookId)
      window.location.href = 'bookDelete.go?num=' + bookId;
    }
  });
</script>

</html>