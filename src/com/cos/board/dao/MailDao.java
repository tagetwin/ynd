package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cos.board.DB.DBUtil;

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
}