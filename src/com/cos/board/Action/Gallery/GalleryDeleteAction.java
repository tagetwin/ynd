package com.cos.board.Action.Gallery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.GalleryDao;
import com.cos.board.util.Script;

public class GalleryDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("principal");
		int pid = Integer.parseInt(req.getParameter("pid"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		
		if( !user.getUsername().equals("admin") ) {
			if
			(
				user == null ||
				userId != user.getId() ||
				req.getParameter("pid") == null ||
				req.getParameter("pid").equals("")
			) {
				Script.back(resp, "잘못된 접근입니다.");
				return;
			}
		}
		
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		int result = galleryDao.delete(pid);
		
		if(result == 1) {
			if(!user.getUsername().equals("admin")) {
				System.out.println("사용자이미지삭제성공");
				resp.sendRedirect("/yp/gallery?cmd=list");
				return;
				
			}else {
				System.out.println("관리자이미지삭제성공");
				resp.sendRedirect("/yp/admin?cmd=gallery");
			}
			
		}else {
			Script.back(resp, "이미지 삭제 실패");
		}
	}
}
