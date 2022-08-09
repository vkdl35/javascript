<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 받기 (POST + GET)</title>
</head>
<body>
	<%= new java.util.Date() %>
	<%
		//post로 전송시 해당 문법을 사용해야함
		request.setCharacterEncoding("UTF-8");
		//get 전송시 server.xml에 URIEncoding="UTF-8" 사용시 인코딩을 하지 않아도 한글이 꺠지지 않음
	%>
	<%=request.getParameter("mid") %>
</body>
</html>