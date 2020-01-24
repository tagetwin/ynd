package com.cos.board.Action.User;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class UserLoginProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("UserLoginProcAction");
//		1. 파라메터 받기 (데이터)
//		2. Post 요청이기 때문에 DB에 insert
//		  (1) DAO 연결
//		  (2) 함수 실행 save(username, password, email);
//		  (3) return 값이 1일때 -> index.jsp
//		  (4) return 값이 1이 아니면 -> 자바스크립트로 history.back();
		
//		1번
		if(
				req.getParameter("username") == null ||
				req.getParameter("password") == null
		  )	 {
			resp.sendRedirect("/");
			return; // resp 두번 되면 오류가 난다 
		}
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		// ofNullable(값) null 인지 아닌지 확신할 수 없는 객체를 담을 때 사용
		String rememberMe = 
				Optional.ofNullable(req.getParameter("rememberMe")).orElse("off");
				
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		System.out.println("rememberMe: " + rememberMe);
		
//		2-1
//		UserDao userdao = new UserDao(); 매번객체를 생성하는 것은 X
		UserDao userDao = UserDao.getInstance();
//		2-2
		User user = userDao.login(username, password);
		
		if(rememberMe.equals("on")) {
			Cookie cookie = new Cookie("usernameCookie", username);
			cookie.setMaxAge(60*60*24*7); // 일주일 보관
			resp.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("usernameCookie", "");
			cookie.setMaxAge(0); // 쿠키값을 공백으로 받고 시간을 0초로 해서 바로 초기화
			resp.addCookie(cookie);
		}
		
//		2-3,4
		if (user != null) {
			System.out.println("로그인성공");
			HttpSession session = req.getSession();
			// session 변수명은 user > principal
			session.setAttribute("principal", user);

			resp.sendRedirect("/yp/");
			
//			RequestDispatcher dis = req.getRequestDispatcher("/");
//			dis.forward(req, resp);
			
		} else {
			Script.back(resp, "로그인 실패");
		}
	}
		
}
