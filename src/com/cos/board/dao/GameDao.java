package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cos.board.DB.DBUtil;
import com.cos.board.Model.Game;

// User Test
public class GameDao {

	// 싱글톤 패턴
	// 생성자 만들기
	private GameDao() {
	}

	private static GameDao instance = new GameDao();

	public static GameDao getInstance() {
		return instance;
	}

	public int save(String boardTitle, String content, int userId) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO board (boardTitle, content, userId, boardCreateTime) VALUES (?, ?, ?, now())";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, content);
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

	public int update(String boardTitle, String content, int id) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "UPDATE board SET boardTitle = ?, content = ? WHERE id = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);

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

	public List<Game> findAll(String gameTitle) {
		// 0. 컬렉션 만들기
		List<Game> games = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM game WHERE gameTitle like '%"+gameTitle+"%' ORDER BY gid DESC";
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
//			pstmt.setString(1, gameTitle);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int gid = rs.getInt("gid");
				gameTitle =rs.getString("gameTitle"); 
				String gameContent = rs.getString("gameContent");
				String genre = rs.getString("genre");
				String publisher = rs.getString("publisher");
				Timestamp publishDate = rs.getTimestamp("publishDate");
				int userId = rs.getInt("userId");
				int steamPrice = rs.getInt("steamPrice");
				int directPrice = rs.getInt("directPrice");
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
						.gid(gid)
						.gameTitle(gameTitle)
						.gameContent(gameContent)
						.genre(genre)
						.publisher(publisher)
						.publishDate(publishDate)
						.userId(userId)
						.steamPrice(steamPrice)
						.directPrice(directPrice)
						.recommendation(recommendation)
						.build();
				
				games.add(game);
			}

			return games;
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

	public Game findbyId(int gid) {
		// 0. 컬렉션 만들기

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM game WHERE gid = ?";
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, gid);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String gameTitle =rs.getString("gameTitle"); 
				String gameContent = rs.getString("gameContent");
				String genre = rs.getString("genre");
				String publisher = rs.getString("publisher");
				Timestamp publishDate = rs.getTimestamp("publishDate");
				int userId = rs.getInt("userId");
				int steamPrice = rs.getInt("steamPrice");
				int directPrice = rs.getInt("directPrice");
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
						.gid(gid)
						.gameTitle(gameTitle)
						.gameContent(gameContent)
						.genre(genre)
						.publisher(publisher)
						.publishDate(publishDate)
						.userId(userId)
						.steamPrice(steamPrice)
						.directPrice(directPrice)
						.recommendation(recommendation)
						.build();

				return game;	
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