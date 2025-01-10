package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 페이지에서 넘어온 데이터에 한글이 있는 경우
		// 한글이 깨지는 현상이 발생함.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userId = request.getParameter("memid").trim();
		
		String userPwd = request.getParameter("mempwd").trim();
		
		String userName = request.getParameter("memname").trim();
		
		String userPhone = request.getParameter("memphone").trim();
		
		String userAddr = request.getParameter("memaddr").trim();
		
		// 웹 브라우저로 응답을 해 주면 됨.
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<div align='center'>");
		out.println("<h2>");
		out.println("회원 아이디 : " + userId + "<br>");
		out.println("회원 비밀번호 : " + userPwd + "<br>");
		out.println("회원 이름 : " + userName + "<br>");
		out.println("회원 연락처 : " + userPhone + "<br>");
		out.println("회원 아이디 : " + userAddr + "<br>");
		out.println("</h2>");
		out.println("</div>");
		
		out.println("</body>");
		out.println("</html>");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doGet(request, response);
	}

}
