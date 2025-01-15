package com.user.action;
import java.util.Date;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.CartDTO;
import com.user.model.DeliveryDAO;
import com.user.model.DeliveryDTO;
import com.user.model.OrderDAO;
import com.user.model.OrderDTO;
import com.user.model.UserDAO;
import com.user.model.UserDTO;


public class CompleteUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 // 세션에서 사용자 정보와 장바구니 정보 가져오기
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");

        if (cartList == null || cartList.isEmpty()) {
            response.sendRedirect("cart.jsp"); // 장바구니가 비어 있으면 장바구니 페이지로 리다이렉트
            return forward;
        }

        // 폼에서 받은 배송 정보 가져오기
        String name = request.getParameter("name");
        String orderDate = request.getParameter("orderDate");
        String roadAddress = request.getParameter("roadAddress");
        String detailAddress = request.getParameter("detailAddress");

        // 총액 계산
        int totalAmount = 0;
        for (CartDTO product : cartList) {
            totalAmount += product.getPrice() * product.getQuantity();
        }

        // 예치금 결제 처리
        if (user.getMoney() < totalAmount) {
            forward.setRedirect(true);
            forward.setPath("insufficient_funds.jsp"); // 예치금 부족 시 페이지로 이동
            return forward;
        }

        // 예치금 차감 후 사용자 정보 업데이트
        UserDAO userDAO = UserDAO.getInstance();
        int updatedMoney = user.getMoney() - totalAmount;
        userDAO.updateUserMoney(user.getUser_id(), updatedMoney); // 예치금 업데이트
        user.setMoney(updatedMoney);
        session.setAttribute("user", user); // 업데이트된 사용자 정보 저장

        // 주문 정보 저장
        int orderId = processOrder(user, totalAmount);
        

        // 배송 정보 저장
        String fullAddress = roadAddress + " " + detailAddress; // 도로명 주소와 세부 주소 합치기
        processDelivery(orderId, user, fullAddress);
        
        

        // 영수증 페이지로 포워딩
        request.setAttribute("cartList", cartList);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("user", user);
        
        DeliveryDTO deliveryDTO = new DeliveryDTO();
        deliveryDTO.setOrderId(orderId);
        deliveryDTO.setUserId(user.getUser_id());
        deliveryDTO.setAddress1(roadAddress);
        deliveryDTO.setAddress2(detailAddress);
        deliveryDTO.setDeliveryStart(new Date());

        request.setAttribute("delivery", deliveryDTO); // 배송 정보 추가
           
        forward.setRedirect(false);
        forward.setPath("user/receipt.jsp");

        return forward;
    }

    private int processOrder(UserDTO user, int totalAmount) {
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setUserId(user.getUser_id());
        orderDTO.setOrderDate(new Date());
        orderDTO.setTotalAmount(totalAmount);
        orderDTO.setOrderStatusId(1);
        orderDTO.setOrderPayStatus(1);

        OrderDAO orderDAO = OrderDAO.getInstance();
        return orderDAO.insertOrder(orderDTO);
    }

    private void processDelivery(int orderId, UserDTO user, String address) {
        DeliveryDTO deliveryDTO = new DeliveryDTO();
        deliveryDTO.setOrderId(orderId);
        deliveryDTO.setUserId(user.getUser_id());
        deliveryDTO.setAddress1(address);
        deliveryDTO.setAddress2("");
        deliveryDTO.setDeliveryStart(new Date());
        

        DeliveryDAO deliveryDAO = DeliveryDAO.getInstance();
        deliveryDAO.insertDelivery(deliveryDTO);
        
    }
}