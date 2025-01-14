package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class SearchFieldUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 회원 검색
		
		System.out.println("회원 검색 서블릿 진입");
		
		request.setCharacterEncoding("utf-8");
		
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword").trim();
		
		System.out.println(field+"/"+keyword);
		UserDAO dao = UserDAO.getInstance();
		
		List<UserDTO> list = dao.searchUserList(field,keyword);
		
		request.setAttribute("userList", list);
		
		ActionForward f = new ActionForward();
		
		f.setRedirect(false);
		f.setPath("/admin/user_modify.jsp");
		
		return f;
	}

}
