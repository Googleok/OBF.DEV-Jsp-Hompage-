<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link href="Main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>OBF.Dev/Chat</title>
</style>
</head>

<body>


	<!--페이지 최상단 -->
	<header id="header" text-align="center" class="alt">
		<div class="logo">
			<a href="Main.jsp"><span>OBF.Dev</span></a>
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
			<li><a href="QA.jsp">Chat</a></li>
		</ul>
	</nav>

	<section id="banner" data-video="images/banner_chat">
		<div class="inner">
			<h1>Chat</h1>
			<p id="blog">
				This is created for Developer<br />
				<!--링크를 팝업 창으로 바꾸다-->
				Realization, it is not an answer, it is a question.
			</p>
			<a id="getstarted" href="#titleunder" class="button special scrolly">Get
				Started</a>
		</div>
	</section>

	<!-- 네비게이션 바 아래 타이틀-->
	<div id="titleunder" class="titleunder">Q&A</div>
	<hr color=#F2F2F2>

	<embed align="center" height="700" width="100%"
		src="http://www.gagalive.kr/livechat1.swf?chatroom=obf"
		http://www.gagalive.kr/livechat1.swf?chatroom=obf&notify=true></embed>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- footer -->
	<footer class="footer">
		<h2></h2>
		<div class="footer_div">
			<p>©OBF.Dev All rights reserved</p>
			<p>developed by SungUk Park, SeungYeon Lee, JongWon Lee, JongEok
				Park</p>
		</div>
	</footer>
</body>
</html>