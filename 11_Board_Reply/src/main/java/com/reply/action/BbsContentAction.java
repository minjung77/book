package com.reply.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 글번호에 해당하는 게시글을
		// jsp_bbs 테이블에서 조회하여 해당 게시글의 상세내역을
		// view page로 이동시키는 비지니스 로직.
		
		int board_no =
			Integer.parseInt(request.getParameter("no").trim());
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		// 게시글 번호에 해당하는 게시글의 조회수를
		// 증가시켜 주는 메서드 호출.
		dao.bbsReadCount(board_no);
		
		// 글번호에 해당하는 게시글의 상세내역을
		// 조회하는 메서드 호출.
		ReplyDTO content = dao.getBbsContent(board_no);
		
		request.setAttribute("Cont", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("views/bbs_content.jsp");
		
		return forward;
		
	}

}
