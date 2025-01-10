<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(f) {
		
		// 아이디 입력 여부 확인
		if(f.memid.value == ""){
			alert("회원 아이디를 입력하세요!!!");
			f.memid.focus();
			return false; 	// action 페이지로 이동 방지
			
		}
		
		// 비밀번호 입력 여부 확인
		if(f.mempwd.value == ""){
			alert("회원 비밀번호를 입력하세요!!!");
			f.mempwd.focus();
			return false; 	// action 페이지로 이동 방지
			
		}
		
		// 이름 입력 여부 확인
		if(f.memname.value == ""){
			alert("회원 이름을 입력하세요!!!");
			f.memname.focus();
			return false; 	// action 페이지로 이동 방지
			
		}
		
		// 연락처 입력 여부 확인
		if(f.memphone.value == ""){
			alert("회원 연락처를 입력하세요!!!");
			f.memphone.focus();
			return false; 	// action 페이지로 이동 방지
			
		}
		
		// 주소를 입력 여부 확인
		if(f.memaddr.value == ""){
			alert("회원 주소를 입력하세요!!!");
			f.memaddr.focus();
			return false; 	// action 페이지로 이동 방지
			
		}
		
		f.method = "post";
		f.action="/01_Servlet/member"
		f.submit();
	}
</script>
</head>
<body>


	<div align="center">
	   <hr width="30%" color="blue">
	      <h2>회원 정보 입력 폼 페이지</h2>
	   <hr width="30%" color="blue">
	   <br> <br>
	   
	   <form >
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
	                 <input type="submit" value="회원가입"
	               onclick="return check(this.form)">&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   
	   </form>
	   
	</div>
	
</body>
</html>
