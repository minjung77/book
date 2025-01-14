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
					<td colspan="10" align="right">
						전체 책 수 : ${ totalRecode} 개
					</td>
				</tr>
				<tr>
					<th>책 번호</th>
					<th>이미지</th>
					<th>제목</th>
					<th>저자</th>
					<th>장르</th>
					<th>정가</th>
					<th>줄거리</th>
					<th>발행일</th>
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
								<img alt="책 이미지" src="/img${dto.getImage_url() }">
							</td>
							<td>${dto.getTitle() }</td>
							<td>${dto.getAuthor() }</td>
							<td>${dto.getGenre_id() }</td>
							<td>${dto.getPrice() }</td>
							<td>${dto.getDescription() }</td>
							<td>${dto.getPublish_date().substring(0,10) }</td>
							<td>${dto.getQuantity() }</td>
							<td>
								<!-- modal 창 -->
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#updateBook"
											data-id="${dto.getBook_id()}" 
									        data-title="${dto.getTitle()}" 
									        data-author="${dto.getAuthor()}" 
									        data-genre="${dto.getGenre_id()}" 
									        data-price="${dto.getPrice()}" 
									        data-description="${dto.getDescription()}" 
									        data-publish_date="${dto.getPublish_date().substring(0,10)}" 
									        data-quantity="${dto.getQuantity() }"
									        data-publisher="${dto.getPublisher() }"
											id="updateBtn">
					            		수정
									</button>
									<button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#removeBook" 
											data-id="${dto.getBook_id()}" id="deleteBtn">
					            		삭제
									</button>
					        	</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			
			
		<!-- updateBook Modal -->
			<div class="modal fade" id="updateBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">책 정보 수정 페이지</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form method="post" action="<%=request.getContextPath()%>/bookUpdate.go?page=${page}" enctype="multipart/form-data">
			          <!-- 책 번호 (hidden) -->
			          <input type="hidden" name="updateBook_id" id="updateBook_id">
			          
			          <div class="form-group row">
			            <label for="a1" class="col-sm-4 text-sm-right">제목</label>
			            <div class="col-sm-8">
			              <input type="text" id="a1" class="form-control" name="title">
			            </div>
			          </div>
			
			          <div class="form-group row">
			            <label for="a2" class="col-sm-4 text-sm-right">이미지</label>
			            <div class="col-sm-8">
			              <input type="file" id="a2" class="form-control" name="image_url">
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
			              <input type="text" id="a4" class="form-control" name="genre">
			            </div>
			          </div>
			
			          <div class="form-group row">
			            <label for="a5" class="col-sm-4 text-sm-right">정가</label>
			            <div class="col-sm-8">
			              <input type="text" id="a5" class="form-control" name="price">
			            </div>
			          </div>
			          
			          <div class="form-group row">
			            <label for="a6" class="col-sm-4 text-sm-right">수량</label>
			            <div class="col-sm-8">
			              <input type="text" id="a6" class="form-control" name="quantity">
			            </div>
			          </div>
			
			          <div class="form-group row">
			            <label for="a7" class="col-sm-4 text-sm-right">줄거리</label>
			            <div class="col-sm-8">
			              <textarea rows="7" cols="30" name="description" id="a7"></textarea>
			            </div>
			          </div>
			
			          <div class="form-group row">
			            <label for="a8" class="col-sm-4 text-sm-right">출판사</label>
			            <div class="col-sm-8">
			              <input type="text" id="a8" class="form-control" name="publisher">
			            </div>
			          </div>
			          
			          <div class="form-group row">
			            <label for="a9" class="col-sm-4 text-sm-right">발행일</label>
			            <div class="col-sm-8">
			              <input type="text" id="a9" class="form-control" name="publish_date">
			            </div>
			          </div>
			
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
				<div class="modal fade" id="removeBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">책 삭제</h1>
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
				<div class="BookSearch">
				  <form action="<%=request.getContextPath() %>/bookSearch.go" method="post" class="d-flex align-items-center">
				    <div class="col-2 me-2">
				      <select class="form-select mb-3" name="field">
				        <option selected value="title">제목</option>
				        <option value="author">저자</option>
				        <option value="description">줄거리</option>
				      </select>
				    </div>
				    <input type="text" name="keyword" class="form-control mb-3 me-2" style="width: 200px;">
				    <input type="submit" value="검색" class="btn btn-outline-success mb-3">
				  </form>
				</div>

	

	<!-- paging -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <c:if test="${page > block }">
					    <li class="page-item disabled">
					      <a class="page-link" href="book_modify.go?page=1"> << </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="book_modify.go?page=${startBlock - 1 }">1</a></li>
				    </c:if>

<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
    <c:if test="${i == page}">
        <li class="page-item active">
            <a class="page-link" href="book_modify.go?page=${i}">${i}</a>
        </li>
    </c:if>
    <c:if test="${i != page}">
        <li class="page-item">
            <a class="page-link" href="book_modify.go?page=${i}">${i}</a>
        </li>
    </c:if>
</c:forEach>


					<c:if test="${endBlock < allPage }">
					    <li class="page-item"><a class="page-link" href="book_modify.go?page=${endBlock + 1 }">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="book_modify.go?page=${allPage }"> >> </a>
					    </li>
					</c:if>
				  </ul>
				</nav>
	<!-- paging -->
	
			
		</section>
	</div>
	
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>


<!-- 모달창으로 정보 전달하는할 시에는 script 로 값을 대입. -->

<script>
	document.getElementById('removeBook').addEventListener('show.bs.modal', function (event) {
		var button = event.relatedTarget;
		var bookId = button.getAttribute('data-id'); 
		
		var confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
		confirmDeleteBtn.setAttribute('data-id', bookId); 
	});

	document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
		var bookId = this.getAttribute('data-id'); 
		if (bookId) {
			window.location.href = 'bookDelete.go?num=' + bookId;
		}
	});
	
	// 모달이 열릴 때마다 클릭된 버튼의 data-* 속성 값을 해당 input에 넣어주는 코드
	document.getElementById('updateBook').addEventListener('show.bs.modal', function (event) {
	    var button = event.relatedTarget; // 클릭된 버튼
	    var bookId = button.getAttribute('data-id');
	    
	    var title = button.getAttribute('data-title');
	    var author = button.getAttribute('data-author');
	    var genre = button.getAttribute('data-genre');
	    var price = button.getAttribute('data-price');
	    var description = button.getAttribute('data-description');
	    var publishDate = button.getAttribute('data-publish_date');
	    var quantity = button.getAttribute('data-quantity');
	    var publisher = button.getAttribute('data-publisher');

	    document.getElementById('updateBook_id').value = bookId; 
	    document.getElementById('a1').value = title; 
	    document.getElementById('a3').value = author;
	    document.getElementById('a4').value = genre;
	    document.getElementById('a5').value = price;
	    document.getElementById('a6').value = quantity; 
	    document.getElementById('a7').value = description; 
	    document.getElementById('a8').value = publisher; 
	    document.getElementById('a9').value = publishDate; 

	    console.log('확인용입니다. :: '+document.getElementById('updateBook_id').value);
	});
	
</script>

</html>