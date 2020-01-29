package com.cos.board.Action.Game;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.Model.User;
import com.cos.board.dao.GameDao;
import com.cos.board.dao.GameLikeDao;
import com.cos.board.dto.GamelikeDto;
import com.cos.board.util.Script;
import com.google.gson.Gson;

public class GameLikeAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BufferedReader br = req.getReader();
		String responseText = br.readLine();
		
		System.out.println("responseText :"+responseText);
		HttpSession ssession = req.getSession();
		User user = (User)ssession.getAttribute("principal");
		int userId =user.getId();
		Gson gson = new Gson();
			
		GamelikeDto gamelikeDto = gson.fromJson(responseText, GamelikeDto.class);
		
		System.out.println("gamelikeDto.getGid(): " + gamelikeDto.getGid());
		System.out.println("gamelikeDto.getUserId(): " + gamelikeDto.getUserId());
		
		GameDao gameDao1 = GameDao.getInstance();
		int gid = gamelikeDto.getGid();
//		int userId = gamelikeDto.getUserId();
		Game game= gameDao1.recCheck(gid, userId);
		System.out.println(game);
		if(game ==null) {
			GameLikeDao gameLikeDao = GameLikeDao.getInstance();
			int result = gameLikeDao.save(userId, gid);

			GameDao gameDao = GameDao.getInstance();
			int result2 = gameDao.addlike(gamelikeDto.getGid());
			System.out.println("result:" + result);
			System.out.println("result2:" + result2);
			Script.ok(resp);
		} else {
			Script.fail(resp);
		}
		
	}

}
