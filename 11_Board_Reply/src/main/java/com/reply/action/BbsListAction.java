package com.reply.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// jsp_bbs 테이블에 있는 전체 게시물 목록을
		// 조회하여 view page로 이동시키는 비지니스 로직.
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		List<ReplyDTO> list = dao.getBbsList();
		
		request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		System.out.println("bbslistaction 클래스 forward 주소값 >>> " + forward);
		
		forward.setRedirect(false);
		
		forward.setPath("views/bbs_list.jsp");
		
		return forward;
	}

}
