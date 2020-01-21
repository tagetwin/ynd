package com.cos.board.Action.Board;

// userId = 1
// http://localhost:8000/board?cmd=update?id3&userId=1
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.util.Script;
import com.cos.board.viewmodel.BoardUserVM;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 파라메터 받기
		if
		(
				req.getParameter("id") == null ||
				req.getParameter("userId") == null ||
				req.getParameter("id").equals("")  ||
				req.getParameter("userId").equals("") 
		)
		{
			Script.back(resp, "up잘못된 접근입니다.");
			return;
		}
		
		int id = Integer.parseInt(req.getParameter("id"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		
		System.out.println(id);
		System.out.println(userId);
		
		//principal 접근 주체
		User principal = (User) req.getSession().getAttribute("user");
		
		// 권한 검증!!
		if(userId != principal.getId()) {
			Script.back(resp, "권한이 없습니다.");
			return;
		}
				
		// 2. DAO 연결해서 Select 해서 Board 객체 받기
		BoardDao boardDao = BoardDao.getInstance();
		BoardUserVM buVM = boardDao.findById(id);
		
		// 3. request에 Board 객체 넣기
		if(buVM != null) {
			req.setAttribute("buVM", buVM);
		}else {
			Script.back(resp, "해당 게시글이 없습니다.");
			return;
		}
		
		
		// 4. update.jsp 로 이동하기
		RequestDispatcher dis = req.getRequestDispatcher("/board/update.jsp");
		dis.forward(req, resp);
	}

}
