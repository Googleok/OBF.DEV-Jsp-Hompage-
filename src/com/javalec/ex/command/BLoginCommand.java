package com.javalec.ex.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.ex.dao.BDao;

public class BLoginCommand implements BCommand{
	HttpSession session;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String ok = "ok";
		String fail="fail";
		
		String bId = request.getParameter("userid");
		String bPasswd = request.getParameter("passwd");
		
		BDao dao = new BDao();
		if(dao.login(bId, bPasswd)){
			HttpSession session = request.getSession();
			session.setAttribute("login", bId);
			session.setMaxInactiveInterval(60*60);
			request.setAttribute("login_ok", ok);
		}else {
			request.setAttribute("login_ok", fail);
		}
	}

}
