package com.cos.board.Action.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.Board;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.util.Script;

public class AdminBlogAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		System.out.println(user.getUsername().equals("admin"));
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		
		BoardDao boarddao = BoardDao.getInstance();
		List<Board> boards = boarddao.findAll();
		
		req.setAttribute("boards", boards);
		
		RequestDispatcher dis = req.getRequestDispatcher("/admin/blog.jsp");
		dis.forward(req, resp);
		
	}

}
