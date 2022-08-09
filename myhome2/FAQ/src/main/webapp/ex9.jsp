<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - SPA 응용</title>
</head>
<body>
	<%

		String gg = request.getParameter("g");
		if(gg!=null) {
	%>
		<table border="1">
		<%
			int g = Integer.parseInt(gg);
			for(int i=1; i<=9; i++) {
		%>
			<tr><td width=100 height=30><%=g %> * <%=i %> = <%=g*i %></td></tr>
		<% 
			}
		%>
		</table>
		
	<%			
		}
		else {
	%>
	<form name="f" id="f" method="post" action="./ex9.jsp">
		<select name="g">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
		</select>
		<input type="submit" value="전송">
	</form>
	<%
		}
	%>
</body>
</html>