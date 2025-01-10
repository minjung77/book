<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	   <hr width="30%" color="blue">
	      <h2>회원 정보 입력 폼 페이지</h2>
	   <hr width="30%" color="blue">
	   <br> <br>
	   
	   <form method="post" action="join">
	      <table border="1">
	         <tr>
	            <th>회원 아이디</th>
	            <td> <input type="text" name="memid">
	         </tr>
	         
	         <tr>
	            <th>회원 비밀번호</th>
	            <td> <input type="password" name="mempwd">
	         </tr>
	         
	         <tr>
	            <th>회원 이름</th>
	            <td> <input type="text" name="memname">
	         </tr>
	         
	         <tr>
	            <th>회원 연락처</th>
	            <td> <input type="text" name="memphone">
	         </tr>
	         
	         <tr>
	            <th>회원 주소</th>
	            <td> <input type="text" name="memaddr">
	         </tr>
	         
	         <tr>
	            <th>회원 취미</th>
	            <td>
	               <!-- type="checkbox" 인 경우에는 name 속성에 들어 있는
	                    hobby 라는 이름은 배열명이 된다.
	                    ==> 이유는 체크박스는 여러 개의 값이 선택이 되기 때문임. -->
	               <input type="checkbox" name="hobby" value="여행">여행&nbsp;&nbsp;
	               <input type="checkbox" name="hobby" value="독서">독서&nbsp;&nbsp;
	               <input type="checkbox" name="hobby" value="운동">운동 <br>
	               <input type="checkbox" name="hobby" value="게임">게임&nbsp;&nbsp;
	               <input type="checkbox" name="hobby" value="잠자기">잠자기&nbsp;&nbsp;
	            </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="회원가입">
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   
	   </form>
	   
	</div>
	
</body>
</html>