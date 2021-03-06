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

public class BoardSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String boardTitle = req.getParameter("boardTitle");
		
		BoardDao boardDao = BoardDao.getInstance();
		List<Board> boards = boardDao.findByTitle(boardTitle);
		
		if(boards != null) {
			req.setAttribute("boards", boards);
			RequestDispatcher dis = req.getRequestDispatcher("/board/list.jsp");
			dis.forward(req, resp);
			
		}else {
			Script.back(resp, "글 검색에 실패했습니다.");
		}
		
	}

}
