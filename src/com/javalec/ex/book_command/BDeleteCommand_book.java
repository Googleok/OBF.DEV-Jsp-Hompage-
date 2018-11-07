package com.javalec.ex.book_command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.BDao_Book;

public class BDeleteCommand_book implements BCommand_book {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String bId = request.getParameter("bId");
		BDao_Book dao = new BDao_Book();
		dao.delete(bId);
		
	}

}
