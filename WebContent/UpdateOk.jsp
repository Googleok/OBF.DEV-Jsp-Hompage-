<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<title>OBF.Dev/Update OK</title>


</head>

<body>
	<!--페이지 최상단 -->
	<header id="header" text-align="center" class="alt">

		<div class="logo">
			<a href="Main.jsp" style="font-family: 'Pacifico', cursive;"><span>OBF.Dev</span></a>

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

			<li><a href="List.do">Community</a></li>
			<!--.jsp로 할 경우 java로 넘어가지 않음  -->
			<li><a href="Book.jsp">BOOK</a></li>
			<li><a href="Study_planning.jsp">Study Planning</a></li>
			<li><a href="Java_api.jsp">API</a></li>
			<li><a href="QA.jsp">CHAT</a></li>
		</ul>
	</nav>


	<div id="titleunder" class="titleunder">Update OK</div>
	<hr color=#F2F2F2>




	<div align="center">
		<h1>회원정보 수정 완료!</h1>
		<a class="btn btn-primary btn-lg" id="updateok_btn" href="Main.jsp"
			role="button">HOME</a>

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