package com.cos.board.Action.Board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.BoardDao;
import com.cos.board.dao.GalleryDao;
import com.cos.board.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uploadPath="C:/src/jspWork/upload";
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		if
		(
				multi.getParameter("boardTitle") == null ||
						multi.getParameter("content") == null ||
								multi.getParameter("boardTitle").equals("") ||
								multi.getParameter("content").equals("")
		) {
			Script.back(resp, "잘못된 접근입니다.");
			System.out.println(req.getParameter("boardTitle"));
			System.out.println(req.getParameter("content"));
			return; // 두번이동하게되면 에러 forward
		}
		
		
		
		System.out.println("성공");
		String fileName = multi.getFilesystemName("filename1");
		String original = multi.getOriginalFileName("filename1");

		String type = multi.getContentType("filename1");
		File f = multi.getFile("filename1");

		int len = 0;
		if (f != null) {
			len = (int) f.length();
		}
		
		String boardTitle = multi.getParameter("boardTitle");
		String content = multi.getParameter("content");
		User user = (User) req.getSession().getAttribute("principal");
		
		
		System.out.println(boardTitle);
		System.out.println(content);
		System.out.println(user.getId()); 
		
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.save(boardTitle, content, user.getId());
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		galleryDao.upload(fileName, original, type, len, user.getId());
		
		
		if(result == 1) {
//			RequestDispatcher dis = req.getRequestDispatcher("/board?cmd=list");
//			dis.forward(req, resp);
			resp.sendRedirect("/yp/board?cmd=list");
//			resp.sendRedirect("/yp/board?cmd=detail&id="+id);
		}else {
			Script.back(resp, "글 입력시 오류가 발생하였습니다.");
		}
				

	}
}
