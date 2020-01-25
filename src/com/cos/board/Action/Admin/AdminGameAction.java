package com.cos.board.Action.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.Model.User;
import com.cos.board.dao.GameDao;
import com.cos.board.util.Script;

public class AdminGameAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		System.out.println(user.getUsername().equals("admin"));
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		
		GameDao gameDao = GameDao.getInstance();
		List<Game> games = gameDao.findAll();
		
		if(games != null) {
			req.setAttribute("games", games);
			RequestDispatcher dis = req.getRequestDispatcher("/admin/game.jsp");
			dis.forward(req, resp);
			
		}else {
			Script.back(resp, "게임목록을 불러올 수 없습니다.");
		}
		
		
	}

}
