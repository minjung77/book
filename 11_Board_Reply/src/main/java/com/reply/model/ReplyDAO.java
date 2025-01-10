package com.reply.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReplyDAO {

	// DB와 연결하는 객체
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체.
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과값을 가지고 있는 객체.
	ResultSet rs = null;
	
	// SQL문을 저장할 변수.
	String sql = null;
	
	
	// ReplyDAO 클래스를 싱글턴 방식으로 만들어 보자.
	// 1단계 : ReplyDAO 클래스를 정적(static) 멤버로
	//        선언을 해 주어야 한다.
	private static ReplyDAO instance = null;
	
	// 2단계 : 싱글턴 방식으로 객체를 만들기 위해서는
	//        기본생성자의 접근지정자를 public 에서
	//        private 으로 변경해 주어야 함.
	//        즉, 외부에서 직접적으로 기본생성자에 접근하여
	//        객체를 생성하거나 호출하지 못 하도록 해야 함.
	private ReplyDAO() {  }   // 기본 생성자
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return해 주는
	//        getInstance() 라는 메서드를 만들어서 해당
	//        getInstance() 메서드를 외부에서 접근이 가능하도록
	//        해 주면 됨.
	public static ReplyDAO getInstance() {
		
		if(instance == null) {
			instance = new ReplyDAO();
		}
		
		return instance;
	}  // getInstance() 메서드 end
	
	
	// DB 연동 작업을 하는 메서드.
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성.
			// 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를
			// 연결해 주는 개념이 Context 객체이며, InitialContext
			// 객체는 네이밍 서비스를 이용하기 위한 시작점이 됨.
			Context init = new InitialContext();
			
			// 2단계 : Context 라는 객체를 얻어와야 함.
			// "java:comp/env" 라는 이름의 인수로 Context 객체를
			// 얻어옴. "java:comp/env"는 현재 웹 애플리케이션에서
			// 네이밍 서비스를 이용 시 루트 디렉토리라고 생각하면 됨.
			// 즉, 현재 웹 애플리케이션이 사용할 수 있는 모든 자원은
			// "java:comp/env" 아래에 위치하게 됨.
			Context ctx = (Context)init.lookup("java:comp/env");
			
			// 3단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을
			//        찾게 됨.
			// "java:comp/env" 아래에 위치한 "jdbc/myoracle" 이라는
			// 자원을 얻어오게 됨. 이 자원이 바로 데이터소스(커넥션풀)임.
			// 여기서 "jdbc/myoracle"은 context.xml 파일에
			// 추가했던 <Resource> 태그 안에 있던 name 속성의 값임.
			DataSource ds = (DataSource)ctx.lookup("jdbc/myoracle");
			
			// 4단계 : DataSource 객체를 이용하여 커넥션을
			//        하나 가져오면 됨.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}  // openConn() 메서드 end
	
	
	// DB에 연결되어 있던 자원 종료하기.
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
		try {
			
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close(); }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}  // closeConn() 메서드 end
	
	
	// DB에 연결되어 있던 자원 종료하기.
	public void closeConn(
			PreparedStatement pstmt, Connection con) {
		
		try {
			
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close(); }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}  // closeConn() 메서드 end
	
	
	// jsp_bbs 테이블의 전체 게시물을 조회하는 메서드.
	public List<ReplyDTO> getBbsList() {
		
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		
		
		try {
			openConn();
			
			sql = "select * from jsp_bbs "
					+ " order by board_group desc, "
					+ " board_step";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReplyDTO dto = new ReplyDTO();
				
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				dto.setBoard_group(rs.getInt("board_group"));
				dto.setBoard_step(rs.getInt("board_step"));
				dto.setBoard_indent(rs.getInt("board_indent"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}  // getBbsList() 메서드 end
	
	
	// jsp_bbs 테이블에 게시글을 추가하는 메서드.
	public int insertBbs(ReplyDTO dto) {
		
		int result = 0, count = 0;
		
		
		try {
			openConn();
			
			sql = "select max(board_no) from jsp_bbs";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into jsp_bbs values("
					+ " ?, ?, ?, ?, ?, default, "
					+ " sysdate, '', ?, 0, 0)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getBoard_writer());
			pstmt.setString(3, dto.getBoard_title());
			pstmt.setString(4, dto.getBoard_cont());
			pstmt.setString(5, dto.getBoard_pwd());
			pstmt.setInt(6, count);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // insertBbs() 메서드 end
	
	
	// jsp_bbs 테이블의 게시글 번호에 해당하는
	// 게시글의 조회수를 증가시켜주는 메서드.
	public void bbsReadCount(int no) {
		
		
		try {
			openConn();
			
			sql = "update jsp_bbs set "
					+ " board_hit = board_hit + 1 "
					+ " where board_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(pstmt, con);
		}
		
	}  // bbsReadCount() 메서드 end
	
	
	// jsp_bbs 테이블에서 게시글 번호에 해당하는
	// 게시글의 상세내역을 조회하는 메서드.
	public ReplyDTO getBbsContent(int no) {
		
		ReplyDTO dto = null;
		
		
		try {
			openConn();
			
			sql = "select * from jsp_bbs "
					+ " where board_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ReplyDTO();
				
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));
				dto.setBoard_group(rs.getInt("board_group"));
				dto.setBoard_step(rs.getInt("board_step"));
				dto.setBoard_indent(rs.getInt("board_indent"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}  // getBbsContent() 메서드 end
	
	
	// jsp_bbs 테이블 게시판에 원글에 대한 답변글이 존재하는 경우
	// 답변 글의 step을 하나 증가시켜 주는 메서드.
	public void replyUpdate(int group, int step) {
		
		
		try {
			openConn();
			
			sql = "update jsp_bbs set "
					+ " board_step = board_step + 1 "
					+ " where board_group = ? "
					+ " and board_step > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, group);
			pstmt.setInt(2, step);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(pstmt, con);
		}
		
	}  // replyUpdate() 메서드 end
	
	
	// jsp_bbs 테이블에 답변글을 추가하는 메서드.
	public int replyBbs(ReplyDTO dto) {
		
		int result = 0, count = 0;
		
		
		try {
			openConn();
			
			sql = "select max(board_no) "
					+ " from jsp_bbs";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1) + 1;
			}
			
			
			sql = "insert into jsp_bbs "
					+ " values(?, ?, ?, ?, ?, default, "
					+ " sysdate, '', ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getBoard_writer());
			pstmt.setString(3, dto.getBoard_title());
			pstmt.setString(4, dto.getBoard_cont());
			pstmt.setString(5, dto.getBoard_pwd());
			pstmt.setInt(6, dto.getBoard_group());
			pstmt.setInt(7, dto.getBoard_step() + 1);
			pstmt.setInt(8, dto.getBoard_indent() + 1);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // replyBbs() 메서드 end
	
	
	// jsp_bbs 테이블에서 게시글을 삭제하는 메서드.
	public int deleteBbs(int no, String pwd) {
		
		int result = 0;
		
		
		try {
			openConn();
			
			sql = "select * from jsp_bbs "
					+ " where board_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(pwd.equals(rs.getString("board_pwd"))) {
					// 비밀번호가 일치하는 경우
					if(rs.getInt("board_step") == 0) {
						// 원글인 경우
						sql = "update jsp_bbs set "
								+ " board_title = ?, "
								+ " board_cont = ? "
								+ " where board_no = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, "[원글] 삭제된 게시글");
						pstmt.setString(2, "삭제된 게시글입니다.");
						pstmt.setInt(3, no);
						
						result = pstmt.executeUpdate();
						
					}else if(rs.getInt("board_step") > 0) {
						// 댓글인 경우
						sql = "delete from jsp_bbs "
								+ " where board_no = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, no);
						
						pstmt.executeUpdate();
						
						// 글번호 재작업이 진행되어야 함.
						sql = "update jsp_bbs set "
								+ " board_no = board_no - 1 "
								+ " where board_no > ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, no);
						
						pstmt.executeUpdate();
						
						sql = "update jsp_bbs set "
								+ " board_group = board_group - 1, "
								+ " board_step = board_step - 1 "
								+ " where board_group = ? "
								+ " and board_step > ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, rs.getInt("board_group"));
						pstmt.setInt(2, rs.getInt("board_step"));
						
						pstmt.executeUpdate();
						
						result = -2;
						
					}
				}else {
					// 비밀번호가 틀린 경우.
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // deleteBbs() 메서드 end
	
	
	// jsp_bbs 테이블의 글번호에 해당하는
	// 게시글을 수정하는 메서드.
	public int updateBbs(ReplyDTO dto) {
		
		int result = 0;
		
		
		try {
			openConn();
			
			sql = "select * from jsp_bbs where board_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getBoard_no());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(dto.getBoard_pwd().equals(rs.getString("board_pwd"))) {
					
					sql = "update jsp_bbs set "
							+ " board_title = ?, "
							+ " board_cont = ?, "
							+ " board_update = sysdate "
							+ " where board_no = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getBoard_title());
					pstmt.setString(2, dto.getBoard_cont());
					pstmt.setInt(3, dto.getBoard_no());
					
					result = pstmt.executeUpdate();
					
				}else {
					// 비밀번호가 틀린 경우.
					result = -1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // updateBbs() 메서드 end
	
}
