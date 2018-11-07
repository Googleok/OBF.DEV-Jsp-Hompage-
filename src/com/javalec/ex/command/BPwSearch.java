package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;

public class BPwSearch implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String bId = request.getParameter("userid");
		String bEmail = request.getParameter("email");
		String resultPw=null;
		
		BDao dao = new BDao();
		resultPw=dao.pwSearch(bId, bEmail);
		request.setAttribute("passwd", resultPw);
		System.out.println(resultPw);
	}

}
