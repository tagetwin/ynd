package com.cos.board.Action.Board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.util.Script;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		System.out.println("BoardDeleteAction id:"+id);
		System.out.println("BoardDeleteAction userId:"+userId);
		
		User user = (User) req.getSession().getAttribute("principal");
		
//		System.out.println(user.getId());
		
		if (!user.getUsername().equals("admin")) {
			if
			(
				user==null || userId != user.getId()
			) {
				Script.back(resp, "삭제할 권한이 없습니다.");
				return;
			}
		}
		
		BoardDao boardDao = BoardDao.getInstance();
		
		int result = boardDao.delete(id);
		
		
		if(result==1) {
			if(!user.getUsername().equals("admin")) {
				System.out.println("사용자글삭제성공");
				resp.sendRedirect("/yp/board?cmd=list");
				return;
			}
			System.out.println("관리자글삭제성공");
			resp.sendRedirect("/yp/user?cmd=admin");

			
		}else {
			Script.back(resp, "삭제 실패하였습니다.");
		}

	}

}
