package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/adder")
public class AdderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AdderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Ex04.jsp 페이지에서 넘어온 데이터들을 받아 주자.
		int num1=Integer.parseInt(request.getParameter("num1"));
		int num2=Integer.parseInt(request.getParameter("num2"));
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out= response.getWriter();
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<div align='center'>");
		
		out.println("<h2> 두 수의 합: "+(num1+num2)+"</h2>");
		
		out.println("</div>");
		out.println("</body>");
		out.println("<html>");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
	}

}
