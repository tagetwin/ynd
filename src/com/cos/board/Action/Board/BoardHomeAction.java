package com.cos.board.Action.Board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Board;
import com.cos.board.dao.BoardDao;
import com.cos.board.util.Script;

public class BoardHomeAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BoardDao boardDao = BoardDao.getInstance();
		List<Board> boards = boardDao.findRecent();
		
		if(boards!=null) {
			req.setAttribute("boards", boards);
			RequestDispatcher dis = req.getRequestDispatcher("/game/home.jsp");
			dis.forward(req, resp);
		}else {
			Script.back(resp, "최신글을 불러오지 못했습니다.");
		}
	}
}
