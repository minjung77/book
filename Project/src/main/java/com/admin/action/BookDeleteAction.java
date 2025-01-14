package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;

public class BookDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자가 선택한 책을 지우는 로직
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BookDAO dao = BookDAO.getInstance();
		
		int chk = dao.deleteBook(num);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('책이 삭제되었습니다.')");
			out.println("location.href='book_modify.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('책 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
