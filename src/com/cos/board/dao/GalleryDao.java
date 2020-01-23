package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cos.board.DB.DBUtil;
import com.cos.board.Model.Board;
import com.cos.board.Model.Gallery;

// User Test
public class GalleryDao {

	// 싱글톤 패턴
	// 생성자 만들기
	private GalleryDao() {
	}

	private static GalleryDao instance = new GalleryDao();

	public static GalleryDao getInstance() {
		return instance;
	}

	public int upload(String fileName, String original, String type, int len, int userId, String psubject) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO gallery (fileName, original, type, len, userId, psubject, pCreateTime) VALUES (?, ?, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, fileName);
			pstmt.setString(2, original);
			pstmt.setString(3, type);
			pstmt.setInt(4, len);
			pstmt.setInt(5, userId);
			pstmt.setString(6, psubject);
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
	
	public List<Gallery> findAll() {
		// 0. 컬렉션 만들기
		List<Gallery> gallerys = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT pid, filename FROM gallery ORDER BY pid DESC";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pid = rs.getInt("pid");
				String fileName= rs.getString("fileName");
				
				Gallery gallery = Gallery.builder()
						.pid(pid)
						.fileName(fileName)
						.build();
				
				gallerys.add(gallery);
				
			}

			return gallerys;
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