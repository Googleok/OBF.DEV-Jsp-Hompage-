<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.ex.dao.BDao"%>
<%@page import="com.javalec.ex.dto.BDto"%>

<%@page import="com.javalec.ex.dao.BDao_Book"%>
<%@page import="com.javalec.ex.dto.BDto_book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="Main.css" rel="stylesheet" type="text/css">

<style>
	@import url('https://fonts.googleapis.com/css?family=Volkhov');
</style>


<meta charset="utf-8">
<title>OBF.Dev</title>


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
					type="button" value="Mypage" align="right" class="btn btn-default"
					onclick="location='MyPage.jsp'"></span>
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
			<li><a href="Java_api.jsp">API</a></li>
			<li><a href="QA.jsp">CHAT</a></li>
		</ul>
	</nav>

	<section id="banner" data-video="images/banner">
		<div class="inner">
			<h1>Of the developer. By the developer. For the developer</h1>
			<p id="blog">
				This is created for Developer<br />
				<!--링크를 팝업 창으로 바꾸다-->
				Created by Bit 6th' <a href="http://shrtorznzl.tistory.com/">SungUk
					Park, </a> <a href="http://winkitee.tistory.com/">SeungYeon Lee, </a><a
					href="http://payjay.tistory.com/">JongWon Lee and </a><a
					href="http://coalnam.tistory.com/">JongEok Park</a>
			</p>
			<a id="getstarted" href="#section_1" class="button special scrolly">Get
				Started</a>
		</div>
	</section>

	<!-- section_1 -->
	<section class="section_1" id="section_1">
		<div class="box">
			<div class="image fit">
				<img src="images/pic_1.jpg" alt="" />
			</div>
			<div class="content">
				<header class="align-center">
					<h2>" What is this? "</h2>
					<p>this app provides the fastest way you can be powerful
						developer</p>
				</header>
				<hr style="border: solid 0.5px black;">
				<p>This Web App is developed for person who want to be developer
					like you!</p>
			</div>
			<div id="blockquote_1">
				<p id="blockquote_p">What you can do</p>
				</br>
				<blockquote>
					<BIG><BIG>First.</BIG></BIG> You can make a plan in [Study
					Planning] menu. You can always see the schedule you planned on your
					computer.</BR> <BIG><BIG>Second.</BIG></BIG> You can ask questions and
					get feedback on you knowledge through bulletin boards or chat.</br> <BIG><BIG>Third.</BIG></BIG>
					Many people will help you study in a variety ways like recommending
					books, answer your questions.
				</blockquote>
			</div>
		</div>
	</section>




	<!-- section_2 -->
	<section class="section_2"
		style="background-image: url(images/pic01.jpg);">
		<div class="inner" id="inner"
			style="background-color: rgba(0, 0, 0, 0.5);">
			<div id="flexgrid">
				<div id="flexgrid_text">
					<header>
						<!-- recent post===================================== -->
						<h3 style="color: white">Recent Post</h3>
					</header>
					<p>
						<br> <br> <br>

						<%
							SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

							int pageSize = 5; // 한 페이지에 출력할 레코드 수

							// 페이지 링크를 클릭한 번호 / 현재 페이지
							String pageNum = request.getParameter("pageNum");
							if (pageNum == null) { // 클릭한게 없으면 1번 페이지
								pageNum = "1";
							}
							// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
							int currentPage = Integer.parseInt(pageNum);

							// 해당 페이지에서 시작할 레코드 / 마지막 레코드
							int startRow = (currentPage - 1) * pageSize + 1;
							int endRow = currentPage * pageSize;

							int count = 0;
							int fCount = 0;

							BDao dao = new BDao();
							count = dao.getCount(); // 데이터베이스에 저장된 총 갯수

							ArrayList<BDto> list = null;

							if (count > 0) {
								// getList()메서드 호출 / 해당 레코드 반환
								list = dao.getList(startRow, endRow);
							}
						%>


					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						align="center">

						<%
							if (count > 0) { // 데이터베이스에 데이터가 있으면
								int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
								for (int i = 0; i < list.size(); i++) {
									BDto board = list.get(i); // 반환된 list에 담긴 참조값 할당
						%>
		
		<tr align="center">
			<td align="center">
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%> 
					<c:forEach begin="1" end="<%=board.getbIndent()%>">&nbsp&nbsp&nbsp [reply] :</c:forEach>
					<a
								href="View_content.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>"
								style="color: white;">&nbsp<%=board.getbTitle()%></a>
			</td>
		</tr>
		<%
			}
			} else if (count == 0) { // 데이터가 없으면
		%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
			<br>
			<%
				}
			%>
		
	</table>
					</p>
					
					<a href="List.jsp" class="button alt">More</a>
				</div>

				<div>
					<header> <!-- recent post===================================== -->
						<h3 style="color: white">Recent Recommended Book</h3>
					</header>			
					<p>
					<br>
					<br>
					<br>
													
<%
														SimpleDateFormat df2 = new SimpleDateFormat("YY-MM-dd HH:mm");

														int pageSize2 = 5; // 한 페이지에 출력할 레코드 수

														// 페이지 링크를 클릭한 번호 / 현재 페이지
														String pageNum2 = request.getParameter("pageNum");
														if (pageNum2 == null) { // 클릭한게 없으면 1번 페이지
															pageNum2 = "1";
														}
														// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
														int currentPage2 = Integer.parseInt(pageNum2);

														// 해당 페이지에서 시작할 레코드 / 마지막 레코드
														int startRow2 = (currentPage2 - 1) * pageSize2 + 1;
														int endRow2 = currentPage2 * pageSize2;

														int count2 = 0;

														BDao_Book dao2 = new BDao_Book();
														count2 = dao2.getCount(); // 데이터베이스에 저장된 총 갯수

														ArrayList<BDto_book> list2 = null;

														if (count2 > 0) {
															// getList()메서드 호출 / 해당 레코드 반환
															list2 = dao2.getList(startRow, endRow);
														}
													%>
							
				<%
												if (count2 > 0) { // 데이터베이스에 데이터가 있으면
													int number = count2 - (currentPage2 - 1) * pageSize2; // 글 번호 순번 
													for (int i = 0; i < list2.size(); i++) {
														BDto_book board = list2.get(i); // 반환된 list에 담긴 참조값 할당
														if (board.getLanguage().equals("java")) {
											%>
		
		<tr align="center">
			<td align="center">
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%> 
					<c:forEach begin="1" end="<%=board.getbIndent()%>">&nbsp&nbsp&nbsp [reply] :</c:forEach>
					<a
								href="book_content_view.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>"
								style="color: white;">&nbsp<%=board.getbTitle()%></a><br>
			</td>
		</tr>
		<%
			}
				}
			} else if (count2 == 0) { // 데이터가 없으면
		%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
			<br>
			<%
				}
			%>	
			
				
					</p>
					<a href="Book.jsp" class="button alt">More</a>
				</div>
			<div align="center">
			<h3>Notify</h3><br><br><br><br>
			<p>예비 개발자들을 위해 새로 만든 사이트입니다.</p>
			<p>우리 사이트 많이 찾아주세요.</p>
			</div>
			</div>
		</div>
	</section>

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
<script type="text/javascript">
window.open("audio.jsp",  "audio", "width=300, height=360");
</script>
</body>


</html>