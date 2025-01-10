package com.reply.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 답변글 폼 페이지에서 넘어온 데이터들을 받아서
		// jsp_bbs 테이블의 답변글로 저장시키는 비지니스 로직.
		
		String reply_writer = request.getParameter("reply_writer").trim();
		
		String reply_title = request.getParameter("reply_title").trim();
		
		String reply_cont = request.getParameter("reply_cont").trim();
		
		String reply_pwd = request.getParameter("reply_pwd").trim();
		
		// type="hidden"으로 넘어온 데이터들도 받아주어야 한다.
		int bbs_no =
			Integer.parseInt(request.getParameter("bbs_no").trim());
		
		int bbs_group =
			Integer.parseInt(request.getParameter("group").trim());
		
		int bbs_step =
			Integer.parseInt(request.getParameter("step").trim());
		
		int bbs_indent =
			Integer.parseInt(request.getParameter("indent").trim());
		
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBoard_no(bbs_no);
		dto.setBoard_writer(reply_writer);
		dto.setBoard_title(reply_title);
		dto.setBoard_cont(reply_cont);
		dto.setBoard_pwd(reply_pwd);
		dto.setBoard_group(bbs_group);
		dto.setBoard_step(bbs_step);
		dto.setBoard_indent(bbs_indent);
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		// 만약에 원글에 답변글이 존재하는 경우
		// 해당 답변글의 step을 하나 증가시켜 주는 메서드 호출.
		dao.replyUpdate(bbs_group, bbs_step);
		
		// 답변글을 jsp_bbs 테이블에 저장시키는 메서드 호출.
		int chk = dao.replyBbs(dto);
		
		PrintWriter out = response.getWriter();
		
		if(chk > 0) {
			out.println("<script>");
			out.println("alert('답변 글 등록 성공!!!')");
			out.println("location.href='bbs_list.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('답변 글 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return null;
	}

}
