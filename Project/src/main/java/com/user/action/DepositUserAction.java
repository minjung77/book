package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class DepositUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  HttpSession session = request.getSession();
	        UserDTO user = (UserDTO) session.getAttribute("user");

	        if (user == null) {
	            // 로그인하지 않은 상태라면 로그인 페이지로 리디렉션
	            ActionForward forward = new ActionForward();
	            forward.setRedirect(true);
	            forward.setPath("user/login.jsp");
	            return forward;
	        }

	        try {
	            // 예치금 액수를 파라미터로 받음
	            int depositAmount = Integer.parseInt(request.getParameter("depositAmount"));
	            if (depositAmount > 0) {
	                // money 필드를 업데이트
	                int newMoney = user.getMoney() + depositAmount;
	                user.setMoney(newMoney);

	                // DAO 호출하여 데이터베이스에 예치금 업데이트
	                UserDAO dao = UserDAO.getInstance();
	                boolean isUpdated = dao.updateMoney(user);

	                if (isUpdated) {
	                    // 예치금 충전 성공
	                    session.setAttribute("user", user); // 세션에 업데이트된 사용자 객체를 다시 설정
	                    ActionForward forward = new ActionForward();
	                    forward.setRedirect(true);
	                    forward.setPath("user/depositSuccess.jsp");
	                    return forward;
	                } else {
	                    // 예치금 업데이트 실패 시
	                    request.setAttribute("error", "예치금 업데이트 실패. 다시 시도해 주세요.");
	                    ActionForward forward = new ActionForward();
	                    forward.setRedirect(false);
	                    forward.setPath("user/depositPage.jsp");
	                    return forward;
	                }
	            } else {
	                // 예치금이 잘못된 경우 에러 메시지
	                request.setAttribute("error", "충전할 금액을 올바르게 입력해 주세요.");
	                ActionForward forward = new ActionForward();
	                forward.setRedirect(false);
	                forward.setPath("user/depositPage.jsp");
	                return forward;
	            }
	        } catch (NumberFormatException e) {
	            // 예치금 액수가 숫자가 아닌 경우 처리
	            request.setAttribute("error", "유효한 금액을 입력해 주세요.");
	            ActionForward forward = new ActionForward();
	            forward.setRedirect(false);
	            forward.setPath("user/depositPage.jsp");
	            return forward;
	        }
	    }
	}