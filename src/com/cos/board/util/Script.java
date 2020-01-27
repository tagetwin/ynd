package com.cos.board.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {

	public static void back(HttpServletResponse resp, String msg) throws IOException {

		PrintWriter out = resp.getWriter();
		out.print("<script>");
		out.print("alert('" + msg + "');");
		out.print("history.back();");
		out.print("</script>");
		out.flush();

	}

	public static void href(HttpServletResponse resp, String msg, String uri) throws IOException {

		PrintWriter out = resp.getWriter();
		out.print("<script>");
		out.print("alert('" + msg + "');");
		out.print("location.href='" + uri + "'");
		out.print("</script>");
		out.flush();

	}

	public static void ok(HttpServletResponse resp) throws IOException {

		PrintWriter out = resp.getWriter();
		out.print("ok");
		out.flush();
	}
	
	public static void fail(HttpServletResponse resp) throws IOException {

		PrintWriter out = resp.getWriter();
		out.print("ok");
		out.flush();
	}
}
