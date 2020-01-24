package com.cos.board.Action.Board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.util.Script;

public class BoardWriteProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if
		(
				req.getParameter("boardTitle") == null ||
				req.getParameter("content") == null ||
				req.getParameter("boardTitle").equals("") ||
				req.getParameter("content").equals("")
		) {
			Script.back(resp, "잘못된 접근입니다.");
			System.out.println(req.getParameter("boardTitle"));
			System.out.println(req.getParameter("content"));
			return; // 두번이동하게되면 에러 forward
		}
		
		String boardTitle = req.getParameter("boardTitle");
		String content = req.getParameter("content");
		User user = (User) req.getSession().getAttribute("principal");
		
		System.out.println(boardTitle);
		System.out.println(content);
		System.out.println(user.getId()); 
		
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.save(boardTitle, content, user.getId());
		
		
		if(result == 1) {
//			RequestDispatcher dis = req.getRequestDispatcher("/board?cmd=list");
//			dis.forward(req, resp);
			resp.sendRedirect("/yp/board?cmd=list");
//			resp.sendRedirect("/yp/board?cmd=detail&id="+id);
		}else {
			Script.back(resp, "글 입력시 오류가 발생하였습니다.");
		}
				

	}
}
