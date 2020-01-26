package com.cos.board.Action.Admin;

import com.cos.board.Action.Action;

public class AdminFactory {

	public static Action route (String cmd) {
		
		if(cmd.equals("user") || cmd.equals("")) {
			return new AdminUserAction();
		}else if(cmd.equals("blog")) {
			return new AdminBlogAction();
		}else if(cmd.equals("game")) {
			return new AdminGameAction();
		}else if(cmd.equals("gallery")) {
			return new AdminGalleryAction();
		}else if(cmd.equals("write")) {
			return new AdminGameWriteAction();
		}else if(cmd.equals("writeProc")) {
			return new AdminGameWriteProcAction();
		}else if(cmd.equals("update")) {
			return new AdminGameUpdateAction();
		}else if(cmd.equals("updateProc")) {
			return new AdminGameUpdateProcAction();
		}else if(cmd.equals("delete")) {
			return new AdminGameDeleteAction();
		}
		return null;	
	}
	
}
