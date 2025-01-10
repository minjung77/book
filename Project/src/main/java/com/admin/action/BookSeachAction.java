package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;

public class BookSeachAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 - 책 관리(모든 책)
		
		BookDAO dao = BookDAO.getInstance();
		
		List<BookDTO> list = dao.getBook();
		
		request.setAttribute("bookList", list);
		
		ActionForward f = new ActionForward();
		
		f.setRedirect(false);
		f.setPath("/admin/book_modify.jsp");
		
		return f;
	}

}
