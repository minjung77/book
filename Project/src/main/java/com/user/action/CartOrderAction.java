package com.user.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.CartDTO;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class CartOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 // user_id를 파라미터로 받음
		 HttpSession session = request.getSession();
	        
        String userName = (String)session.getAttribute("userName");
        UserDTO user = (UserDTO) session.getAttribute("user");
        
        System.out.println("세션 객체 확인 " + user);
		System.out.println("사용자 세션 확인 ::: "+user.getUser_id());
		
        String user_id = request.getParameter("user_id");

        // UserDAO를 통해 장바구니 정보 가져오기
        UserDAO dao = UserDAO.getInstance();
        List<CartDTO> cartList = dao.getCart(user_id);

        // 장바구니 정보를 request에 바인딩
        session.setAttribute("cartList", cartList);

        // 주문 확인 페이지로 이동
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("user/orderConfirmation.jsp");
        return forward;
    }
}