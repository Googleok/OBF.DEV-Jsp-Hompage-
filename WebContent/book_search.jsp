<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="boot/css/bootstrap.min.css" rel="stylesheet">
<link href="Main.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

<script type="text/javascript">
	function search() {

		var str = document.getElementById("query");

		var api = "http://book.interpark.com/api/search.api";
		var key = "key=3CF07010FBAA218CE2CBA696A9DAC40472E6908B8210B58355EAA585BB524CBB";
		var query = str.value;

		location.href = "book_parsing.jsp?api=" + api + "&key=" + key
				+ "&query=" + query;

	}
</script>

</head>
<body>

	<!-- 'search()'" -->

	<div align="center">
		<b>검색 할 책을 입력하세요 : </b><input type="text" id="query"> <input
			type="button" onclick="search()" value="검색" class="btn btn-info">
	</div>

</body>
</html>