<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Main.css" rel="stylesheet" type="text/css">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<title>OBF.Dev/Book View Write</title>



<script type="text/javascript">

	function validate(){
		if(nameValidate()&&titleValidate()){
		    return true;
		  }
		  else{
		    return false;
		  }
		
	}
	
	// name 유효성검사
	function nameValidate(){
	  var nameCheck =/^[a-zA-Z0-9가-힣]{4,12}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
	  var objName = document.getElementById("bName");
	  var nameOK = nameCheck.exec(objName.value);
	  if(nameOK){
	    return true;
	  }else{
		 alert("작성자를 기입해주십시오.");
	     return false;
	  }
	}

	// title 유효성검사
	function titleValidate(){
	  var titleCheck =/^[a-zA-Z0-9가-힣~!@#$%^&*()-_=+\|[]{};:,.<>/?]{4,50}$/;
	  var objTitle = document.getElementById("bTitle");
	  var titleOK = titleCheck.exec(objTitle.value);
	  if(titleOK){
	    return true;
	  }else{
		 alert("제목을 기입해주십시오.");
	     return false;
	  }
	}
	
	// content 유효성검사
	function contentValidate(){
	  var contentCheck =/^[a-zA-Z0-9가-힣]{4,1000}$/;  // 소문자, 대문자, 숫자 4자리에서~12자리까지 입력가능
	  var objContent = document.getElementById("bContent");
	  var contentOK = contentCheck.exec(objContent.value);
	  if(contentOK){
	    return true;
	  }else{
		 alert("내용을 입력해주십시오.");
	     return false;
	  }
	}

</script>



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
		<div class="top_label">
			<span><input type="button" value="Login" align="right"
				class="btn btn-default" onclick="location='login.jsp'"></span> <span><input
				type="button" value="sign up" align="right" class="btn btn-default"
				onclick="location='join.jsp'"></span>
		</div>
		<%
			} else {
		%>
		<%=session.getAttribute("login")%>님 환영합니다.

		<!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
		<div class="top_label">
			<span><input type="button" value="Logout" align="right"
				class="btn btn-default" onclick="location='logout.jsp'"></span> <span><input
				type="button" value="my_Page" align="right" class="btn btn-default"
				onclick="location='my_page.jsp'"></span>
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

	<div id="titleunder" class="titleunder">Book View Write</div>
	<hr color=#F2F2F2>







	<!-- table================================================================ -->

	<form action="book_write.do" method="post"
		onsubmit="return validate();">
		<div id="view_all" class="view_all">
			<div id="writebox" class="writebox">


				<!-- 선택한 책 나타나는 table -->
				<table id="selected_bookarea" align="center">
					<%
						request.setCharacterEncoding("utf-8");
						String bookNum = request.getParameter("num7");
						String bookUrl = request.getParameter("bookUrl" + bookNum);
						String bookSelect = request.getParameter("bookSelect" + bookNum);
						if (bookSelect == null) {

						} else {
					%>
					<tr>
						<td><img src="<%=bookUrl%>" height="277" width="180"></td>

						<td><textarea rows="18" cols="100" name="bookSelect" id="bookSelect">
						<%=bookSelect%>&nbsp;
					</textarea>&nbsp; <%session.setAttribute("book_image", bookUrl);}%></td>
					</tr>
				</table>



				<!-- 게시글 작성 table -->
				<table width="1300px" cellpadding="0" cellspacing="0" border="1"
					align="center" id="bookwritetb" class="bookwritetb">

					<tr>
						<td align="center" height="50px"><b>작성자</b></td>

						<td style="width: 1100px;"><input type="text" name="bName"
							size="50" style="width: 1100px; height: 50px;"
							value="<%=session.getAttribute("login")%>" id="bName"></td>
					</tr>

					<tr>
						<td align="center" height="50px"><b>언어</b></td>

						<td style="width: 1100px;"><input type="text"
							name="blanguage" size="50" style="width: 1100px; height: 50px;"></td>
					</tr>

					<tr>
						<td align="center" height="50px"><b>추천책</b></td>

						<td style="width: 1100px;"><jsp:include
								page="book_search.jsp"></jsp:include></td>
					</tr>

					<tr>
						<td align="center" height="50px"><b>제목</b></td>

						<td style="width: 1100px;"><input type="text" name="bTitle"
							size="50" style="width: 1100px; height: 50px;" id="bTitle"></td>
					</tr>


					<tr>
						<td align="center" height="50px"><b>내용</b></td>

						<td style="width: 1100px;"><textarea name="bContent"
								rows="20" style="width: 1100px; height: 500px;" id="bContent"></textarea></td>
					</tr>

				</table>
			</div>
		</div>
		<br>
		<div align="center">
			<button type="button" onclick="location.href='book_list.do'"
				class="btn btn-danger">목록으로</button>
			&nbsp;&nbsp; <input type="submit" value="작성 완료"
				class="btn btn-danger">

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