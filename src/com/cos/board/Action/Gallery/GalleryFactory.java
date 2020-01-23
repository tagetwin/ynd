package com.cos.board.Action.Gallery;

import com.cos.board.Action.Action;

public class GalleryFactory {

	public static Action route (String cmd) {
	
		if(cmd.equals("list") ||  cmd.equals("")) {
			return new GalleryListAction();
		}else if(cmd.equals("upload")) {
			return new GalleryUploadAction();
		}else if(cmd.equals("uploadProc")) {
			return new GalleryUploadProcAction();
		}else if(cmd.equals("listProc")) {
			return new GalleryListProcAction();
		}
		return null;	
	}
	
}
