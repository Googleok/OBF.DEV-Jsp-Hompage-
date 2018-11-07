<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<title>OBF.Dev/Book Parsing</title>
</head>
<body>

	<h1>파싱 페이지</h1>

	<%
		String api = request.getParameter("api");
		String key = request.getParameter("key");
		String query = URLEncoder.encode(request.getParameter("query"), "UTF-8");
		String url = api + "?" + key + "&" + "query=" + query;
	%>

	<%
		request.setAttribute("url", url);
	%>

	<%=request.getAttribute("url")%>

	<jsp:forward page="/superman">
		<jsp:param value="" name="" />
	</jsp:forward>

</body>
</html>