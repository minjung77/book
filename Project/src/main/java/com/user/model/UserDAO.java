package com.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.book.model.BookDTO;

public class UserDAO {

	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체.
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs, rs1 = null;
	
	// 쿼리문을 저장할 변수
	String sql = null;
	
	
	// UserDAO 클래스를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식을 객체를 만들기 위해서는 우선적으로
	//        기본생성자의 접근제어자를 public 이 아니라
	//        private 으로 바꾸어 주어야 한다.
	//        즉, 외부에서는 직접적으로 기본생성자를 호출하지
	//        못하게 하는 방식이다.
	
	// 2단계 : UserDAO 클래스를 정적(static) 멤버로 
	//        선언을 해 주어야 한다.
	private static UserDAO instance;
	
	private UserDAO() {  }  // 기본 생성자
	
	// 3단계 : 기본생성자 대신에 싱글턴 객체를 return 해 주는
	//        getInstance() 메서드를 만들어서 해당 
	//        getInstance() 메서드를 외부에서 접근할 수 있도록
	//        해 주면 됨.
	public static UserDAO getInstance() {
		
		if(instance == null) {
			instance = new UserDAO();
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
	

	// 로그인 메서드
	public UserDTO login(String user_id, String user_pwd) {
		
			openConn();
		
			UserDTO dto=null;
		
		try {
			sql="select * from users where user_id=? and password=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				dto= new UserDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
				dto.setAddress(rs.getString("address"));
				dto.setPhone(rs.getString("phone"));
				dto.setGrade(rs.getInt("grade"));
				dto.setMoney(rs.getInt("money"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}
	
	// 회원가입 하는 메서드
	public boolean registerUser(UserDTO user) {
		
		Boolean result= false;
		
		openConn();
		
		 sql = "INSERT INTO users (user_id, user_name, password, email, phone, address, grade, money) "
                 + "VALUES (?, ?, ?, ?, ?, ?, 1, 0)";
		
		 try {
			pstmt=con.prepareStatement(sql);
			
			  // PreparedStatement에 값 설정
            pstmt.setString(1, user.getUser_id());
            pstmt.setString(2, user.getUser_name());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getAddress());
            
            int resultCount = pstmt.executeUpdate();

            // 결과 확인
            if (resultCount > 0) {
                result = true; // 성공
            }
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(pstmt, con);
		} return result;
	}
	// 아이디 중복 체크 메서드
	public boolean checkUserIdExists(String userId) {
	    boolean exists = false;
	    int count = 0;

	    try {
	        openConn();
	        String sql = "SELECT COUNT(*) FROM users WHERE user_id = ?";
	        pstmt = con.prepareStatement(sql);  // pstmt 초기화
	        pstmt.setString(1, userId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1);
	            if (count > 0) {
	                exists = true; // 중복 아이디 존재
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        closeConn(rs, pstmt, con);
	    }
	    return exists;
	}
	//  회원 정보 변경 메서드
	public int updateUserInfo(UserDTO dto) {
	    int result = 0;
	    
	    try {
	        openConn();
	        
	        String sql = "UPDATE users SET user_name = ?, password = ?, email = ?, phone = ? WHERE user_id = ?";
	        
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, dto.getUser_name());
	        
	        // 비밀번호가 null이 아니면 업데이트, null이면 기존 비밀번호 유지
	        if (dto.getPassword() != null) {
	            pstmt.setString(2, dto.getPassword());
	        } else {
	            pstmt.setNull(2, java.sql.Types.VARCHAR); // 비밀번호 업데이트 안 함
	        }
	        
	        // 파라미터 바인딩
	        
	        pstmt.setString(3, dto.getEmail());
	        pstmt.setString(4, dto.getPhone());
	        pstmt.setString(5, dto.getUser_id());
	        
	        System.out.println(dto.getEmail()+"/"+dto.getPhone()+"/"+dto.getUser_id()+"/"+dto.getUser_name()+"/"+dto.getPassword());
	        
	        result = pstmt.executeUpdate();
	        
	        
	        
	    } catch (SQLException e) {
	    	System.err.println("회원 수정 에러 :: " + e.getMessage());
	        // 예외 로그 기록 (로그 파일을 사용하는 경우)
	        e.printStackTrace();  // 개발 중에는 이 방법 사용
	    } finally {
	        // 리소스 닫기
	        closeConn(pstmt, con);
	    }
	    System.out.println("result 값 ::: " + result);
	    return result;
	}
	// 회원 수정 메서드
	public int deleteUser(String userId) {
	    openConn();  // 데이터베이스 연결을 시작

	    int result = 0;

	    try {
	        String sql = "DELETE FROM users WHERE user_id = ?";
	        
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, userId);  // userId를 바인딩
	        result = pstmt.executeUpdate();  // 실행 후 영향을 받은 행 수 반환
	    } catch (Exception e) {
	        e.printStackTrace();  // 예외 처리
	    } finally {
	        closeConn(pstmt, con);  // 리소스 정리
	    }

	    return result;  // 삭제된 행 수 반환
	}
	

	

	//한 페이징 처리에 해당하는 회원 목록 조회
	public List<UserDTO> getUsers(int page, int rowsize) {

		List<UserDTO> list = new ArrayList<UserDTO>();
		
		int startNo=(page*rowsize)-(rowsize-1);
		int endNo = (page*rowsize);
		System.out.println("사용자 페이지 번호 ::: "+startNo + " / " + endNo);
		 try {
			openConn();
			
			sql = "select * from ("
					+ "    select row_number() over(order by user_id desc) as rnum, u.* from users u"
					+ ")"
					+ "where rnum between ? and ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setPassword(rs.getString("password"));
				dto.setPhone(rs.getString("phone"));
				dto.setGrade(rs.getInt("grade"));
				dto.setMoney(rs.getInt("money"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.err.println("관리자_회원목록 조회 에러::: " + e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	//현재 페이지에 해당하는 사용자 목록
	public int getUserCount() {
		int result = 0;
		try {
			openConn();

			sql = "select count(*) from users";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.err.println("전체 회원 목록 수 조회 에러"+e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	//관리자 - 회원 삭제
	public int deleteBook(String user_id) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "delete from users where user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("회원 삭제 에러 ::: "+e.getMessage());
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	//관리자 - 사용자 수정 
	public int updateUser(UserDTO dto) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "update users set user_name=?, email=?,password=?,address=?,phone=?,money=? where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getPhone());
			pstmt.setInt(6, dto.getMoney());
			pstmt.setString(7, dto.getUser_id());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("사용자 수정 에러 ::: " + e.getMessage());
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	//관리자 페이지 - 회원 검색
	public List<UserDTO> searchUserList(String field, String keyword) {
		List<UserDTO> list = new ArrayList<UserDTO>();
		
		try {
			openConn();
			sql = "select * from users";

			if(field.equals("user_name")) {//검색 대상이 제목
				sql += " where user_name like ?";
			}else if(field.equals("user_id")) {//검색 대상이 줄거리
				sql += " where user_id like ?";
			}else if(field.equals("addr")) {//검색 대상이 저자
				sql += " where address like ?";
			}
			
			sql += "order by user_id desc";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setPassword(rs.getString("password"));
				dto.setPhone(rs.getString("phone"));
				dto.setGrade(rs.getInt("grade"));
				dto.setMoney(rs.getInt("money"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.err.println("사용자 검색 에러 ::: " + e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	//사용자가 담은 물건 장바구니 테이블에 추가
	public int addCart(CartDTO dto) {
		int result=0,count=0;
		
		try {
			openConn();
			
			sql = "select max(cart_id) from cart";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1)+1;
			}
			sql = "insert into cart values(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getUser_id());
			pstmt.setInt(3, dto.getBook_id());
			pstmt.setInt(4, dto.getQuantity());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("장바구니 담기 에러 ::: " + e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	//사용자 - 장바구니 목록 조회
	public List<CartDTO> getCart(String user_id) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		try {
			openConn();
			
			sql = "select c.cart_id a, b.title b, c.quantity c, b.price d, b.image_url e from "
					+ "cart c join books b on c.book_id=b.book_id where c.user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				
				dto.setCart_id(rs.getInt("a"));
				dto.setTitle(rs.getString("b"));
				dto.setQuantity(rs.getInt("c"));
				dto.setPrice(rs.getInt("d"));
				dto.setImage_url(rs.getString("e"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.err.println("장바구니 목록 조회 에러 :: " + e.getMessage());
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
}

