<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Main.css" rel="stylesheet" type="text/css">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Main.css" rel="stylesheet" type="text/css">
<title>OBF.Dev/View Content</title>
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

	<div id="titleunder" class="titleunder">View Content</div>
	<hr color=#F2F2F2>

	<c:set var="bName" value="${View_content.bName}"></c:set>
	<div align="center">
		<%
			String bName = (String) pageContext.getAttribute("bName");
			out.print(bName);
			if (session.getAttribute("login").equals(bName)) {
		%>님의 게시글
	</div>
	<br>


	<!--========table==================================================================================  -->

	<form action="Modify.do" method="post">
		<div id="view_all" class="view_all">
			<div id="view_all_table">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center" id="contenttb">

					<input type="hidden" name="bId" value="${View_content.bId}">

					<tr>
						<td align="center" height="50px"><b>게시물번호</b></td>
						<td>${View_content.bId}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>조회수</b></td>
						<td>${View_content.bHit}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>이름</b></td>
						<td>${View_content.bName}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>제목</b></td>
						<td style="width: 1100px"><input type="text" name="bTitle"
							value="${View_content.bTitle}"
							style="width: 1100px; height: 50px;"></td>
					</tr>


					<tr>
						<td align="center"><b>내용</b></td>
						<td style="width: 1100px"><textarea rows="20" name="bContent"
								style="width: 1100px">${View_content.bContent} </textarea></td>
					</tr>


				</table>

			</div>
		</div>
		<br>
		<div align="center">

			<button type="button" onclick="location.href='List.do' "
				class="btn btn-danger">목록으로</button>
			&nbsp;&nbsp; <input type="submit" value="수정" class="btn btn-danger">
			&nbsp;&nbsp;
			<button type="button"
				onclick="location.href='Delete.do?bId=${View_content.bId}' "
				class="btn btn-danger">삭제</button>
			&nbsp;&nbsp;
			<button type="button"
				onclick="location.href='View_replay.do?bId=${View_content.bId}' "
				class="btn btn-danger">답글</button>
			&nbsp;&nbsp;
		</div>
		<%
			} else {
		%>
		<!-- 댓글 =============================================== -->
		<div id="view_all" class="view_all">
			<div id="view_all_table">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center" id="contenttb">

					<input type="hidden" name="bId" value="${View_content.bId}">

					<tr>
						<td align="center" height="50px"><b>게시물번호</b></td>
						<td style="width: 1100px">${View_content.bId}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>조회수</b></td>
						<td>${View_content.bHit}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>이름</b></td>
						<td>${View_content.bName}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>제목</b></td>
						<td>${View_content.bTitle}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>내용</b></td>
						<td>${View_content.bContent}</td>
					</tr>

				</table>
			</div>
		</div>
		<!-- 댓글 -->
		<br>
		<div align="center">
			<button type="button" onclick="location.href='List.do' "
				class="btn btn-danger">목록으로</button>
			&nbsp;&nbsp;
			<button type="button"
				onclick="location.href='View_replay.do?bId=${View_content.bId}' "
				class="btn btn-danger">답글</button>
			&nbsp;&nbsp;
		</div>
		<%
			}
		%>

	</form>

	<!-- table -->
	<br>
	<br>
	<br>
	<!--댓글작성한 거 보여주기================================================================= -->
	<div id="view_all" class="view_all">
		<div id="view_all_table">
			<div id="reply" align="center">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					id="contenttb">
					<c:forEach items="${dtos}" var="dto">
						<tr>
							<td align="center" width="10%" height="50px">${dto.name}</td>
							<td width="70%" height="50px">${dto.reply}</td>
							<td align="center" width="20%" height="50px">${dto.bDate}</td>
							<c:set var="reply" value="${dto.reply}"></c:set>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
	<br>
	<br>
	<br>

	<!--댓글작성================================================================= -->

	<form action="replyAction.do" method="post">
		<div id="replytb_div">
			<div align="center">
				<table border="1" width="1300px" cellpadding="0" cellspacing="0"
					id="contenttb">
					<tr>
						<td align="center" height="50px"><b>게시물번호</b></td>


						<td style="width: 1100px;"><input type="text"
							value="${View_content.bId}" name="bId"
							style="width: 1100px; height: 50px;"></td>
					</tr>
					<tr>
						<td align="center" style=""><b>댓글</b></td>

						<td style="width: 1100px;"><textarea rows="5" name="bReply"
								style="width: 1100px; height: 50px;"></textarea></td>
					</tr>
				</table>
			</div>
		</div>
		<br>
		<div align="center">

			<td align="center" width="5%"><input type="submit" value="댓글 작성"
				class="btn btn-danger"></td>
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