<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isScriptingEnabled = "true" %>
<!-- isScriptingEnabled : 디렉티브 태그 사용 유/무 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - page 디렉티브2</title>
</head>
<body>
<%
	String name = "vkdl35";
	request.setAttribute("names", name);
%>
<input type="text" name="mid" value="<%=name %>" readonly="readonly">
<input type="text" name="mid2" value="${names}" readonly="readonly">
<br><br>
${requestScope.names} <!-- requestScope : 디렉티브 태그를 이용하여 값을 출력함 -->
</body>
</html>