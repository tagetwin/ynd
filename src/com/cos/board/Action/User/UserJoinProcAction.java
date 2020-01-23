package com.cos.board.Action.User;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class UserJoinProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("UserJoinProcAction");
//		1. 파라메터 받기 (데이터)
//		2. Post 요청이기 때문에 DB에 insert
//		  (1) DAO 연결
//		  (2) 함수 실행 save(username, password, email);
//		  (3) return 값이 1일때 -> index.jsp
//		  (4) return 값이 1이 아니면 -> 자바스크립트로 history.back();

		if(
				req.getParameter("username")== null ||
				req.getParameter("password") == null ||
//				req.getParameter("email") == null ||
//				req.getParameter("address") == null ||
				req.getParameter("username").equals("") ||
				req.getParameter("password").equals("")
//				req.getParameter("email").equals("") ||
//				req.getParameter("address").equals("")
		) {
			Script.back(resp, "작성이 완료되지 않았습니다.");
			return;
		}
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
//		String email = req.getParameter("email");
//		String address = req.getParameter("address");
		
		System.out.println("username: " + username);
		System.out.println("password: " + password);
//		System.out.println("email: " + email);
//		System.out.println("address: " + address);

		UserDao userDao = UserDao.getInstance();
		int result = userDao.save(username, password);
		
		if (result == 1) {
			System.out.println("가입성공");
			
			resp.sendRedirect("/yp/");
			
//			RequestDispatcher dis = req.getRequestDispatcher("/");
//			dis.forward(req, resp);
			
		} else {
			Script.back(resp, "회원가입 실패");
		}
	}
		
}
