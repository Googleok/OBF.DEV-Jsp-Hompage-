package com.javalec.ex.book_command;

import java.util.ArrayList;

//import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.BDao_Book;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.BDto_book;

public class BListCommand_book implements BCommand_book {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BDao_Book dao = new BDao_Book();
		ArrayList<BDto_book> dtos = dao.list();
		request.setAttribute("list", dtos);
	}
}