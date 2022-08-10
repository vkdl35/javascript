<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>ex21.jsp 리턴 콜</p>
<%
String mid2 = request.getParameter("mid");
String mname2 = request.getParameter("mname");
String c = request.getParameter("c");
String d = "ex21_2에 대한 값";	
%>
<%=mid2%><br>
<%=mname2%><br>
<%=c%><br>
</body>
</html>