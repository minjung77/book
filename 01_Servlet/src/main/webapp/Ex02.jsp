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
	   
	   <form action="member">
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