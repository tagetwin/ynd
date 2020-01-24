package com.cos.board.Action.Gallery;

import com.cos.board.Action.Action;

public class GalleryFactory {

	public static Action route (String cmd) {
	
		if(cmd.equals("list") ||  cmd.equals("")) {
			return new GalleryListAction();
		}else if(cmd.equals("uploadProc")) {
			return new GalleryUploadProcAction();
		}else if(cmd.equals("delete")) {
			return new GalleryDeleteAction();
		}
		return null;	
	}
	
}
