<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OBF.Dev/View Replay</title>




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

	<div id="titleunder" class="titleunder">View Reply</div>
	<hr color=#F2F2F2>




	<!-- =table===================================================================================================== -->

	<form action="Reply.do" method="post">
		<div id="view_all" class="view_all">
			<div id="view_all_table">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center" id="view_replay">

					<input type="hidden" name="bId" value="${View_replay.bId}">
					<input type="hidden" name="bGroup" value="${View_replay.bGroup}">
					<input type="hidden" name="bStep" value="${View_replay.bStep}">
					<input type="hidden" name="bIndent" value="${View_replay.bIndent}">


					<tr>
						<td align="center" height="50px"><b>번호</b></td>
						<td>${View_replay.bId}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>조회수</b></td>
						<td>${View_replay.bHit}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>이름</b></td>
						<td style="width: 1100px;"><input type="text" name="bName"
							value="${View_replay.bName}" style="width: 1100px; height: 50px;"></td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>제목</b></td>
						<td><input type="text" name="bTitle"
							value="${View_replay.bTitle}"
							style="width: 1100px; height: 50px;"></td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>내용</b></td>
						<td style="width: 1100px;"><textarea rows="10"
								name="bContent" style="width: 1100px; height: 500px;">${View_replay.bContent}</textarea></td>
					</tr>


				</table>
			</div>
		</div>
		<br>
		<div align="center">
			<button type="button" onclick="location.href='List.do'"
				class="btn btn-danger">목록으로</button>
			<input type="submit" value="답글" class="btn btn-danger">

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