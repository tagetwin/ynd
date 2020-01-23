package com.cos.board.Action.Gallery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.dao.GalleryDao;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;

public class GalleryDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("principal");
		
		if
		(
			req.getParameter("pid") == null ||
			req.getParameter("pid").equals("") ||
			!user.getUsername().equals("admin")
		) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
		}
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		int result = galleryDao.delete(pid);
		
		if(result == 1) {
			resp.sendRedirect("/yp/user?cmd=admin");
		}else {
			Script.back(resp, "이미지 삭제 실패");
		}
			
		
		
	}
}
