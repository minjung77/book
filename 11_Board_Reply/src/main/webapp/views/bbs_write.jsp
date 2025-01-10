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
	   <hr width="30%" color="gray">
	      <h3>JSP_BBS 답변형 게시판 게시글 작성 폼 페이지</h3>
	   <hr width="30%" color="gray">
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/bbs_write_ok.go">
	   
	      <table border="1" width="350">
	         <tr>
	            <th>작성자</th>
	            <td> <input name="writer"> </td>
	         </tr>
	         
	         <tr>
	            <th>글제목</th>
	            <td> <input name="title"> </td>
	         </tr>
	         
	         <tr>
	            <th>글내용</th>
	            <td>
	               <textarea rows="7" cols="25" name="cont"></textarea>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글 비밀번호</th>
	            <td> <input type="password" name="pwd"> </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="글쓰기">&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	      
	   </form>
	
	</div>
</body>
</html>