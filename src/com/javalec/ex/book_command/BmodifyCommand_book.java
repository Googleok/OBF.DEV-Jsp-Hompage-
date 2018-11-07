package com.javalec.ex.book_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.BDao_Book;

public class BmodifyCommand_book implements BCommand_book {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		BDao_Book  dao = new BDao_Book();
		dao.modify(bId, bName, bTitle, bContent);
			
	}

}
