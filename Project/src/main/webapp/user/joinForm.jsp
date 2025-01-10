<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/customer.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .input-form {
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 30px;
    }
    .form-control:focus {
        border-color: #7AB730;
        box-shadow: 0 0 5px rgba(122, 183, 48, 0.5);
    }
    .btn-primary {
        background-color: #7AB730;
        border-color: #7AB730;
    }
    .btn-primary:hover {
        background-color: #639f27;
        border-color: #5c8c23;
    }
    .btn-secondary {
        background-color: #d3d3d3;
        border-color: #c2c2c2;
    }
    .btn-secondary:hover {
        background-color: #b3b3b3;
        border-color: #a3a3a3;
    }
    .text-muted {
        font-size: 0.9rem;
    }
    h4 {
        color: #7AB730;
    }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="input-form">
					<h4 class="mb-4 text-center">회원가입</h4>
					<form method="post" action="<%=request.getContextPath() %>/user_join_ok.go" name="userInfo" onsubmit="return checkValue()">
					
						<div class="mb-3">
						    <label for="memberId" class="form-label">아이디</label>
						    <input type="text" class="form-control" id="memberId" name="memberId" maxlength="50" placeholder="아이디를 입력해주세요" required onblur="checkId()">
						    <span id="idchk" class="idchk text-danger small"></span>
						</div>
						
						<div class="mb-3">
							<label for="memberName" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력해주세요" required>
							<span class="memberNamechk text-danger small"></span>
						</div>
						
						<div class="mb-3">
							<label for="memberPw" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요" required>
							<span class="memberPwchk text-danger small"></span>
						</div>
						
						<div class="mb-3">
							<label for="memberPwChk" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="memberPwChk" name="memberPwChk" placeholder="비밀번호를 다시 입력해주세요" required>
							<span class="memberPwChk text-danger small"></span>
						</div>
						
						<div class="mb-3">
							<label for="memberEmail" class="form-label">이메일</label>
							<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="metadog@example.com" required>
							<span class="memberEmailChk text-danger small"></span>
						</div>
						
						<div class="mb-3">
							<label for="memberPhone" class="form-label">전화번호</label>
							<input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="010-1234-5678">
							<span class="memberPhoneChk text-danger small"></span>
						</div>
										
						<div class="mb-3">
							    <label for="memberAddress" class="form-label">주소</label>
							    <input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="주소를 입력해주세요" required>
							    <span class="memberAddressChk text-danger small"></span>
							</div>
							
						<div class="d-grid gap-2">
							<button class="btn btn-primary" type="submit">가입 완료</button>
							<button class="btn btn-secondary" type="button" onclick="history.back()">뒤로가기</button>
						</div>
						
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	
	<script>
	unction checkId() {
	    const memberId = document.getElementById('memberId').value;
	    const idchk = document.getElementById('idchk');

	    if (!memberId) {
	        idchk.textContent = "아이디를 입력해주세요.";
	        idchk.style.color = "red";
	        return;
	    }

	    fetch('checkId', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify({ memberId: memberId }),
	    })
	        .then((response) => response.json())
	        .then((data) => {
	            if (data.isAvailable) {
	                idchk.textContent = "사용 가능한 아이디입니다.";
	                idchk.style.color = "green";
	            } else {
	                idchk.textContent = "이미 사용 중인 아이디입니다.";
	                idchk.style.color = "red";
	            }
	        })
	        .catch((error) => {
	            console.error('Error:', error);
	            idchk.textContent = "오류가 발생했습니다. 다시 시도해주세요.";
	            idchk.style.color = "red";
	        });
	}

function checkValue() {
    const memberPw = document.getElementById('memberPw').value;
    const memberPwChk = document.getElementById('memberPwChk').value;
    const memberEmail = document.getElementById('memberEmail').value;
    const memberId = document.getElementById('memberId').value;
    const idchk = document.getElementById('idchk');
    const memberName = document.getElementById('memberName').value;
    const memberPhone = document.getElementById('memberPhone').value;
    const memberAddress = document.getElementById('memberAddress').value;

    // 비밀번호 확인
    if (memberPw !== memberPwChk) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return false;
    }

    // 필수 항목 체크
    if (!memberId || !memberName || !memberPw || !memberEmail || !memberAddress) {
        alert("모든 필드를 작성해 주세요.");
        return false;
    }

    // 이메일 형식 체크
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailPattern.test(memberEmail)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        return false;
    }

    // 전화번호 형식 체크 (옵션)
    if (memberPhone && !/^\d{3}-\d{3,4}-\d{4}$/.test(memberPhone)) {
        alert("전화번호 형식이 올바르지 않습니다.");
        return false;
    }

    return true;
}
</script>
</body>
</html>
