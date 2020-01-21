package com.cos.board.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.board.Action.Action;
import com.cos.board.Action.Game.GameFactory;


@WebServlet("/game")
public class GameController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		DBUtil.getConnection();
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String cmd = req.getParameter("cmd");
		System.out.println("GameController:"+cmd);
		Action action = GameFactory.route(cmd);
		action.execute(req, resp);
		
	}
}
