package com.cos.board.viewmodel;

import com.cos.board.Model.Comment;
import com.cos.board.Model.User;

public class CommentVM {
	private Comment comment;
	private User user;
	
	public CommentVM(Comment comment, User user) {
		this.comment = comment;
		this.user = user;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
