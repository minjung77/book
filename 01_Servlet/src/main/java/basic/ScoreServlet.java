package basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ScoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String student_name=request.getParameter("name").trim();
		
		String student_kor=request.getParameter("kor").trim();
		
		String student_eng=request.getParameter("eng").trim();
		
		String student_mat=request.getParameter("mat").trim();
		
		int kor=Integer.parseInt(request.getParameter("kor"));
		int eng=Integer.parseInt(request.getParameter("eng"));
		int mat=Integer.parseInt(request.getParameter("mat"));
		
		int total= kor+eng+mat;
		
		double avg= total/3.0;
		
		
		
		 // 평균에 따른 학점 계산
        String grade;
        if (avg >= 90) {
            grade = "A학점";
        } else if (avg >= 85) {
            grade = "B학점";
        } else if (avg >= 80) {
            grade = "C학점";
        } else if (avg >= 75) {
            grade = "D학점";
        } else {
            grade = "F학점";
        }
        
        // switch((int)(avg /10)){
        // case 10:
        // case 9:
        // 			grade="A학점"
        // 			break;
        // case 5 : 
        // 			grade="B학점"
        // 			break;
        // default : 
        // 			grade="F학점";
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		PrintWriter out= response.getWriter();
		
		out.println("<html>");
		out.println("<head></head>");
		out.println("<body>");
		out.println("<div align='center'>");
		out.println("<table border='1'>");

		out.println("<tr>");
		out.println("<th>학생 이름</th>");
		out.println("<td>" + student_name + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>국어 점수</th>");
		out.println("<td>" + student_kor + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>영어 점수</th>");
		out.println("<td>" + student_eng + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>수학 점수</th>");
		out.println("<td>" + student_mat + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>점수 총점</th>");
		out.println("<td>" + total + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>점수 평균</th>");
		out.println("<td>" + String.format("%.2f점",avg) + "</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<th>학  점 </th>");
		out.println("<td>" + grade + "</td>");
		out.println("</tr>");

		out.println("</table>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");


}
}
