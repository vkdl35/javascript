<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 받기 (FORM)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%=request.getParameter("mid") %>
</body>
</html>