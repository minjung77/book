<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!--  
		[문제] 성적 처리를 해 보자.
			  입력 받을 내용 : 이름, 국어점수, 영어점수, 수학점수
			  
			  <출력내용>
			  이름 : 0 0 0
			  국어점수 : 00 점
			  영어점수 : 00 점
			  수학점수 : 00 점
			  총  점  : 000점
			  평  균  : 00.00점
			  학  점  : 0 학점  
	-->
	
		<div align="center">      
		<hr width="30%" color="gray">
		<h2>학생 성적 처리 폼 페이지</h2>
		<hr width="30%" color="gray">
		<br> <br>
		
		<form method="post" action="score">
		<table border="1">
		<tr>
			<th> 이 름</th>
			<td> <input type="text" name="name"> </td>
			
		</tr>
		
		<tr>
			<th> 국어점수</th>
			<td> <input type="text" name="kor"> </td>
			
		</tr>
		
		<tr>
			<th> 영어점수</th>
			<td> <input type="text" name="eng"> </td>
			
		</tr>
		
		<tr>
			<th> 수학점수</th>
			<td> <input type="text" name="mat"> </td>
			
		</tr>
		
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" value="성적처리">&nbsp;&nbsp;
			<input type="reset" value="다시작성">
			</td>
		</tr>
		
		</table>
		
		</form>
		
		</div>
</body>
</html>