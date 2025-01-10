package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력 폼 페이지에서 method="post" 인 경우
		// 데이터를 처리하는 메서드.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 1단계 : Ex03.jsp 페이지에서 넘어온 데이터들을 받아주어야 한다.
		String member_id = request.getParameter("memid").trim();
		String member_pwd = request.getParameter("mempwd").trim();
		String member_name = request.getParameter("memname").trim();
		String member_phone = request.getParameter("memphone").trim();
		String member_addr = request.getParameter("memaddr").trim();
		
		// 여러 개의 데이터가 저장되어 배열로 넘어오는 경우
		String[] hobbys = request.getParameterValues("hobby");
		
		
		// 2단계 : 웹 브라우저에 요청한 결과를 보여주자.
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<div align='center'>");
				
		out.println("<h2>회원 정보</h2>");
		out.println("<table border='1'>");
				
		out.println("<tr>");
		out.println("<th>회원 아이디</th>");
		out.println("<td>" + member_id + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>회원 비밀번호</th>");
		out.println("<td>" + member_pwd + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>회원 이름</th>");
		out.println("<td>" + member_name + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>회원 연락처</th>");
		out.println("<td>" + member_phone + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>회원 주소</th>");
		out.println("<td>" + member_addr + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>회원 취미</th>");
		out.println("<td>");
		
		for(int i=0; i<hobbys.length; i++) {
			out.println(hobbys[i] + "&nbsp;&nbsp;");
		}
		
		out.println("</td>");
		out.println("</tr>");
		
		out.println("</table>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
