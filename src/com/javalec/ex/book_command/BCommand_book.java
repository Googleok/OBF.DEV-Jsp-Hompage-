package com.javalec.ex.book_command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BCommand_book {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
	
}