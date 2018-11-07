package com.javalec.ex.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.dao.BDao;

public class BUpdateCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bId = request.getParameter("userID");
		String bPasswd = request.getParameter("passwd");
		String bName = request.getParameter("name");
		String bEmail = request.getParameter("email");
		String bAddress = request.getParameter("address1")+" "+request.getParameter("address2")+" "+request.getParameter("address3")+" "+request.getParameter("address4");
		String bJumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
		String bBirth = request.getParameter("year")+request.getParameter("month")+request.getParameter("day");
		
		BDao dao = new BDao();
		dao.update(bId, bPasswd, bName, bEmail, bAddress, bJumin, bBirth);
	}

}
