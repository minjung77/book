package com.reply.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;
import com.reply.model.ReplyDTO;

public class BbsModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 데이터들을 받아서
		// jsp_bbs 테이블에서 수정하는 비지니스 로직.
		
		String bbs_writer = request.getParameter("writer").trim();
		
		String bbs_title = request.getParameter("title").trim();
		
		String bbs_cont = request.getParameter("cont").trim();
		
		String bbs_pwd = request.getParameter("pwd").trim();
		
		int bbs_no = 
			Integer.parseInt(request.getParameter("bbs_no").trim());
		
		ReplyDTO dto = new ReplyDTO();
		
		dto.setBoard_no(bbs_no);
		dto.setBoard_title(bbs_title);
		dto.setBoard_cont(bbs_cont);
		dto.setBoard_pwd(bbs_pwd);
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		int chk = dao.updateBbs(dto);
		
		PrintWriter out = response.getWriter();
		
		if(chk > 0) {
			out.println("<script>");
			out.println("alert('게시글 수정 성공!!!')");
			out.println("location.href='bbs_content.go?no="+bbs_no+"'");
			out.println("</script>");
			
		}else if(chk == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인 요망~~~')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return null;
	}

}
