package com.cos.board.Action.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.MailAddress;
import com.cos.board.Model.User;
import com.cos.board.dao.MailDao;
import com.cos.board.util.Script;

public class AdminMailListAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		System.out.println(user.getUsername());
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		
		MailDao maildao = MailDao.getInstance();
		List<MailAddress> mailAddress = maildao.findAll();
		
		req.setAttribute("mailAddress", mailAddress);
		
		RequestDispatcher dis = req.getRequestDispatcher("/admin/email.jsp");
		dis.forward(req, resp);
		
	}

}
