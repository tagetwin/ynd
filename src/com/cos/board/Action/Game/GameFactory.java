package com.cos.board.Action.Game;

import com.cos.board.Action.Action;

public class GameFactory {

	public static Action route (String cmd) {
//	System.out.println("GameFactory :" + cmd);
		
		if(cmd.equals("search")) {
			return new GameSearchAction();
		}else if (cmd.equals("detail")) {
			return new GameDetailAction();
		}else if (cmd.equals("like")) {
			return new GameLikeAction();
		}else if (cmd.equals("list")) {
			return new GameListAction();
		}else if (cmd.equals("count")) {
			return new GameCountAction();
		}
		return null;	
	}
	
}
