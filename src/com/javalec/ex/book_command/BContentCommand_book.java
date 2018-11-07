package com.javalec.ex.book_command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao_Book;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.BDto_book;
import com.javalec.ex.dto.BDto_reply;

public class BContentCommand_book implements BCommand_book {

	@Override
	public void execute (HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String bId = request.getParameter("bId");
		BDao_Book dao = new BDao_Book();
		BDto_book dto = dao.contentView(bId);
		ArrayList<BDto_reply> dtos = dao.replyList(bId);
		System.out.println(bId);
		request.setAttribute("book_content_view", dto);
		request.setAttribute("book_dtos", dtos);
	}

}
