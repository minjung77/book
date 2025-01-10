package com.reply.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reply.model.ReplyDAO;

public class BbsDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 삭제 폼 페이지에서 넘어온 글 번호와 글 비밀번호를 가지고
		// jsp_bbs 테이블에서 해당 게시글을 삭제하는 비지니스 로직.
		
		String bbs_pwd = request.getParameter("pwd").trim();
		
		int bbs_no = 
			Integer.parseInt(request.getParameter("bbs_no").trim());
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		int chk = dao.deleteBbs(bbs_no, bbs_pwd);
		
		PrintWriter out = response.getWriter();
		
		if(chk > 0) {
			// 게시글 원글이 삭제된 경우
			out.println("<script>");
			out.println("alert('게시글 원글이 삭제 되었습니다.!!!')");
			out.println("location.href='bbs_list.go'");
			out.println("</script>");
		}else if(chk == -2) {
			// 댓글이 삭제된 경우
			out.println("<script>");
			out.println("alert('게시글 댓글이 삭제 되었습니다.!!!')");
			out.println("location.href='bbs_list.go'");
			out.println("</script>");
		}else if(chk == -1) {
			// 비밀번호가 틀린 경우
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인해 주세요.~~~')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return null;
	}

}
