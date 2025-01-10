<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	   <hr width="30%" color="marmoon">
	      <h3>JSP_BBS 테이블 게시판 답변글 폼 페이지</h3>
	   <hr width="30%" color="marmoon">
	   <br> <br>
	   
	   <c:set var="dto" value="${Reply }" />
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/bbs_reply_ok.go">
	   
	   	  <input type="hidden" name="bbs_no" value="${dto.getBoard_no() }">
	   	  <input type="hidden" name="group" value="${dto.getBoard_group() }">
	   	  <input type="hidden" name="step" value="${dto.getBoard_step() }">
	   	  <input type="hidden" name="indent" value="${dto.getBoard_indent() }">
	   	  
	      <table border="1" width="350">
	         <tr>
	            <th>작성자</th>
	            <td> <input name="reply_writer"
	            			value="${dto.getBoard_writer() }">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글제목</th>
	            <td>
	               <input name="reply_title"
	               			value="(Re)${dto.getBoard_title() }">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글내용</th>
	            <td>
	               <textarea rows="7" cols="25" name="reply_cont">${dto.getBoard_cont() }</textarea>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글 비밀번호</th>
	            <td> <input type="password" name="reply_pwd"> </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="답변글">&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   </form>
	</div>
</body>
</html>