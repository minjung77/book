package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserLoginAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 사용자 입력값 받아오기
        String userId = request.getParameter("user_id");
        String password = request.getParameter("password");

        // 로그인 실패 시 처리할 메시지
        String errorMessage = "아이디나 비밀번호가 일치하지 않습니다.";

        // UserDAO 인스턴스를 통해 로그인 처리
        UserDAO dao = UserDAO.getInstance();
        UserDTO user = dao.login(userId, password);  // 로그인 메서드 호출

        ActionForward forward = new ActionForward();

        if (user != null) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // 메인 페이지로 이동
            forward.setRedirect(true);
            forward.setPath("user/MainPage.jsp"); // ContextPath는 FrontController에서 처리
        } else {
            // 로그인 실패 시 로그인 페이지로 이동 및 오류 메시지 설정
            request.setAttribute("errorMessage", errorMessage);
            forward.setRedirect(false);
            forward.setPath("user/login.jsp");
        }
        
        return forward;
    }
}
