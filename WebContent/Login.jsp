<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link href="Main.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>OBF.Dev/Login</title>




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
			<div>
				<%=session.getAttribute("login")%>님 환영합니다.

				<!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
				<div class="top_label">
					<span><input type="button" value="Logout" align="right"
						class="btn btn-default" onclick="location='Logout.jsp'"></span> <span><input
						type="button" value="Mypage" align="right" class="btn btn-default"
						onclick="location='MyPage.jsp'"></span>
				</div>
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

	<div id="titleunder" class="titleunder">Login</div>

	<hr color=#F2F2F2>


	<div align="center">

		<form name="form1" action="Login.do" method="post" id="inlo"
			class="inlo">
			<table>
				<tr align=center>
					<td><input type="text" NAME="userid" ID="userid" size="40"
						maxlength="20" placeholder="아이디"></td>
				</tr>
				<tr align=center>
					<td><input type="password" name="passwd" ID="passwd" size="40"
						maxlength=20 placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td width="100%" align="center"><input type="submit"
						value="Login" class="btn_join" id="lo"></td>
				</tr>
				<tr>
					<td align="center" class="btn_join" id="search_all"><a
						href="Join.jsp" id="search_font">회원가입 |</a> <a
						href="Search_id.jsp " id="search_font">아이디 찾기 |</a> <a
						href="Search_pw.jsp" id="search_font">비밀번호 찾기</a></td>
				</tr>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br>

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

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>


</body>
</html>
