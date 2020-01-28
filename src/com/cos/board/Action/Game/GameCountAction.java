package com.cos.board.Action.Game;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.dao.GameDao;
import com.cos.board.dto.CountDto;
import com.google.gson.Gson;

public class GameCountAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BufferedReader br = req.getReader();
		String responseText = br.readLine();
		
		System.out.println("responseText :"+responseText);
		
		Gson gson = new Gson();
			
		CountDto countDto = gson.fromJson(responseText, CountDto.class);
		
		System.out.println("countDto.getRecommendation(): " + countDto.getRecommendation());
		
		GameDao gameDao = GameDao.getInstance();
		Game game = gameDao.count(countDto.getGid());
		int result = game.getRecommendation();
		
		PrintWriter out = resp.getWriter();
		out.print(result);
		out.close();
		
	}
}
