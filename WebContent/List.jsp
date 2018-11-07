<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.ex.dao.BDao"%>
<%@page import="com.javalec.ex.dto.BDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">

<link href="Main.css" rel="stylesheet" type="text/css">
<title>OBF.Dev/List</title>

<%
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

	String sel = request.getParameter("sel"); // 검색 옵션의 value
	String find = request.getParameter("find"); // 검색어 value

	int pageSize = 10; // 한 페이지에 출력할 레코드 수

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

	fCount = dao.getfCount(sel, find); // DB에 저장된 검색어와 일치하는 총 갯수

	ArrayList<BDto> list = null;
	ArrayList<BDto> flist = null;

	if (count > 0 && find == null) {
		// getList()메서드 호출 / 해당 레코드 반환
		list = dao.getList(startRow, endRow);
	}

	if (fCount > 0) {
		flist = dao.getfList(startRow, endRow, sel, find);
	}
%>
<%-- 검색버튼 클릭시 유효성 검사 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#find").val() === "") {
				alert("검색어를 입력하세요.");
				$("#find").focus();
				return false;
			}
		})
	})
</script>

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

	<a href="#menu" class="me"><span>Menu</span></a> </header>

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


	<section id="banner" data-video="images/banner_community">
	<div class="inner">
		<h1>Community</h1>
		<p id="blog">
			This is created for Developer.<br />
			<!--링크를 팝업 창으로 바꾸다-->
			You can ask anything about Coding or something else. Share your
			information with others.

		</p>
		<a id="getstarted" href="#titleunder" class="button special scrolly">Get
			Started</a>
	</div>
	</section>

	<div align="center">
		<%
			String resultId = (String) session.getAttribute("login");

			if (resultId == null) {
		%>
		<div id="titleunder" class="titleunder">Community</div>
		<br> <br> <br>

		<div>
			<%
				out.println("로그인 후 이용 가능합니다.");
				} else {
			%>
		</div>

	</div>
	<div id="titleunder" class="titleunder">Community</div>
	<hr color=#F2F2F2>

	<br>
	<br>
	<div id="lita" class="lita">
		<div id="libox" class="libox">
			<table width="100%" height="500px" cellpadding="0" cellspacing="0"
				border="1" align="center">

				<tr align="center" height="65px">
					<td width="10%" align="center" style="font-size: 20px;"><b>번호</b></td>
					<td width="40%" align="center" style="font-size: 20px;"><b>제목</b></td>
					<td width="15%" align="center" style="font-size: 20px;"><b>이름</b></td>
					<td width="25%" align="center" style="font-size: 20px;"><b>날짜</b></td>
					<td width="10%" align="center" style="font-size: 20px;"><b>조회수</b></td>
				</tr>

				<%
					if (count > 0 && fCount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
							int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
							for (int i = 0; i < list.size(); i++) {
								BDto board = list.get(i); // 반환된 list에 담긴 참조값 할당
				%>

				<tr align="center">
					<td><%=number--%></td>
					<td align="center">
						<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%>
						<c:forEach begin="1" end="<%=board.getbIndent()%>">&nbsp&nbsp&nbsp [reply] :</c:forEach>
						<a
						href="View_content.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>">&nbsp<%=board.getbTitle()%></a>
					</td>
					<td><%=board.getbName()%></td>
					<td><%=df.format(board.getbDate())%></td>
					<td><%=board.getbHit()%></td>
				</tr>
				<%
					}
						} else if (count == 0) { // 데이터가 없으면
				%>
				<tr>
					<td colspan="6" align="center">게시글이 없습니다.</td>
				</tr>
				<%
					} else if (count > 0 && fCount != 0) { // 검색한 데이터가 있으면
							int number = fCount - (currentPage - 1) * pageSize; // 글 번호 순번
							for (int i = 0; i < flist.size(); i++) {
								BDto board = flist.get(i);
				%>
				<tr>
					<td><%=number--%></td>
					<td>
						<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%>
						<a
						href="View_content.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getbTitle()%></a>
					</td>
					<td><%=board.getbName()%></td>
					<td><%=df.format(board.getbDate())%></td>
					<td><%=board.getbHit()%></td>
				</tr>
				<%
					}
						} else { // 검색된 데이터가 없으면
				%>
				<tr>
					<td colspan="6" align="center">게시글이 없습니다.</td>
				</tr>
				<%
					}
				%>

				<tr>
					<td colspan="6" align="center">
						<%
							// 페이징  처리
								if (count > 0 && fCount == 0 && find == null) {
									// 총 페이지의 수
									int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
									// 한 페이지에 보여줄 페이지 블럭(링크) 수
									int pageBlock = 10;
									// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
									int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
									int endPage = startPage + pageBlock - 1;

									// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
									if (endPage > pageCount) {
										endPage = pageCount;
									}

									if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
						%> <a class="beforePage"
						href="List.do?pageNum=<%=startPage - 10%>">[이전]</a> <%
 	}

 			for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
 				if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
 %> <%=i%>&nbsp&nbsp <%
 	} else { // 현재 페이지가 아닌 경우 링크 설정
 %> <a class="nowPage" href="List.do?pageNum=<%=i%>"><%=i%>&nbsp&nbsp</a>
						<%
							}
									} // for end

									if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
						%> <a class="nextPage" href="List.do?pageNum=<%=startPage + 10%>">[다음]</a>
						<%
							}
								} else if (fCount > 0) { // 페이징 처리(검색 데이터)
									// 검색된 레코드의 총 페이지의 수
									int pageCount = fCount / pageSize + (fCount % pageSize == 0 ? 0 : 1);
									// 한 페이지에 보여줄 페이지 블럭(링크) 수
									int pageBlock = 10;
									// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
									int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
									int endPage = startPage + pageBlock - 1;

									// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
									if (endPage > pageCount) {
										endPage = pageCount;
									}

									if (startPage > pageBlock) {
						%> <a class="beforePage"
						href="List.do?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
						<%
							}

									for (int i = startPage; i <= endPage; i++) {
										if (i == currentPage) { // 현재 페이지는 링크를 설정하지 않음
						%> [<%=i%>] <%
							} else { // 현재 페이지가 아닌 경우 링크
						%> <a class="nowPage"
						href="List.do?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]
					</a> <%
 	}
 			}

 			if (endPage < pageCount) {
 %> <a class="nextPage"
						href="List.do?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>">[다음]</a>
						<%
							}
								}
						%>

					</td>
				</tr>

			</table>
		</div>
	</div>
	<%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>


	<div align="center">
		<form method="get" action="List.do">

			<select name="sel" class="find_op" id="find_op">
				<option value="bName">이름</option>
				<option value="bTitle">제목</option>
			</select> <input type="text" name="find" id="find"> <input
				type="submit" value="검색" class="btn btn-danger">
		</form>
		<button type="button" class="btn btn-danger"
			onclick="location.href='View_write.do'">게시물 작성</button>
	</div>

	<%
		}
	%>


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