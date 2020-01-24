package com.cos.board.Action.Gallery;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cos.board.Action.Action;
import com.cos.board.Model.Gallery;
import com.cos.board.dao.GalleryDao;

public class GalleryListAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		List<Gallery> gallerys = galleryDao.findAll();
		
		req.setAttribute("gallerys",gallerys);
		
		RequestDispatcher dis = req.getRequestDispatcher("/gallery/list.jsp");
		dis.forward(req, resp);
	}
}
