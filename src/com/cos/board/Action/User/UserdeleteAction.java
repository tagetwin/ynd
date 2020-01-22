package com.cos.board.Action.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class UserdeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println("UserDeleteAction id:" + id);
		
		User user = (User) req.getSession().getAttribute("principal");

		if (!user.getUsername().equals("admin")) {
			if (user == null || user.getId() != id) {
				Script.back(resp, "삭제할 권한이 없습니다.");
				return;
			}
		}

		UserDao userDao = UserDao.getInstance();

		BoardDao boardDao = BoardDao.getInstance();
		int result2 = boardDao.deleteAll(id);
		System.out.println("작성글 삭제성공");
		
		int result = userDao.delete(id);
		System.out.println("아이디 삭제성공");
		
		RequestDispatcher dis;
		
		if (result == 1 && result2 == 1) {
			if(!user.getUsername().equals("admin")) {
				HttpSession session = req.getSession();
				session.invalidate();
				
				dis = req.getRequestDispatcher("/");
				dis.forward(req, resp);
				
				return;
			} else
			dis = req.getRequestDispatcher("/user?cmd=admin");
			dis.forward(req, resp);

		} else {
			Script.back(resp, "삭제 실패하였습니다.");

		}

	}

}
