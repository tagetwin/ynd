package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cos.board.DB.DBUtil;
import com.cos.board.Model.User;

// User Test
public class UserDao {

	// 싱글톤 패턴
	// 생성자 만들기
	private UserDao() {}
	
	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	public int save(String username, String password) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO user (username, password, createTime) VALUES (?, ?, now())";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, username);
			pstmt.setString(2, password);
//			pstmt.setString(3, email);
//			pstmt.setString(4, address);
			// 4. SQL문 전송하기
			//pstmt.executeQuery();
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

	public int update(String password, String email, String address, int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "UPDATE user SET password = ?, email = ?, address = ? WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.setString(3, address);
			pstmt.setInt(4, id);
			
			// 4. SQL문 전송하기
			//pstmt.executeQuery();
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

	public int delete() {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "DELETE FROM user WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, 2);
			
			// 4. SQL문 전송하기
			//pstmt.executeQuery();
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
	
	public List<User> findAll() {
		// 0. 컬렉션 만들기
		List<User> users = new ArrayList<>();
		
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM user";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs =pstmt.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				Timestamp createTime = rs.getTimestamp("createTime");
				
				// User Builder
				User user = User.builder()
						.id(id)
						.username(username)
						.email(email)
						.createTime(createTime)
						.address("부산")
						.build();
				
				users.add(user);
			}
			
			return users;
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
	
	public User findById(int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM user WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, id);
			// 4. SQL문 전송하기
			rs =pstmt.executeQuery();
			User user = null;
			
			if (rs.next()) {
				id = rs.getInt("ID");
				String username = rs.getString("USERNAME");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp createTime = rs.getTimestamp("createTime");
				
				 // User Builder
				user = User.builder()
						.id(id)
						.password(password)
						.username(username)
						.email(email)
						.createTime(createTime)
						.address(address)
						.build();
			}
			
			return user;
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
	
	public User login(String username, String password) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM user WHERE username = ? and password = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			
			// 4. SQL문 전송하기
			rs =pstmt.executeQuery();
			User user = null;
			
			if (rs.next()) {
				int id = rs.getInt("ID");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp createTime = rs.getTimestamp("createTime");
				 
				// User Builder
				user = User.builder()
						.id(id)
						.username(username)
						.email(email)
						.createTime(createTime)
						.address(address)
						.build();
			}
			
			return user;
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
	
	public int findByusername(String username) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT COUNT(*) FROM user WHERE username = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, username);
			// 4. SQL문 전송하기
			rs =pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);		
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
		return -1;
	}
}