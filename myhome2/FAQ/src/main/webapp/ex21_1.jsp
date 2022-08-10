<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP ex21.jsp 값을 전달 받음</title>
</head>
<body>
<%
	String mid = request.getParameter("mid");
	String mname = request.getParameter("mname");
	String c = request.getParameter("c");
%>
아이디 : <%=mid%>
고개명 : <%=mname%>
데이터 추가 : <%=c%>
<jsp:include page="./ex21_2.jsp">
<jsp:param value="연습입니다." name="c"/>
</jsp:include>
</body>
</html>