package com.reply.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get 방식으로 넘어온 글번호에 해당하는 게시글을
		// jsp_bbs 테이블에서 조회하여 게시글의 상세내역을
		// 답변 글 폼 페이지(view page)로 이동시키는 비지니스 로직.
		
		int bbs_no = 
			Integer.parseInt(request.getParameter("no").trim());
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		ReplyDTO cont = dao.getBbsContent(bbs_no);
		
		request.setAttribute("Reply", cont);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("views/bbs_reply.jsp");
	
		
		return forward;
	}

}
