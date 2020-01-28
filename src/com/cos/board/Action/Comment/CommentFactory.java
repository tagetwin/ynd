package com.cos.board.Action.Comment;

import com.cos.board.Action.Action;

public class CommentFactory {

	public static Action route (String cmd) {
	
		if(cmd.equals("write")) {
			return new CommentWriteAction();
		}else if(cmd.equals("delete")) {
			return new CommentDeleteAction();
		}
		return null;	
	}
	
}
