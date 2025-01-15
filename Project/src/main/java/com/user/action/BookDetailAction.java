package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;

public class BookDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 사용자 책 상세 보기
		
		int book_id = Integer.parseInt(request.getParameter("id"));
		System.out.println(book_id);
		
		BookDAO dao = BookDAO.getInstance();
		BookDTO dto = dao.getBookDetail(book_id);
		
		dao.BookHitUpdate(book_id);
		
		request.setAttribute("bookDetail", dto);
		
		ActionForward f = new ActionForward();
		f.setRedirect(false);
		f.setPath("detail.jsp");
		
		return f;
	}

}
