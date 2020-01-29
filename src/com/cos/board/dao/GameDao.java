package com.cos.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

	public int save(String gameTitle, String gameContent, String genre, String publisher, int steamPrice, String steamUrl, String directUrl,
			int directPrice, Date publishDate, String fileName) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "INSERT INTO game (gameTitle, gameContent, genre, publisher, publishDate, steamPrice, directPrice,"
					+ " steamUrl, directUrl, fileName, recommendation)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, gameTitle);
			pstmt.setString(2, gameContent);
			pstmt.setString(3, genre);
			pstmt.setString(4, publisher);
			pstmt.setDate(5, (java.sql.Date) publishDate);
			pstmt.setInt(6, steamPrice);
			pstmt.setInt(7, directPrice);
			pstmt.setString(8, steamUrl);
			pstmt.setString(9, directUrl);
			pstmt.setString(10, fileName);
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

	public int update(String gameTitle, String gameContent, String genre, String publisher, int steamPrice, 
			int directPrice, Date publishDate, String fileName, String steamUrl, String directUrl, int gid) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "UPDATE game SET gameTitle = ?, gameContent = ?, genre = ?, publisher = ?,"
					+ " publishDate = ?, steamPrice = ?, directPrice = ?, fileName = ?, steamUrl = ?, directUrl = ?  WHERE gid = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setString(1, gameTitle);
			pstmt.setString(2, gameContent);
			pstmt.setString(3, genre);
			pstmt.setString(4, publisher);
			pstmt.setDate(5, (java.sql.Date) publishDate);
			pstmt.setInt(6, steamPrice);
			pstmt.setInt(7, directPrice);
			pstmt.setString(8, fileName);
			pstmt.setString(9, steamUrl);
			pstmt.setString(10, directUrl);
			pstmt.setInt(11, gid);
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

	public int delete(int gid) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "DELETE FROM game WHERE gid = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, gid);

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
				Date publishDate = rs.getDate("publishDate");
				int steamPrice = rs.getInt("steamPrice");
				int directPrice = rs.getInt("directPrice");
				String steamUrl = rs.getString("steamUrl");
				String directUrl = rs.getString("directUrl");
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
						.gid(gid)
						.gameTitle(gameTitle)
						.gameContent(gameContent)
						.genre(genre)
						.publisher(publisher)
						.publishDate((java.sql.Date) publishDate)
						.steamPrice(steamPrice)
						.directPrice(directPrice)
						.steamUrl(steamUrl)
						.directUrl(directUrl)
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
				Date publishDate = rs.getDate("publishDate");
				int steamPrice = rs.getInt("steamPrice");
				int directPrice = rs.getInt("directPrice");
				String fileName = rs.getString("fileName");
				String steamUrl = rs.getString("steamUrl");
				String directUrl = rs.getString("directUrl");
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
						.gid(gid)
						.gameTitle(gameTitle)
						.gameContent(gameContent)
						.genre(genre)
						.publisher(publisher)
						.publishDate((java.sql.Date) publishDate)
						.steamPrice(steamPrice)
						.directPrice(directPrice)
						.fileName(fileName)
						.steamUrl(steamUrl)
						.directUrl(directUrl)
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
	
	public List<Game> findAll() {
		// 0. 컬렉션 만들기
		List<Game> games = new ArrayList<>();

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT * FROM game ORDER BY gid DESC";
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
//			pstmt.setString(1, gameTitle);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int gid = rs.getInt("gid");
				String gameTitle =rs.getString("gameTitle"); 
				String gameContent = rs.getString("gameContent");
				String genre = rs.getString("genre");
				String publisher = rs.getString("publisher");
				Date publishDate = rs.getDate("publishDate");
				int steamPrice = rs.getInt("steamPrice");
				int directPrice = rs.getInt("directPrice");
				String steamUrl = rs.getString("steamUrl");
				String directUrl = rs.getString("directUrl");
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
						.gid(gid)
						.gameTitle(gameTitle)
						.gameContent(gameContent)
						.genre(genre)
						.publisher(publisher)
						.publishDate((java.sql.Date) publishDate)
						.steamPrice(steamPrice)
						.directPrice(directPrice)
						.steamUrl(steamUrl)
						.directUrl(directUrl)
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
	
	public int addlike(int gid) {
		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "UPDATE game set recommendation = recommendation+1 WHERE gid = ?";
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, gid);
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
	
	public Game count(int gid) {
		// 0. 컬렉션 만들기

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT recommendation FROM game WHERE gid = ?";
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, gid);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
			
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
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
	
	public Game recCheck(int gid, int userId) {

		// 1. Stream 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 2. 쿼리 전송 클래스 (규약에 맞게)
			final String SQL = "SELECT recommendation FROM likegame WHERE gid= ? and userId = ?";
			System.out.println(SQL);
			pstmt = conn.prepareStatement(SQL);
			// 3. SQL문 완성하기
			pstmt.setInt(1, gid);
			pstmt.setInt(2, userId);
			// 4. SQL문 전송하기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int recommendation = rs.getInt("recommendation");
				
				Game game = Game.builder()
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
