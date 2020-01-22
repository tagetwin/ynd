package com.cos.board.Model;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor      // 전체 생성자
@NoArgsConstructor  // 빈 생성자
@Builder
@Getter

public class Board {
	private int id;
	private String boardTitle;
	private String content;
	private int userId;
	private Timestamp boardCreateTime;
	
//	public String getBoardtitle() {
//		boardtitle = boardtitle.replaceAll("<", "&lt;");
//		boardtitle = boardtitle.replaceAll(">", "&gt;");
//		return boardtitle;
//	}
}
