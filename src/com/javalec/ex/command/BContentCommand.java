package com.javalec.ex.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.BDto_reply;

public class BContentCommand implements BCommand {

	@Override
	public void execute (HttpServletRequest request, HttpServletResponse response) {
		String bId = request.getParameter("bId");
	      BDao dao = new BDao();
	      BDto dto = dao.contentView(bId);
	      ArrayList<BDto_reply> dtos = dao.replyList(bId);
	      System.out.println(bId);
	      request.setAttribute("View_content", dto);
	      request.setAttribute("dtos", dtos);
	}

}
