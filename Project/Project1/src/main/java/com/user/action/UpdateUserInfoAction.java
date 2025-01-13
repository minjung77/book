package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UpdateUserInfoAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        // 폼에서 넘어오는 값들
        String memberId = request.getParameter("user_id");
        String memberName = request.getParameter("memberName");
        String memberPw = request.getParameter("memberPw");
        String memberEmail = request.getParameter("memberEmail");
        String memberPhone = request.getParameter("memberPhone");

        // UserDTO 객체 생성
        UserDTO dto = new UserDTO();
        dto.setUser_id(memberId);
        dto.setUser_name(memberName);
        dto.setEmail(memberEmail);
        dto.setPhone(memberPhone);

        // 비밀번호 수정 여부 체크
        if (memberPw != null && !memberPw.trim().isEmpty()) {
            dto.setPassword(memberPw); // 비밀번호를 입력한 경우만 업데이트
        }
        // 비밀번호를 입력하지 않으면 기존 비밀번호는 그대로 유지함

        // 데이터베이스 업데이트
        UserDAO dao = UserDAO.getInstance();
        int chk = dao.updateUserInfo(dto); // updateUserInfo 메서드 호출

        // ActionForward 객체 생성
        ActionForward forward = new ActionForward();

        // 성공 시
        if (chk > 0) {
            // 세션 갱신
            request.getSession().setAttribute("user", dto); // 수정된 정보로 세션 갱신

            // mypage.go로 리디렉션
            forward.setRedirect(true);
            forward.setPath("user/mypage.jsp"); // 수정 후 마이페이지로 이동
        } else {
            // 실패 시 수정 페이지로 포워딩
            forward.setRedirect(false);
            forward.setPath("user/updatePage.jsp"); // 실패 시 다시 수정 페이지로 이동
        }

        return forward;
    }
}
