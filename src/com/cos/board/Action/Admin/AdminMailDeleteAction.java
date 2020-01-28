package com.cos.board.Action.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.GameDao;
import com.cos.board.dao.MailDao;
import com.cos.board.util.Script;

public class AdminMailDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		int mid = Integer.parseInt(req.getParameter("mid"));
				
		MailDao mailDao = MailDao.getInstance();
		int result = mailDao.delete(mid);
		
		if(result == 1) {
			System.out.println("메일링 삭제 성공");
			resp.sendRedirect("/yp/admin?cmd=maillist");
			
		} else {
			Script.back(resp, "메일링 정보를 불러오지 못했습니다.");
		}
		
	}

}
