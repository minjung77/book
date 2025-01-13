package com.user.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserJoinAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 사용자 입력값 받아오기
        String userId = request.getParameter("memberId");
        String userName = request.getParameter("memberName");
        String password = request.getParameter("memberPw");
        String email = request.getParameter("memberEmail");
        String phone = request.getParameter("memberPhone");
        String address = request.getParameter("memberAddress");

        // UserDAO 인스턴스 생성
        UserDAO dao = UserDAO.getInstance();

        // 아이디 중복 체크
        boolean isIdExist = dao.checkUserIdExists(userId);
        ActionForward forward = new ActionForward();

        if (isIdExist) {
            // 아이디 중복 시 오류 메시지 설정
            request.setAttribute("errorMessage", "이미 사용 중인 아이디입니다.");
            forward.setRedirect(false);
            forward.setPath("user/joinForm.jsp"); // 회원가입 페이지로 이동
        } else {
            // UserDTO 객체에 사용자 정보 저장
            UserDTO user = new UserDTO();
            user.setUser_id(userId);
            user.setUser_name(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);

            // 회원가입 처리
            String errorMessage = "회원가입에 실패했습니다. 다시 시도해주세요.";
            boolean isSuccess = dao.registerUser(user); // 회원가입 메서드 호출

            if (isSuccess) {
                // 회원가입 성공 시 로그인 페이지로 이동
                forward.setRedirect(true);
                forward.setPath("user/login.jsp"); // 로그인 페이지로 리다이렉션
            } else {
                // 회원가입 실패 시 오류 메시지 설정
                request.setAttribute("errorMessage", errorMessage);
                forward.setRedirect(false);
                forward.setPath("user/joinForm.jsp"); // 회원가입 페이지로 이동
            }
        }

        return forward;
    }
}
