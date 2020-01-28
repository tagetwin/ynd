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

public class CommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("principal");
		
		if(user==null || req.getParameter("cid")==null || req.getParameter("cid").equals("")) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
		}
		
		int id = Integer.parseInt(req.getParameter("id"));
		int userId = user.getId();
		
		if(userId != id) {
			Script.back(resp, "삭제할 권한이 없습니다.");
			return;
		}
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CommentDao commentDao = CommentDao.getInstance();
		int result = commentDao.delete(cid);
		
		if(result == 1) {
			resp.sendRedirect("/yp/board?cmd=detail&id="+id);
		}else {
			Script.back(resp, "댓글 등록이 실패했습니다.");
			
		}
	
		
		
		
	}
}
