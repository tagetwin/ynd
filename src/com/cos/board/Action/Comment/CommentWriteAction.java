package com.cos.board.Action.Comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.CommentDao;
import com.cos.board.util.Script;

public class CommentWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("principal");
		
		if
		(
			user==null || 
			req.getParameter("comment") == null ||  req.getParameter("comment").equals("") ||
			req.getParameter("id") == null || req.getParameter("id").equals("")
		) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
		}
		
		int userId = user.getId();
		
		String comment = req.getParameter("comment");
		int id = Integer.parseInt(req.getParameter("id"));
		
		System.out.println(userId +":"+ comment +":"+ id);
		CommentDao commentDao = CommentDao.getInstance();
		int result = commentDao.save(id, comment, userId);
		
		if(result == 1) {
			resp.sendRedirect("/yp/board?cmd=detail&id="+id);
		}else {
			Script.back(resp, "댓글 등록이 실패했습니다.");
			
		}
	
		
		
		
	}
}
