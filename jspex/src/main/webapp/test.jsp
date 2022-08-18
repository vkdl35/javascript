<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include</title>
</head>
<body>
<%
		String uri = (String)request.getParameter("sign").intern();
		out.print(uri);
		if(uri=="js2"){
%>
<span>
<jsp:include page="./js2.jsp"></jsp:include>
</span>
<% 
}
else if(uri=="js1"){
%>
<span>
<jsp:include page="./js1.jsp"></jsp:include>
</span>
<% } %>

</body>
</html>