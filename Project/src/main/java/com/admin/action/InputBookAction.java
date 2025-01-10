package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;

public class InputBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자가 책을 추가하는 화면에 책 번호(index)를 띄움
		
		BookDAO dao = BookDAO.getInstance();
		
		int num = dao.maxNumSearch();
		request.setAttribute("bookNum", num);
		
		ActionForward f = new ActionForward();
		f.setRedirect(false);
		f.setPath("/admin/book_insert.jsp");
		return f;
	}
}
