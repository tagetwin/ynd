package com.cos.board.Action.Board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;

public class BoardGalleryListAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 RequestDispatcher dis = req.getRequestDispatcher("/gallery/list.jsp");
		 dis.forward(req, resp);

	}

}
