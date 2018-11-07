package com.javalec.ex.frontcontroler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.catalina.util.SessionConfig;

import com.javalec.ex.book_command.BCommand_book;
import com.javalec.ex.book_command.BContentCommand_book;
import com.javalec.ex.book_command.BDeleteCommand_book;
import com.javalec.ex.book_command.BListCommand_book;
import com.javalec.ex.book_command.BReplyCommand_book;
import com.javalec.ex.book_command.BReplyViewCommand_book;
import com.javalec.ex.book_command.BWriteCommand_book;
import com.javalec.ex.book_command.BmodifyCommand_book;
import com.javalec.ex.command.BCommand;
import com.javalec.ex.command.BContentCommand;
import com.javalec.ex.command.BDeleteCommand;
import com.javalec.ex.command.BIdSearch;
import com.javalec.ex.command.BJoinCommand;
import com.javalec.ex.command.BListCommand;
import com.javalec.ex.command.BLoginCommand;
import com.javalec.ex.command.BModifyCommand;
import com.javalec.ex.command.BPwSearch;
import com.javalec.ex.command.BReplyActionCommand;
import com.javalec.ex.command.BReplyCommand;
import com.javalec.ex.command.BReplyViewCommand;
//import com.javalec.ex.command.BReplyWriteAction;
import com.javalec.ex.command.BUpdateCommand;
import com.javalec.ex.command.BWriteCommand;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("actionDo");

		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		BCommand command = null;
		BCommand_book bcommand = null;

		String uri = request.getRequestURI(); // URL 받음
		String conPath = request.getContextPath(); // contextpath url 자름
		String com = uri.substring(conPath.length()); //

		System.out.println(com);

		if (com.equals("/View_write.do")) {
			viewPage = "View_write.jsp";
		} else if (com.equals("/Write.do")) {
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "List.do";
		} else if (com.equals("/List.do")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "List.jsp";
		} else if (com.equals("/View_content.do")) {
			command = new BContentCommand();
			command.execute(request, response);
			viewPage = "View_content.jsp";
		} else if (com.equals("/Modify.do")) {
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "List.do";
		} else if (com.equals("/Delete.do")) {
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "List.do";
		} else if (com.equals("/View_replay.do")) {
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage = "View_replay.jsp";
		} else if (com.equals("/Reply.do")) {
			command = new BReplyCommand();
			command.execute(request, response);
			viewPage = "List.do";
		} else if (com.equals("/Join.do")) {
			command = new BJoinCommand();
			command.execute(request, response);
			viewPage = "JoinOk.jsp"; // 무엇?
		} else if (com.equals("/Login.do")) {
			command = new BLoginCommand();
			command.execute(request, response);
			String ok = (String) request.getAttribute("login_ok");
			if (ok.equals("ok")) {
				viewPage = "Main.jsp";
			} else {
				viewPage = "LoginFail.jsp";
			}
		} else if (com.equals("/Search_id.do")) {
			command = new BIdSearch();
			command.execute(request, response);
			viewPage = "Search_id.jsp";
		} else if (com.equals("/Search_pw.do")) {
			command = new BPwSearch();
			command.execute(request, response);
			viewPage = "Search_pw.jsp";
		} else if (com.equals("/Update.do")) {
			command = new BUpdateCommand();
			command.execute(request, response);
			viewPage = "UpdateOk.jsp";
		} else if (com.equals("/replyAction.do")) {
			command = new BReplyActionCommand();
			command.execute(request, response);
			viewPage = "View_content.do";
		} else if (com.equals("/book_write_view.do")) {
			viewPage = "book_write_view.jsp";
		} else if (com.equals("/book_write.do")) {
			bcommand = new BWriteCommand_book();
			bcommand.execute(request, response);
			viewPage = "Book.jsp";
		} else if (com.equals("/book_content_view.do")) {
			bcommand = new BContentCommand_book();
			bcommand.execute(request, response);
			viewPage = "book_content_view.jsp";
		} else if (com.equals("/book_modify.do")) {
			bcommand = new BmodifyCommand_book();
			bcommand.execute(request, response);
			viewPage = "Book.jsp?page=book_java";
		} else if (com.equals("/book_delete.do")) {
			bcommand = new BDeleteCommand_book();
			bcommand.execute(request, response);
			viewPage = "Book.jsp";
		} else if (com.equals("/book_reply_view.do")) {
			bcommand = new BReplyViewCommand_book();
			bcommand.execute(request, response);
			viewPage = "book_reply_view.jsp";
		} else if (com.equals("/book_reply.do")) {
			bcommand = new BReplyCommand_book();
			bcommand.execute(request, response);
			viewPage = "Book.jsp";
		} else if (com.equals("/book_list.do")) {
			bcommand = new BListCommand_book();
			bcommand.execute(request, response);
			viewPage = "Book.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
