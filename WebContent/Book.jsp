<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>OBF.Dev/Book</title>
</head>

<body>
	
	
	
	<!--페이지 최상단 -->
	<header id="header" text-align="center" class="alt" style="height:50px"">
		<div class="logo" >
			<a href="Main.jsp" style=""><span style="font-size:5rem; font-family: FontAwesome;">OBF.Dev</span></a>
		</div>
		
		
		
		
		
		<div class="loginout">
			<%
				if (session.getAttribute("login") == null) {
			%>
			<!--비로그인시 로그인 버튼과 가입 버튼 -->
			<div class="top_label" id="top_label">
				<span><input type="button" value="Login" align="right"
					class="btn btn-default" onclick="location='Login.jsp'"></span> <span><input
					type="button" value="sign up" align="right" class="btn btn-default"
					onclick="location='Join.jsp'"></span>
			</div>
			<%
				} else {
			%>
			<%=session.getAttribute("login")%>님 환영합니다.
			<!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
			<div class="top_label">
				<span><input type="button" value="Logout" align="right"
					class="btn btn-default" onclick="location='Logout.jsp'"></span> <span><input
					type="button" value="sign up" align="right" class="btn btn-default"
					onclick="location='Join.jsp'"></span>
			</div>
			<%
				}
			%>
		</div>
		<a href="#menu" class="me"><span>Menu</span></a>
	</header>
	<!-- 네비게이션 바 -->
	<nav id="menu">
		<ul class="nav-bar">
			<li><a href="Main.jsp">Main</a></li>
			<li><a href="List.do">Community</a></li>
			<!--.jsp로 할 경우 java로 넘어가지 않음  -->
			<li><a href="Book.jsp">BOOK</a></li>
			<li><a href="Study_planning.jsp">Study Planning</a></li>
			<li><a href="Java_api.jsp">JAVA API</a></li>
			<li><a href="QA.jsp">CHAT</a></li>
		</ul>
	</nav>


	<section id="banner" data-video="images/banner_book">
		<div class="inner">
			<h1  style="font-size:100px;">Book</h1>
			<p id="blog" style="font-size:30px;">
				This is created for Developer<br />
				<!--링크를 팝업 창으로 바꾸다-->
				The BOOK is the longest enjoyment at the lowest price.

			</p>
			<a id="getstarted" href="#titleunder" class="button special scrolly">Get
				Started</a>
		</div>
	</section>



	<div id="titleunder" class="titleunder">Book</div>
	<hr color=#F2F2F2>

	<div id="booktb">
		<%
			request.setCharacterEncoding("utf-8");
			String pageNow = request.getParameter("page");

			System.out.println("book.jsp에 " + session.getAttribute("language") + "이 넘어오네.");

			if (pageNow == null) {
				pageNow = "book_java";

				if (session.getAttribute("language") != null) {

					if (session.getAttribute("language").equals("java")) {
						pageNow = "book_java";
						System.out.println("pagenow : " + session.getAttribute("lan"));
					}

					if (session.getAttribute("language").equals("c")) {
						pageNow = "book_c";
						System.out.println("pagenow : " + session.getAttribute("lan"));
					}

					if (session.getAttribute("language").equals("cplus")) {
						pageNow = "book_cplus";
						System.out.println("pagenow : " + session.getAttribute("lan"));
					}

					if (session.getAttribute("language").equals("python")) {
						pageNow = "book_python";
						System.out.println("pagenow : " + session.getAttribute("lan"));
					}

				}

			}
		%>
		<div align="center">
			<table width="100%" height="700" border="1">

				<tr>
					<td rowspan="2" style="text-align: center"><a
						href="?page=book_java">Java</a><br> <br> <a
						href="?page=book_c">C</a><br> <br> <a
						href="?page=book_cplus">C++</a><br> <br> <a
						href="?page=book_python">Python</a><br> <br> <a>JavaScript</a><br>
						<br> <a>HTML</a><br> <br> <a>CSS</a><br> <br>
						<a>JSP</a><br> <br> <a>jQuery</a><br> <br> <a>Ajax</a><br>
						<br></td>
					<td width="10%" height="10%"><jsp:include
							page="book_search.jsp"></jsp:include></td>
				</tr>

				<tr>
					<td width="90%" height="90%"><jsp:include
							page='<%=pageNow + ".jsp"%>'></jsp:include></td>
				</tr>

			</table>
		</div>
	</div>
	<!-- footer -->
	<footer class="footer">
		<h2></h2>
		<div class="footer_div">
			<p>©OBF.Dev All rights reserved</p>
			<p>developed by SungUk Park, SeungYeon Lee, JongWon Lee, JongEok
				Park</p>
		</div>
	</footer>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>