package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;

public class DeleteEachAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 사용자 장바구니 개별 삭제 버튼
		int cart_id = Integer.parseInt(request.getParameter("cart"));
		
		UserDAO dao = UserDAO.getInstance();
		
		int chk = dao.deleteEachCart(cart_id);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('장바구니에서 삭제되었습니다.')");
			out.println("location.href='user/cartList.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('장바구니 항목 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}
}
