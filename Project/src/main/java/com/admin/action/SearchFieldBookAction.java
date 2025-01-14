package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;

public class SearchFieldBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 - 책 검색
		System.out.println("책 검색 서블릿 진입");
		
		//한글이 넘어오므로 한글 깨짐 방지 작업
		request.setCharacterEncoding("utf-8");
		
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword").trim();
		
		BookDAO dao = BookDAO.getInstance();
		
		List<BookDTO> list = dao.searchBookList(field,keyword);
		
		request.setAttribute("bookList", list);
		
		ActionForward f = new ActionForward();
		
		f.setRedirect(false);
		f.setPath("/admin/book_modify.jsp");
		
		return f;
	}

}
