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
		<h2>두 수 더하기(애노테이션 1:1: 등록)</h2>
		<form action="adder">
			<p>첫번째 수: <input type="text" name="num1"></p>
			<p>두번째 수: <input type="text" name="num2"></p>
			
			<input type="submit" value="더하기">
	 	</form>
		
		<br>
		<hr width="30%">
		<br>
		
		<h2>두 수 더하기(web.xml 등록)</h2>
		<form action="adder1">
			<p>첫번째 수: <input type="text" name="num1"></p>
			<p>두번째 수: <input type="text" name="num2"></p>
			
			<input type="submit" value="더하기">
	 	</form>
	 	
	 	
	</div>
	
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	
	<%--
		 서블릿 매핑 방법 - 2가지
		 1. 애노테이션 등록
		 	- 서블릿 클래스의 url-mapping에 등록.
		 	- 1:1 매핑인 경우에 사용.
		 	- 설정 파일이 필요가 없음.
		 
		 2. 배포서술자(web.xml) 등록
		 	- 매핑할 서블릿이 많은 경우에 일괄 처리에 용이함.
		 	- N:1 매핑인 경에 사용.
		 	- web.xml 파일에 설정.
		 	- 향후 배울 MVC 패턴에서 많이 사용되는 매핑 방법.
		 	
		 	※ 서블릿 매핑 목적
		 	  - 처리 프로그램을 url에서 숨기는게 목적임.
		 	  ==> 파일명과 폴더명(패키지)까지 숨김.
		 	  - 보안을 목적으로 숨김.		 	
		 	  
	 --%>
</body>
</html>