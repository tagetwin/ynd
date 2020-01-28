package com.cos.board.Action.Gallery;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.dao.GalleryDao;
import com.cos.board.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryUploadOnlyProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uploadPath="C:/src/jspWork/upload";
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

		
		int userId = Integer.parseInt(multi.getParameter("userId"));
		
		GalleryDao gallerydao = GalleryDao.getInstance();
		int result = gallerydao.uploadonly(fileName, original, type, len, userId);
		
		
		if(result == 1) {
			System.out.println("파일 업로드 성공");
			resp.sendRedirect("/yp/gallery?cmd=list");
		}else {
			Script.back(resp, "파일업로드 실패");
		}
	}
}
