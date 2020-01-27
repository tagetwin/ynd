package com.cos.board.Action.User;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.dao.MailDao;
import com.cos.board.dto.MailRegDto;
import com.cos.board.util.Script;
import com.google.gson.Gson;

public class UserRegMailAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BufferedReader br = req.getReader();
		String responseText = br.readLine();
		System.out.println("regmail :"+responseText);
		
		Gson gson = new Gson();
			
		MailRegDto mailRegDto = gson.fromJson(responseText, MailRegDto.class);
		
		System.out.println("regmailjson: " + mailRegDto.getReg_mail());
		
		MailDao mailDao = MailDao.getInstance();
		int result = mailDao.save(mailRegDto.getReg_mail());
		
		if(result == 1) {
			Script.ok(resp);
		}else {
			Script.fail(resp);
		}
	}
}
