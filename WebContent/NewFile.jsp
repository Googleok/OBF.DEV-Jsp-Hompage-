<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.ex.dao.BDao" %>
<%@page import="com.javalec.ex.dto.BDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
    <title>obf.dev</title>

   <style>

      /* 바디 */
      body{
        margin-left: 200px;
        margin-right: 200px;
        background-color: #F2F2F2;

      }

      /* 가입 버튼과 로그인 버튼 */
      .top_label{
        margin-top: 10px;
        margin-bottom: 10px;
        text-align: right;
      }


      /* 네비게이션 바 */
      .nav-bar{
        display: flex;
        flex-direction: row;
        width: 100%;
        margin: 0;
        padding: 0;
        background-color: darkslategrey;
        list-style-type: none;
    }

    /* 네비게이션 바 요소 */
    .nav-item{
      padding: 15px;
      cursor: pointer;
    }

    /* 링크 */
    .nav-item a{
      text-align: center;
      text-decoration: none;
      font-size: 20px;
      color: white;
    }

    /* 로고 위치 */
    .logo{
      padding: 60px 5px;
    }

    .header_1 div{
      height: 55px;
    }

    /* 로고 링크 */
    .a_logo{
      text-decoration: none;
      padding: 15px 25px;
      font-family: 'Alfa Slab One', cursive;
      font-weight: lighter;
      font-size: 50px;
      color: black;

    }



    .box {
        margin-bottom: 2rem;
        background: #FFF;
     }

        .box .content {
           padding: 3rem;
        }

      .content p{
        text-align: center;
        font-family: fantasy;
        font-size: 30px;
      }

    .align-center{
      text-align: center;
    }

    .align-center h2{
      font-family: fantasy;
      font-size: 70px;
    }

    .align-center p{
      font-family: fantasy;
      font-size: 50px;
    }

    .blockquote_1{
      margin: 40px;

    }

    .blockquote_1 blockquote{
      font-size: 25px;
      font-family: fantasy;
    }

    #blockquote_p{
      text-align: center;
      font-size: 50px;
    }

    .image {
      border: 0;
      display: inline-block;
      position: relative;
    }
    .image.fit {
         display: block;
         margin: 0 0 2rem 0;
         width: 100%;
      }

         .image.fit img {
            width: 100%;
         }


    .section_1{
      position: relative;
    }

    .section_2{
      background-image: url(bg.jpg);
      background-color: #000;
         color: #bfbfbf;
         background-size: cover;
         background-attachment: fixed;
         background-position: center;
         position: relative;

    }

    .sec2_div div{
      padding-bottom: 20px;
      color: white;
      border-style: solid;
         border-color: rgba(255, 255, 255, 0.25);

         text-align: center;
      background-color: rgba( 0, 0, 0, 0.5 );
    }

    .sec2_div a{
      text-align: center;

    }

    .button.alt{
      color: white;
      text-align: center;
      text-decoration: none;

    }


    .actions{
      list-style-type: none;
    }

    .footer_div{
      margin-top: 80px;
      margin-bottom: 80px;
      text-align: center;
    }

    </style>
    <%
   SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

    String sel = request.getParameter("sel"); // 검색 옵션의 value
   String find = request.getParameter("find"); // 검색어 value


    
   int pageSize = 10; // 한 페이지에 출력할 레코드 수

   // 페이지 링크를 클릭한 번호 / 현재 페이지
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null){ // 클릭한게 없으면 1번 페이지
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
   
   if(fCount > 0){
      flist = dao.getfList(startRow, endRow, sel, find);
   }
   
%>
<%-- 검색버튼 클릭시 유효성 검사 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   $(function(){
      $("form").submit(function(){
         if($("#find").val() === ""){
            alert("검색어를 입력하세요.");
            $("#find").focus();
            return false;
         }
      })
   })
</script>

</head>
<body>

<%
   if(session.getAttribute("login")==null){
%>
    <!--비로그인시 로그인 버튼과 가입 버튼 -->
    <div class="top_label">
      <span><input type="button" value="Login" align="right" class="btn btn-default" onclick="location='login.jsp'"></span>
      <span><input type="button" value="sign up" align="right" class="btn btn-default" onclick="location='join.jsp'"></span>
    </div>
<%
   }else{
%>
   <%=session.getAttribute("login") %>님 환영합니다.
   <!--로그인 시 로그아웃 버튼과 마이페이지 버튼 -->
    <div class="top_label">
      <span><input type="button" value="Logout" align="right" class="btn btn-default" onclick="location='logout.jsp'"></span>
      <span><input type="button" value="my_Page" align="right" class="btn btn-default" onclick="location='my_page.jsp'"></span>
    </div>
<%
   }
%>

  <!-- 페이지 가장 상단 -->
    <header id="header_1" class="header_1" text-align="center">
      <div class="logo" style="background-color:powderblue" ><a href="main_page.jsp" class="a_logo"><span>OBF.DEV</span></a> </div>
    </header>

    <!-- 네비게이션 바 -->
   <nav style="background-color:lightgreen">
        <ul id="nav-bar" class="nav-bar">
          <li class="nav-item"><a href="main_page.jsp">HOME</a></li>
          <li class="nav-item"><a href="list.do">Community</a></li>
          <li class="nav-item"><a href="Book.jsp">BOOK</a></li>
          <li class="nav-item"><a href="study_planning.jsp">Study Planning</a></li>
          <li class="nav-item"><a href="java_api.jsp">API</a></li>
          <li class="nav-item"><a href="Q&A.jsp">CHAT</a></li>
        <ul>
      </nav>
      
<%
   String resultId = (String)session.getAttribute("login");
   
   if(resultId==null){
      out.println("로그인 후 이용 가능합니다.");
   }else{
%>

         <!-- 페이지 섹션 -->
         <section id="section_1" style="background-color:orange">
            <div class="inner" >
               <h1>Community - Post list</h1>
            </div>
      </section>
          
          <hr>
<style>
    th{
     text-align: center;
     font-size: 17pt;
    }
    td{
       font-size: 15pt;
    }
    a {
        color: darkslategray;
        text-decoration: none;
    }
    a:hover { color: coral; }
    tr:nth-child(odd) {
       background-color: #D8D8D8;
    }
    
    .beforePage{
    
    }
    
    .nowPage{
   
    
    }
    
    .nowPage:hover{
       color: cyan;
       text-decoration: underline;
    }
    .nextPage{
    
    }
    
</style>
          
          <table width="100%" cellpadding="0" cellspacing="0" border="0" align = "center">
   
      <tr align="center">
         <th width="10%">번호</th>
         <th width="45%">제목</th>
         <th width="15%">이름</th>
         <th width="25%">날짜</th>
         <th width="5%">조회수</th>
      </tr>
      
      <%
            if (count > 0 && fCount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
               int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
               for (int i = 0; i < list.size(); i++) {
                  BDto board = list.get(i); // 반환된 list에 담긴 참조값 할당
      %>
      
      <tr align = "center">
         <td><%=number--%></td>
         <td align="left">
               <%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%> 
               <c:forEach begin="1" end="<%=board.getbIndent()%>">&nbsp&nbsp&nbsp [reply] :</c:forEach>
               <a href="content_view.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>">&nbsp<%=board.getbTitle()%></a>
         </td>
         <td><%=board.getbName()%></td>
         <td><%=df.format(board.getbDate())%></td>
         <td><%=board.getbHit()%></td>
      </tr>
      <%
               }
            } else if(count==0){ // 데이터가 없으면
         %>
         <tr>
            <td colspan="6" align="center">게시글이 없습니다.</td>
         </tr>
         <%
            } else if(count > 0 && fCount != 0){ // 검색한 데이터가 있으면
               int number = fCount - (currentPage - 1) * pageSize; // 글 번호 순번
               for(int i = 0; i<flist.size(); i++){
                  BDto board = flist.get(i);
         %>
         <tr>
            <td><%=number--%></td>
            <td>
               <%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%> 
               <a href="content_view.do?bId=<%=board.getbId()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getbTitle()%></a>
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
               <%   // 페이징  처리
                  if(count > 0 && fCount == 0 && find == null){
                     // 총 페이지의 수
                     int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
                     // 한 페이지에 보여줄 페이지 블럭(링크) 수
                     int pageBlock = 10;
                     // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                     int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                     int endPage = startPage + pageBlock - 1;
                     
                     // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                     if(endPage > pageCount){
                        endPage = pageCount;
                     }
                     
                     if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
               %>
                        <a class="beforePage" href="list.do?pageNum=<%=startPage - 10%>">[이전]</a>   
               <%         
                     }
                     
                     for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
                        if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
               %>
                           <%=i %>&nbsp&nbsp
               <%                           
                        }else{ // 현재 페이지가 아닌 경우 링크 설정
               %>
                           <a class="nowPage" href="list.do?pageNum=<%=i%>"><%=i %>&nbsp&nbsp</a>
               <%            
                           
                        }
                     } // for end
                     
                     if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
               %>
                        <a class="nextPage" href="list.do?pageNum=<%=startPage + 10 %>">[다음]</a>
               <%         
                     }
                  }else if(fCount > 0){ // 페이징 처리(검색 데이터)
                     // 검색된 레코드의 총 페이지의 수
                     int pageCount = fCount / pageSize + (fCount%pageSize == 0 ? 0 : 1);
                     // 한 페이지에 보여줄 페이지 블럭(링크) 수
                     int pageBlock = 10;
                     // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
                     int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
                     int endPage = startPage + pageBlock - 1;
                     
                     // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
                     if(endPage > pageCount){
                        endPage = pageCount;
                     }
                     
                     if(startPage > pageBlock){
               %>
                        <a class="beforePage" href="list.do?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>   
               <%         
                     }
                     
                     for(int i = startPage; i <= endPage; i++){
                        if(i == currentPage){ // 현재 페이지는 링크를 설정하지 않음
               %>
                        [<%=i%>]
               <%            
                        }else{ // 현재 페이지가 아닌 경우 링크
               %>
                        <a class="nowPage" href="list.do?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i %>]</a>
               <%            
                        }
                     }
                     
                     if(endPage < pageCount){
               %>
                        <a class="nextPage" href="list.do?pageNum=<%=startPage + 10 %>&sel=<%=sel%>&find=<%=find%>">[다음]</a>
               <%         
                     }
                  }
               %>

            </td>
         </tr>
      
   </table>
      <%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>

          
          <div align="center">
      <form method="get" action="list.do">
         <select name="sel">
            <option value="bName">이름</option>
            <option value="bTitle">제목</option>
         </select>
         <input type="text" name="find" id="find">
         <input type="submit" value="검색">
      </form>
      <button type="button" onclick="location.href='write_view.do'">게시물 작성</button>
      </div>
          
   <%
   }
   %>
   
     <!-- footer -->
      <footer class="footer">
        <h2></h2>
        <div class="footer_div">
          <p>©obf.dev.All rights reserved</p>
          <p>developed by Sung uk Park, Eung yeon Lee, Jong won Lee, Jong uk Park</p>
        </div>
      </footer>
   
</body>
</html>