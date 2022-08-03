<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=Edge, chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그아웃</title>
</head>
<body>
	<%= session.getAttribute("pnm") %>
	<%= session.getAttribute("pid") %>
	<% session.invalidate(); %>	<!-- session값을 없앰 -->
</body>
<script>
	alert("정상적으로 로그아웃 되셨습니다.");
	location.href="./index.html";
</script>
</html>