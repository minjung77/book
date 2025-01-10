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
	   <hr width="30%" color="tomato">
	      <h3>JSP_BBS 테이블 답변형 게시판 게시글 상세내역 페이지</h3>
	   <hr width="30%" color="tomato">
	   <br> <br>
	   
	   <table border="1" width="400">
	      <c:set var="dto" value="${Cont }" />
	      <c:if test="${!empty dto }">
	         <tr>
	            <th>게시글 No.</th>
	            <td> ${dto.getBoard_no() } </td>
	         </tr>
	         
	         <tr>
	            <th>글 작성자</th>
	            <td> ${dto.getBoard_writer() } </td>
	         </tr>
	         
	         <tr>
	            <th>글 제목</th>
	            <td> ${dto.getBoard_title() } </td>
	         </tr>
	         
	         <tr>
	            <th>글 내용</th>
	            <td>
	               <textarea rows="7" cols="25" readonly>${dto.getBoard_cont() }</textarea>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글 비밀번호</th>
	            <td>
	               <c:if test="${!empty dto.getBoard_pwd() }">
	                  <c:forEach begin="1" end="${dto.getBoard_pwd().length() }">
	                  				*
	                  </c:forEach>
	               </c:if>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>글 조회수</th>
	            <td> ${dto.getBoard_hit() } </td>
	         </tr>
	         
	         <tr>
	            <c:if test="${empty dto.getBoard_update() }">
	               <th>작성일자</th>
	               <td> ${dto.getBoard_date() } </td>
	            </c:if>
	         
	            <c:if test="${!empty dto.getBoard_update() }">
	               <th>수정일자</th>
	               <td> ${dto.getBoard_update() } </td>
	            </c:if>
	         </tr>
	      </c:if>
	   
	   	  <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>게시글의 상세 내역이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	   <br> <br>
	   
	   <input type="button" value="글수정"
	      onclick="location.href='bbs_modify.go?no=${dto.getBoard_no() }'">
	   
	   <input type="button" value="글삭제"
	      onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
	      				location.href='bbs_delete.go?no=${dto.getBoard_no() }'
	      		   }else { return; }">
	      
	   <input type="button" value="답변글"
	      onclick="location.href='bbs_reply.go?no=${dto.getBoard_no() }'">
	      
	   <input type="button" value="전체목록"
	      onclick="location.href='bbs_list.go'">
	
	</div>
	
</body>
</html>