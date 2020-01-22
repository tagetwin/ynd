package com.cos.board.Action.Game;

import com.cos.board.Action.Action;

public class GameFactory {

	public static Action route (String cmd) {
	System.out.println("GameFactory :" + cmd);
		
		if(cmd.equals("search")) {
			return new GameSearchAction();
		}else if (cmd.equals("detail")) {
			return new GameDetailAction();
		}else if (cmd.equals("like")) {
			return new GameLikeAction();
		}
		return null;	
	}
	
}
