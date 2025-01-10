package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		System.out.println("id >>> " + userId);
		System.out.println("pwd >>> " + userPwd);
		
		// 클라이언트로 응답을 해 주어야 함.
		// 클라이언트에 응답 시 한글을 작성하게 되면
		// 한글이 깨져서 나오는 현상이 발생을 함.
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<h2>");
		out.println("입력한 아이디 : " + userId + "<br>");
		out.println("입력한 비밀번호 : " + userPwd + "<br>");
		out.println("</h2>");		
		out.println("</body>");
		out.println("</html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
	}

}
