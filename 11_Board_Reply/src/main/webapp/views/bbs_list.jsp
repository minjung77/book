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
	      <h3>JSP_BBS 답변형 게시판 테이블 전체 리스트 페이지</h3>
	   <hr width="30%" color="marmoon">
	   <br> <br>
	   
	   <table border="1" width="650">
	      <tr>
	         <th>게시글 No.</th> <th>글제목</th> <th>조회수</th>
	         <td>작성일자</td> <th>Group</th> <th>Step</th> <th>Indent</th>
	      </tr>
	      
	      <c:set var="list" value="${List }" />
	      
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getBoard_no() } </td>
	               <td> 
	                  <%-- 댓글인 경우 --%>
	                  <c:if test="${dto.getBoard_indent() != 0 }">
	                     <c:forEach begin="1" end="${dto.getBoard_indent() }">
	                        &nbsp;&nbsp;
	                     </c:forEach>
	                  </c:if>
	                  
	                  <a href="<%=request.getContextPath() %>/bbs_content.go?no=${dto.getBoard_no() }">
	               				${dto.getBoard_title() } </a>
	               </td>
	               <td> ${dto.getBoard_hit() } </td>
	               <td> ${dto.getBoard_date().substring(0, 10) } </td>
	               <td> ${dto.getBoard_group() } </td>
	               <td> ${dto.getBoard_step() } </td>
	               <td> ${dto.getBoard_indent() } </td>
	            </tr>
	         </c:forEach>
	      
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="7" align="center">
	               <h3>게시물 전체 리스트가 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	   <br> <br>
	   
	   <input type="button" value="글쓰기"
	   		onclick="location.href='bbs_write.go'">
	
	</div>
</body>
</html>