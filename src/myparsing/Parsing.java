package myparsing;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.javalec.ex.dto.BDto_book;


@WebServlet("/superman")
public class Parsing extends HttpServlet {

	ArrayList<BDto_book> bookList;
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("doGet");
		parsing(request, response);
	}

	

	public void parsing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//URL이 잘 넘어왔는지 로그를 찍음
		request.setCharacterEncoding("utf-8");
		System.out.println("request객체에 담겨온 url : "+request.getAttribute("url"));
		String url = (String)request.getAttribute("url");
		System.out.println("String으로 파싱한 url : "+url);
		
		ParsingProcess pars = new ParsingProcess(url);
		try {
			this.bookList = pars.process();
		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
		

		
		request.setAttribute("bookList", bookList);
		RequestDispatcher rd = request.getRequestDispatcher("book_listView.jsp");
		rd.forward(request, response);

	}
	
	
	

}
