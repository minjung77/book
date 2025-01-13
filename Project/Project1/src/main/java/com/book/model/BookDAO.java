package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {

	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체.
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs, rs1 = null;
	
	// 쿼리문을 저장할 변수
	String sql = null;
	
	
	// BookDAO 클래스를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로
	//        기본생성자의 접근제어자를 public 이 아니라
	//        private 으로 바꾸어 주어야 한다.
	//        즉, 외부에서는 직접적으로 기본생성자를 호출하지
	//        못하게 하는 방식이다.
	
	// 2단계 : BookDAO 클래스를 정적(static) 멤버로 
	//        선언을 해 주어야 한다.
	private static BookDAO instance;
	
	private BookDAO() {  }  // 기본 생성자
	
	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는
	//        getInstance() 메서드를 만들어서 해당 
	//        getInstance() 메서드를 외부에서 접근할 수 있도록
	//        해 주면 됨.
	public static BookDAO getInstance() {
		
		if(instance == null) {
			instance = new BookDAO();
		}
		
		return instance;
	}  // getInstance() 메서드 end
	
	
	// DB를 연동하는 작업을 진행하는 메서드.
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			// 자바의 네이밍 서비스(JNDI)애서 이름과 실제 객체를
			// 연결해 주는 개념이 Context 객체이며, InitialContext
			// 객체는 네이밍 서비스를 이용하기 위한 시작점이 됨.
			Context initCtx = new InitialContext();
			
			// 2단계 : Context 객체를 얻어와야 함.
			// "java:comp/env" 라는 이름의 인수로 Context 객체를
			// 얻어옴. "java:comp/env"는 현재 웹 애플리케이션에서
			// 네이밍 서비스를 이용 시 루트 디렉토리라고 생각하면 됨.
			// 즉, 현재 웹 애플리케이션이 사용할 수 있는 모든 자원은
			// "java:comp/env" 아래에 위치를 하게 됨.
			Context ctx = 
				(Context)initCtx.lookup("java:comp/env");
			
			// 3단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을
			//        찾게 됨.
			// "java:comp/env" 아래에 위치한 "jdbc/myoracle"
			// 자원을 얻어옴, 이자원이 바로 데이터소스(커넥션풀)임.
			// 여기서 "jdbc/myoracle" 은 context.xml 파일에
			// 추가했던 <Resource> 태그 안에 있던 name 속성의 값임.
			DataSource ds = 
					(DataSource)ctx.lookup("jdbc/myoracle");
			
			// 4단계 : DataSource 객체를 이용하여 커넥션을
			//        하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  // openConn() 메서드 end
		
	
	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end
	
	
	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(
			PreparedStatement pstmt, Connection con) {
		
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end

	//관리자 - 책 저장 메서드
	public int insertBook(BookDTO dto) {
	    int result = 0;

	    System.err.println("책 정보 등록 진입 ::: "+ dto.getBook_id());
	    try {
	        openConn();
	        
	        sql = "insert into books (book_id, title, author, publisher, genre_id, description, price, publish_date, image_url, quantity, insertdate) " +
	              "values(?,?,?,?,?,?,?,?,?,?,sysdate)";
	        
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, dto.getBook_id());
	        pstmt.setString(2, dto.getTitle());
	        pstmt.setString(3, dto.getAuthor());
	        pstmt.setString(4, dto.getPublisher());
	        pstmt.setInt(5, dto.getGenre_id());
	        pstmt.setString(6, dto.getDescription());
	        pstmt.setInt(7, dto.getPrice());
	        
	        // 날짜 값은 java.sql.Date로 변환하여 설정
	        // publish_date가 String 형식이라면 java.sql.Date로 변환
	        String publishDateStr = dto.getPublish_date(); // 예: "2025-01-08"
	        pstmt.setDate(8, java.sql.Date.valueOf(publishDateStr)); // String -> Date로 변환
	        
	        pstmt.setString(9, dto.getImage_url());
	        pstmt.setInt(10, dto.getQuantity());
	        
	        result = pstmt.executeUpdate();
	    } catch (Exception e) {
	        System.err.println(e.getMessage());
	    } finally {
	        closeConn(pstmt, con);
	    }
	    return result;
	}


	//관리자 - 책 추가 페이지에 번호를 미리 보여주기 위함
	public int maxNumSearch() {
		int result = 0;
		try {
			openConn();
			
			sql = "select max(book_id) from books";
			 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = rs.getInt(1)+1;
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	//관리자 - 모든 책 검색
	public List<BookDTO> getBook() {
		List<BookDTO> list = new ArrayList<BookDTO>();
		
		try {
			openConn();
			
			sql = "select * from books";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_id(rs.getInt("book_id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setGenre_id(rs.getInt("genre_id"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setDescription(rs.getString("description"));
				dto.setPrice(rs.getInt("price"));
				dto.setPublish_date(rs.getString("publish_date"));
				dto.setImage_url(rs.getString("image_url"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setHit(rs.getInt("hit"));
				dto.setInsertdate(rs.getString("insertdate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.err.println("책 목록 출력 에러 ::: "+e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	//관리자 - 책 삭제
	public int deleteBook(int num) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "delete from books where book_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

}
