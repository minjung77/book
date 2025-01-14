package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.CartDTO;
import com.user.model.UserDAO;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 사용자 책 - 장바구니 등록
		
		String user_id = request.getParameter("user_id");
		int book_id = Integer.valueOf(request.getParameter("book_id"));
		
		int quantity = Integer.valueOf(request.getParameter("quantity"));
		
		CartDTO dto = new CartDTO();
		dto.setUser_id(user_id);
		dto.setBook_id(book_id);
		dto.setQuantity(quantity);
		
		UserDAO dao = UserDAO.getInstance();
		
		int chk = dao.addCart(dto);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('장바구니 추가되었습니다.')");
			out.println("location.href='cartList.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('장바구니 담기에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
