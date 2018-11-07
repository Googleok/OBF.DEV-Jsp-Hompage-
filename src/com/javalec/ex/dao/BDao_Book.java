package com.javalec.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import com.javalec.ex.dto.BDto_book;
import com.javalec.ex.dto.BDto_reply;

import sun.dc.pr.PRError;

public class BDao_Book {

	DataSource dataSource;
	
	public BDao_Book() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

	public void replyAction(String name, String reply, String bId) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into board_reply (name, reply, id) values (?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, reply);
			preparedStatement.setString(3, bId);
			
			
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	
	// 리스트 페이지에 보여줄 로직(페이징 처리)
		public ArrayList<BDto_book> getList(int startRow, int endRow) {
			Connection conn=null;
			PreparedStatement ppst=null;
			ResultSet rs=null;
			// 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
			String sql = "select * from "
					+ "(select rownum rn, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent, bkdescription, bkimage, blanguage from "
					+ "(select * from  book order by bGroup desc, bStep asc)) where rn between ? and ?";
			ArrayList<BDto_book> list = null;
			try {
				conn = dataSource.getConnection(); // 커넥션을 얻어옴
				ppst = conn.prepareStatement(sql); // sql 정의
				ppst.setInt(1, startRow); // sql 물음표에 값 매핑
				ppst.setInt(2, endRow);
				rs = ppst.executeQuery(); // sql 실행
				if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
					list = new ArrayList<>(); // list 객체 생성
					do {
						// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
						BDto_book dto = new BDto_book();
						dto.setbId(rs.getString("bId"));
						dto.setbName(rs.getString("bName"));
						dto.setbTitle(rs.getString("bTitle"));
						dto.setbDate(rs.getTimestamp("bDate"));
						dto.setbHit(rs.getInt("bHit"));
						dto.setbGroup(rs.getInt("bGroup"));
						dto.setbStep(rs.getInt("bStep"));
						dto.setbIndent(rs.getInt("bIndent"));
						dto.setDescription("bkdescription");
						dto.setImage("bkimage");
						dto.setLanguage(rs.getString("blanguage"));
						list.add(dto); // list에 0번 인덱스부터 board 객체의 참조값을 저장
						
					} while (rs.next());
				}System.out.println("test~~~~~");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return list; // list 반환
		}
		
