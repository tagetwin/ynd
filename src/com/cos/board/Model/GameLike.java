package com.cos.board.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor      // 전체 생성자
@NoArgsConstructor  // 빈 생성자
@Builder
@Getter

public class GameLike {
	private int lid;
	private int userId;
	private int gid;
	private int recommendation;
}
