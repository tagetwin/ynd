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

public class BoardUpdateProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if
		(
				req.getParameter("userId") == null ||
				req.getParameter("id") == null ||
				req.getParameter("boardTitle") == null ||
				req.getParameter("content") == null ||
				req.getParameter("userId").equals("") ||
				req.getParameter("id").equals("") ||
				req.getParameter("boardTitle").equals("") ||
				req.getParameter("content").equals("")
		) {
			Script.back(resp, "proc잘못된 접근입니다.");
			return; // 두번이동하게되면 에러 forward
		}
		System.out.println(req.getParameter("id"));
		System.out.println(req.getParameter("boardTitle"));
		System.out.println(req.getParameter("content"));
		
		int id = Integer.parseInt(req.getParameter("id"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		String boardTitle = req.getParameter("boardTitle");
		String content = req.getParameter("content");
		User principal = (User) req.getSession().getAttribute("principal");
		
		System.out.println("title: "+boardTitle);
		System.out.println("content: "+content);
		System.out.println("principal.getId(): "+principal.getId());
		
		// 권한 검증!!
		if(userId != principal.getId()) {
			Script.back(resp, "권한이 없습니다.");
			return;
		}
		
		// DAO 연결해서 update 수정하기
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.update(boardTitle, content, id);
		
		
		// update 가 정상("board?cmd=detail&id=변수id이면 혹은 비정상이면
		if(result == 1) {
			RequestDispatcher dis = req.getRequestDispatcher("/board?cmd=detail&id="+id);
			dis.forward(req, resp);
			System.out.println("수정 성공");
		}else {
			Script.back(resp, "글 수정이 실패했습니다.");
		}
				

	}
}
