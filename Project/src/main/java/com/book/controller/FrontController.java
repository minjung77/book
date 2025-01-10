package com.book.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		
		String path = request.getContextPath();
		
		String command = uri.substring(path.length() + 1);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties prop = new Properties();
		
		FileInputStream fis =
				new FileInputStream("C:\\Users\\admin\\Desktop\\Project\\src\\main\\java\\com\\book\\controller\\mapping.properties");
		
		prop.load(fis);
		
		String value = prop.getProperty(command);
		
		
		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = 
					new StringTokenizer(value, "|");
			
			String url_1 = st.nextToken();   // "execute"
			String url_2 = st.nextToken();   // "패키지명.클래스명"
			
			try {
				Class<?> url = Class.forName(url_2);
				
				
				Constructor<?> constructor = url.getConstructor();
				
				action = (Action)constructor.newInstance();
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {  // true 인 경우
				response.sendRedirect(forward.getPath());
			}else {  // false인 경우
				request.getRequestDispatcher(forward.getPath())
					.forward(request, response);
			}
		}
		
	}
}
