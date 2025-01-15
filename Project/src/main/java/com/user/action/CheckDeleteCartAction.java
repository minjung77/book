package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;

public class CheckDeleteCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//사용자 - 선택한 책들을 삭제하는 로직
		String id = request.getParameter("num");//"3,4"
		
		String sql = "delete from cart where cart_id in ("+id+")";
		System.out.println();
		
		UserDAO dao = UserDAO.getInstance();
		
		int chk = dao.checkCartDelete(id);
		
		return null;
	}

}
