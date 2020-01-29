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

public class BoardMoveAction implements Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		BoardDao boardDao = BoardDao.getInstance();
		Board board = boardDao.Move(id);
		
		int up =0;
		if(board !=null) {
			resp.sendRedirect("/yp/board?cmd=detail&id="+(id+1));
			return;
		}
		
		while(board==null) {
			up = id++;
			boardDao.Move(up);
		}
		
		resp.sendRedirect("/yp/board?cmd=detail&id="+up);
		
//		if(board==null) {
//			Script.back(resp, "존재하지않습니다.");
//			return;
//		}else {
//			
//		}
		// 3번. X -> list.jsp 이동
	}
}
