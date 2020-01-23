package com.cos.board.Action.Gallery;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cos.board.Action.Action;

public class GalleryUploadAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dis = req.getRequestDispatcher("/gallery/UploadForm.jsp");
		dis.forward(req, resp);
	}
}
