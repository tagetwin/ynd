package com.cos.board.Action.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;

public class UserJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		1. 페이지 이동
//		resp.sendRedirect("/user/join.jsp"); 주소가 남음.
//		데이터 들고 이동하고 싶을때 ( 톰켓에있는 데이터를 req, resp 를 덮어씌움) 
		RequestDispatcher dis = req.getRequestDispatcher("user/join.jsp");
//		디스패쳐 한뒤 포워드 해줘야함
		dis.forward(req, resp);
		

	}

}
