package com.cos.board.Action.Admin;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.GalleryDao;
import com.cos.board.dao.GameDao;
import com.cos.board.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminGameUpdateProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = (User) req.getSession().getAttribute("principal");
		
		if( user==null || !user.getUsername().equals("admin")) {
			Script.back(resp, "접근 권한이 없습니다.");
			return;	
		}
		
		String uploadPath="/var/webapps/upload/";
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		System.out.println("성공");
		String fileName = multi.getFilesystemName("filename1");
		String original = multi.getOriginalFileName("filename1");

		String type = multi.getContentType("filename1");
		File f = multi.getFile("filename1");

		int len = 0;
		if (f != null) {
			len = (int) f.length();
		}
	
		GalleryDao galleryDao = GalleryDao.getInstance();
		galleryDao.upload(fileName, original, type, len, user.getId());
		
		int gid = Integer.parseInt(multi.getParameter("gid"));
		String gameTitle = multi.getParameter("gameTitle");
		String gameContent = multi.getParameter("gameContent");
		String genre = multi.getParameter("genre");
		String publisher = multi.getParameter("publisher");
		int steamPrice = Integer.parseInt(multi.getParameter("steamPrice"));
		int directPrice = Integer.parseInt(multi.getParameter("directPrice"));
		
		String steamUrl = multi.getParameter("steamUrl");
		String directUrl = multi.getParameter("directUrl");
		
		
		String date = multi.getParameter("publishDate");
		Date publishDate = Date.valueOf(date);	
		
		GameDao gameDao = GameDao.getInstance();
		int result = gameDao.update(gameTitle, gameContent, genre, publisher, steamPrice, directPrice, publishDate, fileName, steamUrl,directUrl, gid);
		
		
		if(result == 1) {
			resp.sendRedirect("/yp/admin?cmd=game");
		}else {
			Script.back(resp, "게임정보 수정 실패");
		}
		
		
		
	}

}
