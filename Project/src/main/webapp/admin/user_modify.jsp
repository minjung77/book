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
	
		<section class="user_select">
			<h3 class="title">회원 조회</h3>
			
			<div>
				<table class="table table-hover shadow p-3 mb-5 bg-body-tertiary rounded">
					<tr>
						<th>회원 번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>예치금</th>
						<th>가입일</th>
						<th>변경</th>
					</tr>
					
					<tr>
						<td>회원번호</td>
						<td>이름</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>주소</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>예치금</td>
						<td>가입일</td>
						
						<td>
							<!-- modal 창 -->
					        <div class="d-flex justify-content-center">
					          <button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#updateUser">
					            수정
					          </button>
					          <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#removeUser">
					            삭제
					          </button>
					        </div>
						</td>
						
					</tr>
				</table>
				
	<!-- updateUser Modal -->
	
				<div class="modal fade" id="updateUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 수정 페이지</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form method="post" action="<%=request.getContextPath()%>/tbl_write_ok.go">
				        	<div class="form-group row">
				        		<label for="a1" class="col-sm-4 text-sm-right">이름</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a1" class="form-control" name="writer">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a2" class="col-sm-4 text-sm-right">아이디</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a2" class="form-control" name="title">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a3" class="col-sm-4 text-sm-right">비밀번호</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a3" class="form-control" name="title">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a4" class="col-sm-4 text-sm-right">주소</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a4" class="form-control" name="pwd">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a5" class="col-sm-4 text-sm-right">전화번호</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a5" class="form-control" name="pwd">
				        		</div>
				        	</div>
				        	
			
				        	
							<div class="form-group row">
							    <label for="a6" class="col-sm-4 text-sm-right">이메일</label>
							    <!-- input-group의 부모 div에 col-sm-8 적용 -->
							    <div class="col-sm-8">
							        <div class="input-group">
							            <input type="text" class="form-control" aria-label="Text input with dropdown button">
							            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">이메일 선택</button>
							            <ul class="dropdown-menu dropdown-menu-end">
							                <li><a class="dropdown-item" href="#">@google.com</a></li>
							                <li><a class="dropdown-item" href="#">@naver.com</a></li>
							                <li><a class="dropdown-item" href="#">@nate.com</a></li>
							                <li><hr class="dropdown-divider"></li>
							            </ul>
							        </div>
							    </div>
							</div>
								        	
			
				        	
			        		<div class="form-group row">
				        		<label for="a7" class="col-sm-4 text-sm-right">예치금</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a7" class="form-control" name="pwd">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a8" class="col-sm-4 text-sm-right">가입일</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a8" class="form-control" name="pwd">
				        		</div>
				        	</div>
				        	
			    		    <br>
			    		    <div class="form-group row">
				      			<div align="center">
				      				<input type="submit" class="btn btn-primary" value="글쓰기">
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
				        선택한 회원을 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary">삭제</button>
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
        <option selected>회원명</option>
        <option value="1">아이디</option>
        <option value="2">주소</option>
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
	
	
			</div>
		</section>
	</div>
	
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>
</html>