<%@page import="com.javalec.ex.dto.BDto_book"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link href="Main.css" rel="stylesheet" type="text/css">
<title>OBF.Dev/Book Communuty</title>


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

         <!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
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
   <!-- <audio src="로이킴.mp3" autoplay controls loop volume></audio> -->

   <!-- 네비게이션 바 -->
   <nav id="menu">
      <ul class="nav-bar">
         <li><a href="Main.jsp">Main</a></li>
         <li><a href="List.do">Community</a></li>
         <!--.jsp로 할 경우 java로 넘어가지 않음  -->
         <li><a href="Book.jsp">BOOK</a></li>
         <li><a href="Study_planning.jsp">Study Planning</a></li>
         <li><a href="Java_api.jsp">API</a></li>
         <li><a href="QA.jsp">Q&A</a></li>
      </ul>
   </nav>

   <div id="titleunder" class="titleunder">Searching Result</div>
   <hr color=#F2F2F2>
   
   
   
   
   
   
   
   
   <div id="book_listviewdiv">
   
   <%
      ArrayList<BDto_book> bookList = (ArrayList<BDto_book>) request.getAttribute("bookList");
   %>

   <form action="book_write_view.jsp" method="post">
      <input type="text" name="num7" size="35"
         placeholder="순서대로 0~9중에서 선택해주세요."> <input type="submit"
         value="책 선택" class="btn btn-info"> <br><br>

      <%
         int num = 0;

         for (int i = 0; i < bookList.size(); i++) {
      %>
      
      <div id="book_listviewdiv_inner">
      <h2>[<%=i%>]</h2><br> <a href="<%=bookList.get(i).getLink()%>"><img
         src="<%=bookList.get(i).getImage()%>" height="150px" width="120px"></a><br>

      <% System.out.println(bookList.get(i).getTitle());%>
         
      <h2><%   out.println("제목 : " + bookList.get(i).getTitle() + "</br>");%></h2>
      <b><%   out.println("작가 : " + bookList.get(i).getAuthor() + "</br>");%></b>
      <b><%   out.println("출판일 : " + bookList.get(i).getPubDate() + "</br>");%></b><br>
      
      <b><%
         if (bookList.get(i).getDescription() != null) {
            out.println("설명 : " + bookList.get(i).getDescription() + "</br>");
         } else {
            out.println("설명 : 없음" + "</br>");
         }
      %></b>
      
      <br>
      <%
         out.println("별점 : " + bookList.get(i).getCustomerReviewRank() + "</br>");
         out.println("정가 : " + bookList.get(i).getPriceStandard() + "</br>");
         out.println("할인가 : " + bookList.get(i).getPriceSales() + "</br>");
         out.println("할인율 : " + bookList.get(i).getDiscountRate() + "</br>");
         out.println("판매 상태 : " + bookList.get(i).getSaleStatus() + "</br>");
      %>
      이미지 URL:<br><br></div>
      <textarea rows="" cols="100" name="bookUrl<%=i%>"
         style="display: none;">
<%=bookList.get(i).getImage()%>
</textarea>
      <br>
      
      
      
      
      
      
      
      
<textarea rows="10" cols="100" name="bookSelect<%=i%>" id="bookSelect" style="display: none;">

제목 : <%=bookList.get(i).getTitle()%>
작가 : <%=bookList.get(i).getAuthor()%>
출판일 : <%=bookList.get(i).getPubDate()%>
설명 : <%=bookList.get(i).getDescription()%>
별점 : <%=bookList.get(i).getCustomerReviewRank()%>
정가 : <%=bookList.get(i).getPriceStandard()%>
할인가 : <%=bookList.get(i).getPriceSales()%>
할인율 : <%=bookList.get(i).getDiscountRate()%>
판매 상태 : <%=bookList.get(i).getSaleStatus()%>
</textarea>
      <br>


      <%}%>
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

</div>
</body>
</html>