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

public class BoardUpdateProcAction implements Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uploadPath="C:/src/jspWork/upload";
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		String fileName = multi.getFilesystemName("filename1");
		String original = multi.getOriginalFileName("filename1");

		String type = multi.getContentType("filename1");
		File f = multi.getFile("filename1");

		int len = 0;
		if (f != null) {
			len = (int) f.length();
		}
		
		
		if (multi.getParameter("userId") == null || multi.getParameter("id") == null
				|| multi.getParameter("boardTitle") == null || multi.getParameter("content") == null
				|| multi.getParameter("userId").equals("") || multi.getParameter("id").equals("")
				|| multi.getParameter("boardTitle").equals("") || multi.getParameter("content").equals("")) {
			Script.back(resp, "proc잘못된 접근입니다.");
			return; // 두번이동하게되면 에러 forward
		}
		System.out.println(multi.getParameter("id"));
		System.out.println(multi.getParameter("boardTitle"));
		System.out.println(multi.getParameter("content"));
		
		int id = Integer.parseInt(multi.getParameter("id"));
		int userId = Integer.parseInt(multi.getParameter("userId"));
		String boardTitle = multi.getParameter("boardTitle");
		String content = multi.getParameter("content");
		String category = multi.getParameter("category");
		User user = (User) req.getSession().getAttribute("principal");
		
		System.out.println("title: "+boardTitle);
		System.out.println("content: "+content);
		System.out.println("principal.getId(): "+user.getId());
		
		// 권한 검증!!
		if(userId != user.getId()) {
			Script.back(resp, "권한이 없습니다.");
			return;
		}
		
		GalleryDao galleryDao = GalleryDao.getInstance();
		galleryDao.upload(fileName, original, type, len, userId);
		
		
		// DAO 연결해서 update 수정하기
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.update(boardTitle, content, category, fileName, id);
		
		
		// update 가 정상("board?cmd=detail&id=변수id이면 혹은 비정상이면
		if(result == 1) {
			resp.sendRedirect("/yp/board?cmd=detail&id="+id);
//			RequestDispatcher dis = req.getRequestDispatcher("/board?cmd=detail&id="+id);
//			dis.forward(req, resp);
			System.out.println("사용자 수정 성공");
		}else {
			Script.back(resp, "글 수정이 실패했습니다.");
		}
				

	}
}
