package com.cos.board.Action.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;

public class UserLogoutAction implements Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			HttpSession session = req.getSession();
			session.invalidate();
			
			resp.sendRedirect("/yp/");
			
//			RequestDispatcher dis = req.getRequestDispatcher("/");
//			dis.forward(req, resp);
	}

}
