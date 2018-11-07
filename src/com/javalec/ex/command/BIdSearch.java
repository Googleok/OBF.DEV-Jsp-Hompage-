package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;

public class BIdSearch implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bName = request.getParameter("name");
		String bEmail = request.getParameter("email");
		String resultId=null;
		
		BDao dao = new BDao();
		resultId=dao.idSearch(bName, bEmail);
		request.setAttribute("name", resultId);
		System.out.println(resultId);
	}

}
