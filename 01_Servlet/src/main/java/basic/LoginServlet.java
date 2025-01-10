package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form 태그에 method="get" 인 경우나
		// method 속성이 생략된 경우에는 doGet() 메서드에서 처리.
		
		/*
		 * request 매개변수
		 * - 사용자(클라이언트)의 요청에 대한 정보를 처리.
		 * - 클라이언트로부터 Servlet으로 요청이 들어오게 되면
		 *   요청 파라미터라는 것이 같이 오게 되는데, 이것에 대한
		 *   분석은 request.getParameter() 라는 메서드를
		 *   이용하여 파악을 하게 됨.
		 *   
		 * response 매개변수
		 * - 사용자의 요청 정보에 대한 처리 결과를 클라이언트에
		 *   응답하여 처리.
		 * - 요청을 파악했다면 클라이언트로 내보낼 응답을 작성해야 함.
		 *   대부분의 웹 프로그래밍은 응답을 텍스트로 작성하며, 이 텍스트는
		 *   대부분은 HTML 페이지의 모양을 하고 있게 됨.
		 * - 여기서의 응답은 텍스트를 기록해야 하는데, 이 때 스트림이라는
		 *   개념을 이용하여 기록을 하게 됨. 말 그대로 데이터의 흐름이라고
		 *   생각하면 됨.
		 *   Servlet에서는 클라이언트 쪽으로 보내는 데이터의 흐름을
		 *   건드려야 할 필요가 있게 됨.
		 * - response 인자를 활용하면 응답과 관련된 많은 작업들을
		 *   할 수 있음. 응답 스트림에 텍스트를 기록하는 것도 가능함.
		 *   이 작업을 하기 위해서는 response.getWriter() 라는
		 *   메서드를 사용해야 함. 해당 메서드를 이용하여 응답으로 내보낼
		 *   출력 스트림을 얻어낸 후에 출력 스트림에 텍스트를 기록하면 됨.   
		 */
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
	}

}
