package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cos.board.DB.DBUtil;
import com.cos.board.Model.MailAddress;

public class MailDao {

	private MailDao() {}
	
	private static MailDao instance = new MailDao();
	
	public static MailDao getInstance() {
		return instance;
	}
	
	public int save(String email) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO mailaddress (reg_mail) VALUES (?)";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, email);
			
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
	
	public List<MailAddress> findAll() {
		// 0. 컬렉션 만들기
		List<MailAddress> mailAddress = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM mailaddress ORDER BY mid DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int mid = rs.getInt("mid");
				String reg_mail = rs.getString("reg_mail");
				
				MailAddress mailAddress1 = MailAddress.builder()
						.mid(mid)
						.reg_mail(reg_mail)
						.build();
				
				mailAddress.add(mailAddress1);
				
			}

			return mailAddress;
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
	
	public int delete(int mid) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "DELETE FROM mailaddress WHERE mid = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, mid);

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
	
}