package com.cos.board.Action.User;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.board.Action.Action;
import com.cos.board.Model.User;
import com.cos.board.dao.GalleryDao;
import com.cos.board.dao.UserDao;
import com.cos.board.util.Script;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProfileProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uploadPath="C:/src/jspWork/upload";
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		if(
			multi.getParameter("password") == null ||
			multi.getParameter("password").equals("")) {
			Script.back(resp, "잘못된 접근입니다.");
			return;
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
		User user = (User) req.getSession().getAttribute("principal");
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		galleryDao.upload(fileName, original, type, len, user.getId());
		
		int id = user.getId();
		String password = multi.getParameter("password");
		String email = multi.getParameter("email");
		String address = multi.getParameter("address");
		String info = multi.getParameter("info");
		
		// Dao 연결해서 회원정보 수정!!
		UserDao userDao = UserDao.getInstance();
		int result = userDao.update(password, email, address, info, fileName, id);
		
		if(result == 1) {
			// 세션 업데이트
			System.out.println("회원정보수정완료");
			User users = userDao.findById(id);
			HttpSession session = req.getSession();
			session.setAttribute("principal", users);
			
			Script.href(resp, "회원정보 수정 완료", "/yp/");
		} else {
			Script.back(resp, "회원정보 수정에 실패하였습니다.");
		}
		
		
	}

}
