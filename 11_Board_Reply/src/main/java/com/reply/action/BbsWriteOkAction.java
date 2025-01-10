package com.reply.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 글쓰기 폼 페이지에서 넘어온 데이터들을 받아서
		// jsp_bbs 테이블에 저장하는 비지니스 로직.
		
		String bbs_writer = request.getParameter("writer").trim();
		
		String bbs_title = request.getParameter("title").trim();
		
		String bbs_cont = request.getParameter("cont").trim();
		
		String bbs_pwd = request.getParameter("pwd").trim();
		
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBoard_writer(bbs_writer);
		dto.setBoard_title(bbs_title);
		dto.setBoard_cont(bbs_cont);
		dto.setBoard_pwd(bbs_pwd);
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		int chk = dao.insertBbs(dto);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(chk > 0) {
			// 게시글 추가가 성공한 경우
			forward.setRedirect(true);
			forward.setPath("bbs_list.go");
			
		}else {
			// 게시글 추가가 실패한 경우
			out.println("<script>");
			out.println("alert('게시글 추가 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
