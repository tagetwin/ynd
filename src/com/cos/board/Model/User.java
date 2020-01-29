package com.cos.board.Model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

// model, vo(value object), bean(콩)
//@Data                         // getter setter
@AllArgsConstructor     // 전체 생성자
@NoArgsConstructor     // 빈 생성자
@Builder
@Getter
public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String address;
	private Timestamp createTime;
	private String info;
	private String fileName;
	
	
}
