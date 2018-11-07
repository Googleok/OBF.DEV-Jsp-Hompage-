package com.javalec.ex.book_command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.BDao_Book;

public class BWriteCommand_book implements BCommand_book {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bkcontet = request.getParameter("bookSelect");
		String blanguage = request.getParameter("blanguage");
		HttpSession session = request.getSession();
		String bkImage=(String)session.getAttribute("book_image");
		BDao_Book dao = new BDao_Book();
		dao.write(bName, bTitle, bContent, bkcontet, bkImage, blanguage);
	}
}