		// 총 레코드 수 구하는 로직
		public int getCount(){
			int count = 0;
			Connection conn=null;
			PreparedStatement ppst=null;
			ResultSet rs=null;
			String sql = "select count(*) from book";
			try {
				conn = dataSource.getConnection();
				ppst = conn.prepareStatement(sql);
				rs = ppst.executeQuery();
				if(rs.next()){
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();                                                       
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return count; // 총 레코드 수 리턴
		}
		
		// 검색어와 일치하는 레코드 수를 구하는 로직
		public int getfCount(String sel, String find){
			int fCount = 0;
			Connection conn=null;
			PreparedStatement ppst=null;
			ResultSet rs=null;
			String sql = "select count(*) from book where " + sel + " like '%" + find + "%'";
			try {
				conn = dataSource.getConnection();
				ppst = conn.prepareStatement(sql);
				rs = ppst.executeQuery();
				if (rs.next()) {
					fCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();                                                       
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			System.out.println("fCount="+fCount);
			return fCount; // 총 레코드 수 리턴
		}
		
		// 리스트 페이지에 보여줄 검색 관련 로직(페이징 처리)
		public ArrayList<BDto_book> getfList(int startRow, int endRow, String sel, String find) {
			int fCount = 0;
			Connection conn=null;
			PreparedStatement ppst=null;
			ResultSet rs=null;
			
			// 검색 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
			String sql = "select * from "
					+ "(select rownum rn, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent, bkdescription, bkimage, blanguage from "
					+ "(select * from book where "+sel+" like '%"+find+"%' order by bGroup desc, bStep asc)) where rn between ? and ?";
			ArrayList<BDto_book> list = null;
			try {
				conn = dataSource.getConnection(); // 커넥션을 얻어옴
				ppst = conn.prepareStatement(sql); // sql 정의
				ppst.setInt(1, startRow); // sql 물음표에 값 매핑
				ppst.setInt(2, endRow);
				rs = ppst.executeQuery(); // sql 실행
				if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
					list = new ArrayList<>(); // list 객체 생성
					do {
						// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
						BDto_book dto = new BDto_book();
						dto.setbId(rs.getString("bId"));
						dto.setbName(rs.getString("bName"));
						dto.setbTitle(rs.getString("bTitle"));
						dto.setbDate(rs.getTimestamp("bDate"));
						dto.setbHit(rs.getInt("bHit"));
						dto.setbGroup(rs.getInt("bGroup"));
						dto.setbStep(rs.getInt("bStep"));
						dto.setbIndent(rs.getInt("bIndent"));
						dto.setDescription("bkdescription");
						dto.setImage("bkimage");
						dto.setLanguage(rs.getString("blanguage"));
						list.add(dto); // list에 0번 인덱스부터 board 객체의 참조값을 저장

					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();                                                       
					if(ppst != null) ppst.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}							 // DB 연결 종료 / Connection 반환
			}
			System.out.println("list="+list);
			return list; // list 반환
		}
	
		public ArrayList<BDto_book> list() {
			
			ArrayList<BDto_book> dtos = new ArrayList<BDto_book>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			try {
				connection = dataSource.getConnection();
				
				String query = "select bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from book order by bGroup desc, bStep asc";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					String bId = resultSet.getString("bId");
					String bName = resultSet.getString("bName");
					String bTitle = resultSet.getString("bTitle");
					String bContent = resultSet.getString("bContent");
					Timestamp bDate = resultSet.getTimestamp("bDate");
					int bHit = resultSet.getInt("bHit");
					int bGroup = resultSet.getInt("bGroup");
					int bStep = resultSet.getInt("bStep");
					int bIndent = resultSet.getInt("bIndent");
					
					BDto_book dto = new BDto_book(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
					dtos.add(dto);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace(); 
			} finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return dtos;
		}
		
		public ArrayList<BDto_reply> replyList(String Id) {
			
			ArrayList<BDto_reply> dtos = new ArrayList<BDto_reply>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			try {
				connection = dataSource.getConnection();
				
				String query = "select name, reply, id, bdate from board_reply where id=? order by bdate desc";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, Id);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					String bName = resultSet.getString("name");
					String bReply = resultSet.getString("reply");
					String bId = resultSet.getString("id");
					Timestamp bDate = resultSet.getTimestamp("bDate");
					
					BDto_reply dto = new BDto_reply(bName, bReply, bId, bDate);
					dtos.add(dto);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace(); 
			} finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return dtos;
		}
	
	
	public void write(String bName, String bTitle, String bContent, String bkcontet, String bkImage, String bLanguage) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into book (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent, bkdescription, bkimage, blanguage) values (book_seq.nextval, ?, ?, ?, 0, book_seq.currval, 0, 0, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setString(4, bkcontet);
			preparedStatement.setString(5, bkImage);
			preparedStatement.setString(6, bLanguage);
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	
	public BDto_book contentView(String strID) {
		// TODO Auto-generated method stub
		
		upHit(strID);
		
		BDto_book dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			connection = dataSource.getConnection();
			
			String query = "select * from book where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strID));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String bId = resultSet.getString("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");
				String description = resultSet.getString("bkdescription"); // 설명
				String image = resultSet.getString("bkimage");
				String language = resultSet.getString("blanguage");
				
				dto = new BDto_book(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent,
									description, image, language);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public void modify(String bId, String bName, String bTitle, String bContent) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "update book set bName = ?, bTitle = ?, bContent = ? where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setInt(4, Integer.parseInt(bId));
			int rn = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String bId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "delete from book where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(bId));
			int rn = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	public BDto_book reply_view(String str) {
		// TODO Auto-generated method stub
		BDto_book dto = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "select * from book where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(str));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String bId = resultSet.getString("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");
				
				dto = new BDto_book(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent) {
		// TODO Auto-generated method stub
		
		replyShape(bGroup, bStep);
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into book (bId, bName, bTitle, bContent, bGroup, bStep, bIndent) values (book_seq.nextval, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setInt(4, Integer.parseInt(bGroup));
			preparedStatement.setInt(5, Integer.parseInt(bStep) + 1);
			preparedStatement.setInt(6, Integer.parseInt(bIndent) + 1);
			
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	
	private void replyShape( String strGroup, String strStep) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update book set bStep = bStep + 1 where bGroup = ? and bStep > ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strGroup));
			preparedStatement.setInt(2, Integer.parseInt(strStep));
			
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	private void upHit( String bId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update book set bHit = bHit + 1 where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bId);
			
			int rn = preparedStatement.executeUpdate();
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	

}
