package com.cos.board.Action.Game;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.dao.GameDao;

public class GameSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String gameTitle = req.getParameter("gameTitle");
		
		GameDao gameDao = GameDao.getInstance();
		List<Game> games = gameDao.findAll(gameTitle);	
		
		req.setAttribute("games", games);
		
		RequestDispatcher dis = req.getRequestDispatcher("/game/search.jsp");
		dis.forward(req, resp);
	}

}
