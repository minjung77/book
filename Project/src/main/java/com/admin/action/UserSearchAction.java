package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.user.model.UserDAO;
import com.user.model.UserDTO;

public class UserSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원 목록 조회 & 페이징 처리
		System.out.println("사용자 페이지 처리");
		//페이징 처리
		int rowsize = 10;
		int block = 5;
		int totalRecode = 0;
		int allPage = 0;
		int page = 0;

		if(request.getParameter("page")!=null) {//페이지 값이 0이라면 
			page = Integer.valueOf(request.getParameter("page"));
		}else {
			page = 1;
		}
		int startNo=(page*rowsize)-(rowsize-1);
		int endNo = (page*rowsize);
		int startBlock = (((page-1)/block) * block) + 1;
		int endBlock = (((page-1)/block) * block) + block;
		
		UserDAO dao = UserDAO.getInstance();
		
		//전체 게시물의 수를 확인.
		totalRecode = dao.getUserCount();
		allPage = (int)Math.ceil(totalRecode/(double)rowsize);
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		//현재 페이지에 해당하는 회원 목록을 가져옴
		List<UserDTO> list = dao.getUsers(page, rowsize);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecode", totalRecode);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		
		//회원 목록 바인딩
		request.setAttribute("userList", list);
		
		ActionForward f = new ActionForward();
		
		f.setRedirect(false);
		f.setPath("/admin/user_modify.jsp");
		
		return f;
	}

}
