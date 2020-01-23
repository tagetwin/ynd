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

public class Gallery {
	private int pid;
	private String fileName;
	private String original;
	private String type;
	private int len;
	private int userId;
	private String psubject;
//	private int degree;
	private Timestamp pCreateTime;
}
