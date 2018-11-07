<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<title>OBF.Dev/View Write</title>


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

	<a href="#menu" class="me"><span>Menu</span></a> </header>


	<!-- 네비게이션 바 -->
	<nav id="menu">
	<ul class="nav-bar">
		<li><a href="Main.jsp">Main</a></li>
		<li><a href="List.do">Community</a></li>
		<!--.jsp로 할 경우 java로 넘어가지 않음  -->
		<li><a href="Book.jsp">BOOK</a></li>
		<li><a href="Study_planning.jsp">Study Planning</a></li>
		<li><a href="Java_api.jsp">API</a></li>
		<li><a href="QA.jsp">CHAT</a></li>
	</ul>
	</nav>

	<div id="titleunder" class="titleunder">View Write</div>
	<hr color=#F2F2F2>




	<form action="Write.do" method="post">
		<div id="view_all" class="view_all">
			<div id="writebox" class="writebox">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center" id="writetb" class="writetb">

					<tr>
						<td align="center" height="50px"><b>작성자</b></td>
						<td><input type="text" name="bName"
							style="width: 1100px; height: 50px;"
							value="<%=session.getAttribute("login")%>"></td>
					</tr>

					<tr>
						<td align="center" height="50px"><b>제목</b></td>
						<td style="width: 1100px;"><input type="text" name="bTitle"
							style="width: 1100px; height: 50px;"></td>
					</tr>

					<tr>
						<td align="center" height="500px"><b>내용</b></td>
						<td style="width: 1100px;"><textarea name="bContent"
								rows="20" style="width: 1100px; height: 500px;"></textarea></td>
					</tr>




				</table>
			</div>


			<br>

			<div align="center">
				<button type="button" class="btn btn-danger"
					onclick="location.href='List.do'">목록으로</button>
				<input type="submit" class="btn btn-danger" value="작성 완료">
				&nbsp;&nbsp;

			</div>
		</div>
	</form>


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