package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자에서 회원 삭제
		
		String user_id = request.getParameter("id");
		
		UserDAO dao = UserDAO.getInstance();
		
		int chk = dao.deleteBook(user_id);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('회원이 삭제되었습니다.')");
			out.println("location.href='user_modify.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
