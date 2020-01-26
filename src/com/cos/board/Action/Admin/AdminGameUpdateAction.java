package com.cos.board.Action.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Game;
import com.cos.board.Model.User;
import com.cos.board.dao.GameDao;
import com.cos.board.util.Script;

public class AdminGameUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		int gid = Integer.parseInt(req.getParameter("gid"));
				
		GameDao gameDao = GameDao.getInstance();
		Game games = gameDao.findbyId(gid);
		
		if(games != null) {
			req.setAttribute("games", games);
			RequestDispatcher dis = req.getRequestDispatcher("/admin/update.jsp");
			dis.forward(req, resp);
		} else {
			Script.back(resp, "게임정보를 불러오지 못했습니다.");
		}
		
	}

}
