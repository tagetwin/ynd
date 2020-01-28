package com.cos.board.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cos.board.DB.DBUtil;
import com.cos.board.Model.Board;
import com.cos.board.Model.Comment;
import com.cos.board.Model.User;
import com.cos.board.viewmodel.BoardUserVM;

// User Test
public class CommentDao {

	// 싱글톤 패턴
	// 생성자 만들기
	private CommentDao() {
	}

	private static CommentDao instance = new CommentDao();

	public static CommentDao getInstance() {
		return instance;
	}

	public int save(int id, String comment, int userId) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO comment (id, comment, userId, commentTIme) VALUES (?, ?, ?, now())";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, id);
			pstmt.setString(2, comment);
			pstmt.setInt(3, userId);
			
			// 4. SQL문 전송하기
			// pstmt.executeQuery();
			int result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return -1;
	}

	public int update(String boardTitle, String content, String category, String fileName, int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "UPDATE board SET boardTitle = ?, content = ?, category = ?, fileName = ? WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, content);
			pstmt.setString(3, category);
			pstmt.setString(4, fileName);
			pstmt.setInt(5, id);

			// 4. SQL문 전송하기
			// pstmt.executeQuery();
			int result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public int delete(int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "DELETE FROM board WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, id);

			// 4. SQL문 전송하기
			// pstmt.executeQuery();
			int result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int deleteAll(int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "DELETE FROM board WHERE userId = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, id);

			// 4. SQL문 전송하기
			// pstmt.executeQuery();
			int result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public List<Comment> findAll() {
		// 0. 컬렉션 만들기
		List<Comment> comments = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM comment ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String comment = rs.getString("comment");
				int userId = rs.getInt("userId");
				Timestamp commentTime = rs.getTimestamp("commentTime");
				
				Comment comment1 = Comment.builder()
						.id(id)
						.comment(comment)
						.userId(userId)
						.commentTime(commentTime)
						.build();
				
				comments.add(comment1);
				
			}

			return comments;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public BoardUserVM findById(int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT b.id, b.boardTitle, b.content, b.boardCreateTime, b.userId, b.fileName, b.category, u.username");
			sb.append(" FROM board b inner join user u");
			sb.append(" ON b.userid = u.id");
			sb.append(" WHERE b.id =?"); // 세미콜론 절대 금지, 끝에 띄어쓰기

			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = sb.toString();
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, id);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			BoardUserVM buVM = null;
			if (rs.next()) {
				String boardTitle = rs.getString("b.boardTitle");
				String content = rs.getString("b.content");
				String category = rs.getString("category");				
				Timestamp boardCreateTime = rs.getTimestamp("b.boardCreateTime");
				int userId = rs.getInt("b.userId");
				String username = rs.getString("u.username");
				String fileName = rs.getString("b.fileName");

				// Board Builder
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.category(category)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();

				// User Builder
				User user = User.builder()
						.id(userId)
						.username(username)
						.build();

				buVM = new BoardUserVM(board, user);
			}
			return buVM;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findRecent() {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT id, boardtitle, left(content,30) content, userId, boardCreateTime, fileName FROM board ORDER BY id DESC LIMIT 3";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
				
				boards.add(board);
			}
			return boards;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findByTitle(String boardTitle) {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM board WHERE boardTitle like '%"+boardTitle+"%' ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
//			pstmt.setString(1, boardTitle);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
			
				boards.add(board);
			}
			return boards;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findByReview() {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM board WHERE category = ?  ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, "review");
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				String category = rs.getString("category");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.category(category)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
			
				boards.add(board);
			}
			return boards;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findByRecommendation() {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM board WHERE category = ?  ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, "recommendation");
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				String category = rs.getString("category");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.category(category)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
			
				boards.add(board);
			}
			return boards;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findByInformation() {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM board WHERE category = ?  ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, "information");
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				String category = rs.getString("category");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.category(category)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
			
				boards.add(board);
			}
			return boards;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public List<Board> findByTip() {
		// 0. 컬렉션 만들기
		List<Board> boards = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM board WHERE category = ?  ORDER BY id DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, "tip");
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String boardTitle = rs.getString("boardTitle");
				String content = rs.getString("content");
				int userId = rs.getInt("userId");
				String category = rs.getString("category");
				Timestamp boardCreateTime = rs.getTimestamp("boardCreateTime");
				String fileName = rs.getString("fileName");
				
				Board board = Board.builder()
						.id(id)
						.boardTitle(boardTitle)
						.content(content)
						.userId(userId)
						.category(category)
						.boardCreateTime(boardCreateTime)
						.fileName(fileName)
						.build();
			
				boards.add(board);
			}
			return boards;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public Board findByMax() {

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT max(id) id FROM board";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt("id");
				
				Board board = Board.builder()
						.id(id)
						.build();
			
				return board;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
}