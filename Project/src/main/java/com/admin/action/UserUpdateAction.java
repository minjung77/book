package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//관리자 - 사용자 수정 
		
		int page = Integer.valueOf(request.getParameter("page"));
				
		String name = request.getParameter("name").trim();
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String addr = request.getParameter("addr").trim();
		String phone = request.getParameter("phone").trim();
		String email = request.getParameter("email").trim();
		int money = Integer.valueOf(request.getParameter("money").trim());
		
		
		UserDTO dto = new UserDTO();
		dto.setUser_name(name);
		dto.setUser_id(id);
		dto.setPassword(pwd);
		dto.setAddress(addr);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setMoney(money);
		
		UserDAO dao = UserDAO.getInstance();
		int chk = dao.updateUser(dto);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('회원 수정이 완료되었습니다.')");
			out.println("location.href='user_modify.go?page=" + page + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
