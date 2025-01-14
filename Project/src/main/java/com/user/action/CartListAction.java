package com.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.CartDTO;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class CartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 사용자 - 장바구니 리스트 목록 조회
		
        HttpSession session = request.getSession();
        
        String userName = (String)session.getAttribute("userName");
        UserDTO user = (UserDTO) session.getAttribute("user");
		
		System.out.println("세션 객체 확인 " + user);
		System.out.println("사용자 세션 확인 ::: "+user.getUser_id());
		
		UserDAO dao = UserDAO.getInstance();
		List<CartDTO> list = dao.getCart(user.getUser_id());
		
		request.setAttribute("cartList", list);
		
		ActionForward f = new ActionForward();
		
		f.setRedirect(false);
		f.setPath("cart.jsp");
		
		return f;
	}
}
