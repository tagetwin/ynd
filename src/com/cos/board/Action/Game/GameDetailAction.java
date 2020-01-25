package com.cos.board.Action.Game;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.dao.GameDao;
import com.cos.board.util.Script;

public class GameDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if
		(
			req.getParameter("gid") == null ||
			req.getParameter("gid").equals("")
		) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
		}
		
		int gid = Integer.parseInt(req.getParameter("gid"));
		
		GameDao gameDao = GameDao.getInstance();
		Game games = gameDao.findbyId(gid);
		
		if(games !=null) {
			req.setAttribute("games", games);
			RequestDispatcher dis = req.getRequestDispatcher("/game/detail.jsp");
			dis.forward(req, resp);
		}
	}
}
