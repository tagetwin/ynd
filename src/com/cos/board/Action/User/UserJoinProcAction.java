package com.cos.board.Action.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class UserJoinProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if(
				req.getParameter("username")== null ||
				req.getParameter("password") == null ||
				req.getParameter("username").equals("") ||
				req.getParameter("password").equals("")
		) {
			Script.back(resp, "작성이 완료되지 않았습니다.");
			return;
		}
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String info = req.getParameter("info");
		
		System.out.println("username: " + username);
		System.out.println("password: " + password);

		UserDao userDao = UserDao.getInstance();
		int result = userDao.save(username, password, info);
		
		if (result == 1) {
			System.out.println("가입성공");
			
			resp.sendRedirect("/yp/");
			
		} else {
			Script.back(resp, "회원가입 실패");
		}
	}
		
}
