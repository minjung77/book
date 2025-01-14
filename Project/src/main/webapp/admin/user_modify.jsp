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
	<jsp:include page="include/admin_header.jsp"></jsp:include>
	
	<c:set var="list" value="${userList }"></c:set>
	<div class="main">
		<jsp:include page="include/admin_nav.jsp"></jsp:include>
	
		<section class="user_select">
			<h3 class="title">회원 조회</h3>
			<div>
				<table class="table table-hover shadow p-3 mb-5 bg-body-tertiary rounded">
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>예치금</th>
						<th>변경</th>
					</tr>
						
					<c:if test="${empty list }">
						<tr>
							<td colspan="10">회원 목록이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${dto.getUser_name() }</td>
								<td>${dto.getUser_id() }</td>
								<td>${dto.getPassword() }</td>
								<td>${dto.getAddress() }</td>
								<td>${dto.getPhone() }</td>
								<td>${dto.getEmail() }</td>
								<td>${dto.getMoney() }</td>
								
								<td>
									<!-- modal 창 -->
							        <div class="d-flex justify-content-center">
							          <button type="button" class="btn btn-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#updateUser"
							          		  data-userId="${dto.getUser_id() }"
							          		  data-userName="${dto.getUser_name() }"
							          		  data-password="${dto.getPassword() }"
							          		  data-address="${dto.getAddress() }"
							          		  data-phone="${dto.getPhone() }"
							          		  data-email="${dto.getEmail() }"
							          		  data-money="${dto.getMoney() }"
							          		  id="userUpdateBtn"
							          		  >
							            수정
							          </button>
							          <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#removeUser" 
							          		  data-userId="${dto.getUser_id() }" id="userDeleteBtn">
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
				        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 수정 페이지</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form method="post" action="<%=request.getContextPath()%>/user_update.go?page=${page}">
				        	<div class="form-group row">
				        		<label for="a1" class="col-sm-4 text-sm-right">이름</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a1" class="form-control" name="name">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a2" class="col-sm-4 text-sm-right">아이디</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a2" class="form-control" name="id">
				        		</div>
				        	</div>
				        	
				        	<div class="form-group row">
				        		<label for="a3" class="col-sm-4 text-sm-right">비밀번호</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a3" class="form-control" name="pwd">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a4" class="col-sm-4 text-sm-right">주소</label>
				        		<div class="col-sm-8">
				        			<input type="password" id="a4" class="form-control" name="addr">
				        		</div>
				        	</div>
				        	
			        		<div class="form-group row">
				        		<label for="a5" class="col-sm-4 text-sm-right">전화번호</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a5" class="form-control" name="phone">
				        		</div>
				        	</div>
				        	
			
				        	
							<div class="form-group row">
							    <label for="a6" class="col-sm-4 text-sm-right">이메일</label>
							    <!-- input-group의 부모 div에 col-sm-8 적용 -->
							    <div class="col-sm-8">
							        <div class="input-group">
							            <input type="text" class="form-control" id="a6" aria-label="Text input with dropdown button" name="email">
							           <!-- <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">이메일 선택</button>
							             <ul class="dropdown-menu dropdown-menu-end" name="emailSelect">
							                <li><a class="dropdown-item" href="#" value="">직접입력</a></li>
							                <li><a class="dropdown-item" href="#" value="@google.com">@google.com</a></li>
							                <li><a class="dropdown-item" href="#" value="@naver.com">@naver.com</a></li>
							                <li><a class="dropdown-item" href="#" value="@nate.com">@nate.com</a></li>
							                <li><hr class="dropdown-divider"></li>
							            </ul> -->
							        </div>
							    </div>
							</div>
								        	
			
				        	
			        		<div class="form-group row">
				        		<label for="a7" class="col-sm-4 text-sm-right">예치금</label>
				        		<div class="col-sm-8">
				        			<input type="text" id="a7" class="form-control" name="money">
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
				        <button type="button" class="btn btn-primary" id="confirmDeleteBtn" data-id="">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
	<!-- removeUser Modal -->
	
	
	<!-- user search -->
<div class="userSearch">
  <form action="<%=request.getContextPath() %>/userSearch.go?page=${page}" method="post" class="d-flex align-items-center">
    <div class="col-2 me-2">
      <select class="form-select mb-3" name="field">
        <option selected value="user_name">회원명</option>
        <option value="user_id">아이디</option>
        <option value="addr">주소</option>
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
            <a class="page-link" href="user_modify.go?page=${i}">${i}</a>
        </li>
    </c:if>
    <c:if test="${i != page}">
        <li class="page-item">
            <a class="page-link" href="user_modify.go?page=${i}">${i}</a>
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
	
	
			</div>
		</section>
	</div>
	
	<jsp:include page="include/admin_footer.jsp"></jsp:include>
</body>
<script>
  document.getElementById('removeUser').addEventListener('show.bs.modal', function (event) {
    var button = event.relatedTarget;
    var userId = button.getAttribute('data-userId'); 

    var confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
    confirmDeleteBtn.setAttribute('data-userId', userId); 
  });

  document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
    var userId = this.getAttribute('data-userId'); 
    if (userId) {
      window.location.href = 'userDelete.go?id=' + userId;
    }
  });
  
	document.getElementById('updateUser').addEventListener('show.bs.modal', function (event) {
		var button = event.relatedTarget; // 클릭된 버튼
		
	    var userId = button.getAttribute('data-userId');
	    var userName = button.getAttribute('data-userName');
	    var password = button.getAttribute('data-password');
	    var address = button.getAttribute('data-address');
	    var phone = button.getAttribute('data-phone');
	    var email = button.getAttribute('data-email');
	    var money = button.getAttribute('data-money');

	    document.getElementById('a1').value = userName; 
	    document.getElementById('a2').value = userId; 
	    document.getElementById('a3').value = password;
	    document.getElementById('a4').value = address;
	    document.getElementById('a5').value = phone;
	    document.getElementById('a6').value = email; 
	    document.getElementById('a7').value = money; 
	    
	    console.log(money);
	});
</script>

</html>