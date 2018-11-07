package com.javalec.ex.book_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.ex.dao.BDao;

public class BReplyActionCommand_book implements BCommand_book{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String reply = request.getParameter("bReply");
		String bId = request.getParameter("bId");
		HttpSession session = request.getSession();
		String name=(String)session.getAttribute("login");
		
		BDao dao = new BDao();
		dao.replyAction(name, reply, bId);
		
	}

}
