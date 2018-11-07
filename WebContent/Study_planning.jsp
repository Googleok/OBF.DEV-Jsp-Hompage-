<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>OBF.Dev/Study_Planning</title>
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

			<!--로
			그인 시 로그아웃 버튼과 마이페이지 버튼 -->
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

	<section id="banner" data-video="images/banner_plan">
		<div class="inner">
			<h1>Study Planning</h1>
			<p id="blog">
				This is created for Developer<br />
				<!--링크를 팝업 창으로 바꾸다-->
				Luck is the residue of design.
			</p>
			<a id="getstarted" href="#titleunder" class="button special scrolly">Get
				Started</a>
		</div>
	</section>

	<div id="titleunder" class="titleunder">Study Planning</div>
	<hr color=#F2F2F2>
	<!--달력  -->
	<div id="cald" class="cald">
		<div id="calbox" class="calbox">
			<iframe
				src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=vlphosdoi87t1roh6h55m4318c%40group.calendar.google.com&amp;color=%2323164E&amp;ctz=Asia%2FSeoul"
				style="border-width: 0" width="100%" height="600" frameborder="0"
				scrolling="no"></iframe>
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