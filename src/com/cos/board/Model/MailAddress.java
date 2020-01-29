package com.cos.board.Model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor     // 전체 생성자
@NoArgsConstructor  // 빈 생성자
@Builder
@Getter

public class MailAddress {
	private int mid;
	private String reg_mail;
	private String[] mail;
}
