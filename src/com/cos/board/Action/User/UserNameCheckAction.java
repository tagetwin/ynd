package com.cos.board.Action.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.dao.UserDao;
import com.cos.board.dto.UserJoinDto;
import com.google.gson.Gson;

public class UserNameCheckAction implements Action {
	
	private final static String TAG = "UsernameCheckAction : ";

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		BufferedReader br = req.getReader();
		String responseText = br.readLine();
		System.out.println(TAG + responseText);
		
		Gson gson = new Gson();
		//toJson() == JSON.stringify(), fromJson() == JSON.parse()
		
		UserJoinDto userJoinDto = gson.fromJson(responseText, UserJoinDto.class);
		
		System.out.println(TAG + userJoinDto.getUsername());
		
		UserDao userDao = UserDao.getInstance();
		int result = userDao.findByusername(userJoinDto.getUsername());
		
		if(result == 1) { // 중복되었음
			PrintWriter out = resp.getWriter();
			out.print("fail");
			out.flush();
		}else { // 중복되지 않음
			PrintWriter out = resp.getWriter();
			out.print("ok");
			out.flush();
		}
		
//		String username = req.getParameter("username");
//		System.out.println(TAG + username);
//		String myId = req.getParameter("myId");
//		System.out.println(TAG+myId);

	}
}
