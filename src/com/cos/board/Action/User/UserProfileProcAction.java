package com.cos.board.Action.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class UserProfileProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if(
			req.getParameter("password") == null ||
			req.getParameter("password").equals("")) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
		}
		
//			req.getParameter("email") == null ||
//					req.getParameter("address") == null ||
//				req.getParameter("email").equals("") ||
//				req.getParameter("address").equals("")) {
			
		
		User user = (User) req.getSession().getAttribute("principal");
		int id = user.getId();
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		// Dao 연결해서 회원정보 수정!!
		UserDao userDao = UserDao.getInstance();
		int result = userDao.update(password, email, address, id);
		
		if(result == 1) {
			// 세션 업데이트
			User principal = userDao.findById(id);
			HttpSession session = req.getSession();
			session.setAttribute("user", principal);
			
			Script.href(resp, "회원정보 수정 완료", "/yp/");
		} else {
			Script.back(resp, "회원정보 수정에 실패하였습니다.");
		}
		
		
	}

}
