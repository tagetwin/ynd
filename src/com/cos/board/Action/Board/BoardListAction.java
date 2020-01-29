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

public class BoardListAction implements Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1번. 받을 데이터 X
		// 2번. DAO 연결 - Select 전체 Board 데이터
		BoardDao boardDao = BoardDao.getInstance();
		List<Board> boards = boardDao.findAllComment();

		
		//<request에 List<Board>담기>
		req.setAttribute("boards", boards);
		
		// 3번. X -> list.jsp 이동
		RequestDispatcher dis = req.getRequestDispatcher("/board/list.jsp");
		dis.forward(req, resp);
	}
}
