<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .profile-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background: white;
            padding: 20px;
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn-container {
            margin-top: 20px;
        }
    </style>
     <%@ include file="navbar.jsp" %>
</head>
<body>
<div class="container mt-5">
 <h6 class="text-primary text-uppercase text-center">mypage</h6>
    <h1 class="text-center mb-4">마이페이지</h1>
    <div class="row">
        <!-- 회원 정보 섹션 -->
        <div class="col-md-4">
            <div class="profile-card">
                <h4 class="section-title">회원 정보</h4>
                <c:if test="${not empty dto}">
                    <p><strong>이름:</strong> ${dto.memberName}</p>
                    <p><strong>이메일:</strong> ${dto.memberEmail}</p>
                    <p><strong>전화번호:</strong> ${dto.memberPhone}</p>
                </c:if>
                <c:if test="${empty dto}">
                    <p>회원 정보가 존재하지 않습니다.</p>
                </c:if>

                <div class="btn-container">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#updateModal">정보 변경</button>
                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">회원 탈퇴</button>
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#depositModal">돈 예치</button>
                </div>
            </div>
        </div>

        <!-- 구매 내역 섹션 -->
        <div class="col-md-8">
            <div class="profile-card">
                <h4 class="section-title">주문 내역</h4>
                <c:if test="${not empty orderList}">
                    <table class="table table-bordered">
                        <thead class="table-light">
                        <tr>
                            <th>주문 날짜</th>
                            <th>주문 번호</th>
                            <th>수령인</th>
                            <th>주문 상품</th>
                            <th>총 금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td>${order.bookDate}</td>
                                <td>${order.bookNumber}</td>
                                <td>${order.bookRecipt}</td>
                                <td>${order.bookName}</td>
                                <td>${order.bookTotal}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orderList}">
                    <p>주문 내역이 없습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- 회원 정보 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">회원정보 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="updateUserInfo" name="memberUpdateForm" onsubmit="return checkUpdateValues()">
                    <div class="mb-3">
                        <label for="memberId" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="memberId" name="memberId" value="${dto.memberId}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="memberName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" value="${dto.memberName}" required>
                    </div>
                    <div class="mb-3">
                        <label for="memberPw" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="memberPw" name="memberPw">
                    </div>
                    <div class="mb-3">
                        <label for="memberPwChk" class="form-label">비밀번호 확인</label>
                        <input type="password" class="form-control" id="memberPwChk" name="memberPwChk">
                    </div>
                    <div class="mb-3">
                        <label for="memberEmail" class="form-label">이메일</label>
                        <input type="email" class="form-control" id="memberEmail" name="memberEmail" value="${dto.memberEmail}" required>
                    </div>
                    <div class="mb-3">
                        <label for="memberPhone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${dto.memberPhone}" required>
                    </div>
                    <button class="btn btn-primary w-100" type="submit">정보 수정 완료</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 회원 탈퇴 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">회원 탈퇴</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말로 회원 탈퇴를 하시겠습니까? 탈퇴 후에는 모든 정보가 삭제됩니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <form action="deleteAccount.jsp" method="post">
                    <input type="hidden" name="name" value="${dto.memberName}">
                    <button type="submit" class="btn btn-danger">회원 탈퇴</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 돈 예치 모달 -->
<div class="modal fade" id="depositModal" tabindex="-1" aria-labelledby="depositModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="depositModalLabel">돈 예치</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="depositMoney" onsubmit="return validateDeposit()">
                    <div class="mb-3">
                        <label for="depositAmount" class="form-label">예치 금액</label>
                        <input type="number" class="form-control" id="depositAmount" name="depositAmount" min="1000" step="100" placeholder="최소 1,000원" required>
                        <span class="deposit-error text-danger small"></span>
                    </div>
                    <button class="btn btn-success w-100" type="submit">예치 완료</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function validateDeposit() {
        const depositAmount = document.getElementById('depositAmount').value;
        if (depositAmount < 1000) {
            alert("최소 예치 금액은 1,000원입니다.");
            return false;
        }
        return true;
    }
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
