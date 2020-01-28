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


public class Comment {
	private int cid;
	private int id;
	private String comment;
	private int userId;
	private Timestamp commentTime;
}
