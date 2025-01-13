package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class DeleteUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
        ActionForward forward = new ActionForward();
        String confirm = request.getParameter("confirm");

        if ("yes".equalsIgnoreCase(confirm)) {
            // 세션에서 user 객체 가져오기
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("user");

            // user 객체가 없으면 로그인 페이지로 이동
            if (user == null) {
                forward.setRedirect(true);
                forward.setPath("user/login.jsp");
                return forward;
            }

            // user 객체에서 user_id 추출
            String userId = user.getUser_id();
            System.out.println("탈퇴 요청 user_id: " + userId); // 로그 출력

            UserDAO dao = UserDAO.getInstance();
            try {
                int result = dao.deleteUser(userId);
                System.out.println("삭제 결과: " + result); // 로그 출력

                if (result > 0) {
                    // 회원 탈퇴 성공, 세션 무효화
                    session.invalidate();
                    forward.setRedirect(true);
                    forward.setPath("user/login.jsp");
                } else {
                    // 회원 탈퇴 실패
                    request.setAttribute("errorMsg", "회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
                    forward.setRedirect(false);
                    forward.setPath("user/deletePage.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMsg", "오류가 발생했습니다. 관리자에게 문의하세요.");
                forward.setRedirect(false);
                forward.setPath("user/errorPage.jsp");
            }
        } else {
            // 탈퇴 확인 문구가 일치하지 않음
            request.setAttribute("errorMsg", "탈퇴 확인 문구를 정확히 입력해주세요.");
            forward.setRedirect(false);
            forward.setPath("user/deletePage.jsp");
        }

        return forward;
    }
}