package com.cos.board.Action.Admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.GameDao;
import com.cos.board.util.Script;

public class AdminGameUpdateProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		int gid = Integer.parseInt(req.getParameter("gid"));
		String gameTitle = req.getParameter("gameTitle");
		String gameContent = req.getParameter("gameContent");
		String genre = req.getParameter("genre");
		String publisher = req.getParameter("publisher");
		int steamPrice = Integer.parseInt(req.getParameter("steamPrice"));
		int directPrice = Integer.parseInt(req.getParameter("directPrice"));
		
		String date = req.getParameter("publishDate");
		Date publishDate = Date.valueOf(date);	
		
		GameDao gameDao = GameDao.getInstance();
		int result = gameDao.update(gameTitle, gameContent, genre, publisher, steamPrice, directPrice, publishDate, gid);
		
		
		if(result == 1) {
			resp.sendRedirect("/yp/admin?cmd=game");
		}else {
			Script.back(resp, "게임정보 수정 실패");
		}
		
		
		
	}

}
