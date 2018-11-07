<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Main.css" rel="stylesheet" type="text/css">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<title>OBF.Dev/Book View Content</title>
<style type="text/css">

</style>

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

	<div id="titleunder" class="titleunder">Book View Content</div>
	<hr color=#F2F2F2>

	<c:set var="bName" value="${book_content_view.bName}"></c:set>
	<div align="center">
		<%
			String bName = (String) pageContext.getAttribute("bName");
			out.print(bName);
			if (session.getAttribute("login").equals(bName)) {
		%>님의 게시글
	</div>
	<br>



	<!--========table==================================================================================  -->


	<form action="book_modify.do" method="post">
		<div id="view_all" class="view_all">
			<div id="view_all_table" align="center">
			<div>
				<img src="${book_content_view.image}" height="200" width="140">
				</div>
				<br>
				<textarea rows="13" cols="100" name="bookSelect" id="bookSelect">
		${book_content_view.description}
		</textarea>
		<br>
			

			<!-- table 게시글 작성 삭제 수정 답글 목록으로  -->
			<table width="1300px" cellpadding="0" cellspacing="0" border="1"
				align="center" id="contenttb">

				<input type="hidden" name="bId" value="${book_content_view.bId}">

				<tr>
					<td align="center" height="50px"><b>게시물번호</b></td>
					<td>${book_content_view.bId}</td>
				</tr>


				<tr>
					<td align="center" height="50px"><b>조회수</b></td>
					<td>${book_content_view.bHit}</td>
				</tr>

				<tr>
					<td align="center" height="50px"><b>이름</b></td>
					<td><input type="text" name="bName"
						value="${book_content_view.bName}"
						style="width: 1100px; height: 50px;"></td>
				</tr>


				<tr>
					<td align="center" style="width: 1100px; height: 50px;"><b>제목</b></td>
					<td><input type="text" name="bTitle"
						value="${book_content_view.bTitle}"
						style="width: 1100px; height: 50px;"></td>
				</tr>


				<tr>
					<td align="center" height="50px"><b>내용</b></td>
					<td><textarea rows="20" name="bContent"
							style="width: 1100px; height: 500px;">${book_content_view.bContent} </textarea></td>
				</tr>


			</table>
		</div>
		</div>
		<br>
		<div align="center">

			<button type="button" onclick="location.href='book_list.do' "
				class="btn btn-danger">목록으로</button>
			&nbsp;&nbsp; <input type="submit" value="수정" class="btn btn-danger">
			&nbsp;&nbsp;
			<button type="button"
				onclick="location.href='book_delete.do?bId=${book_content_view.bId}' "
				class="btn btn-danger">삭제</button>
			&nbsp;&nbsp;
			&nbsp;&nbsp;
		</div>
		<%
			} else {
		%>
		<img src="${book_content_view.image}" height="200" width="140">
		<textarea rows="13" cols="100" name="bookSelect" id="bookSelect"
			disabled="disabled">
		${book_content_view.description}
		</textarea>

		<!-- 댓글보기 =============================================== -->
		<div id="view_all" class="view_all">
			<div id="view_all_table">
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center">

					<input type="hidden" name="bId" value="${book_content_view.bId}">

					<tr>
						<td align="center" height="50px"><b>게시물번호</b></td>
						<td style="width: 1100px">${book_content_view.bId}</td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>조회수</b></td>
						<td>${book_content_view.bHit}</td>
					</tr>

					<tr>
						<td align="center" height="50px"><b>이름</b></td>
						<td><input type="text" name="bName"
							value="${book_content_view.bName}"
							style="width: 1100px; height: 50px;"></td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>제목</b></td>
						<td><input type="text" name="bTitle"
							value="${book_content_view.bTitle}"
							style="width: 1100px; height: 50px;"></td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>내용</b></td>
						<td><textarea rows="20" name="bContent"
								style="width: 1100px; height: 500px;">${book_content_view.bContent} </textarea></td>
					</tr>



				</table>
			</div>
		</div>

		<br>
		<div align="center">
			<button type="button" onclick="location.href='book_list.do' "
				class="btn btn-danger">목록으로</button>
			&nbsp;&nbsp;
			&nbsp;&nbsp;
		</div>
		<%
			}
		%>
	</form>

	<br>
	<br>
	<br>

	<!-- 댓글작성  -->
	<div id="replay" align="center">
		<div id="view_all" class="view_all">
			<div id="view_all_table" >
				<table width="1300" cellpadding="0" cellspacing="0" border="1" id="contenttb">
					<c:forEach items="${book_dtos}" var="dto">
						<tr>
							<td width="10%">${dto.name}</td>
							<td width="70%">${dto.reply}</td>
							<td width="20%">${dto.bDate}</td>
							<c:set var="reply" value="${dto.reply}"></c:set>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<form action="replyAction.do" method="post">
		<div id="view_all" class="view_all">
			
				<div align="center" id="view_all_table">
					<table border="1" width="1300" cellpadding="0" cellspacing="0" style="background-color: white">
						<tr>
							<td align="center" style="width: 1100px; height: 50px; ">게시물번호</td>
							<td><input type="text" value="${book_content_view.bId}"
								name="bId" style="width: 1100px; height: 50px;"></td>
						</tr>
						<tr>
							<td align="center" style="width: 1100px;">댓글</td>

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