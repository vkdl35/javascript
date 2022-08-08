<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 기본문법2 if문 (JS,HTML,JSP 문법)</title>
</head>
<body>
<%	//JSP 기초 if문
	int a = 20;
	int b = 10;
	if(a > b) {
		out.print(a+"가 "+b+"보다 큽니다.");
	}
	else if(a < b){
		out.print(b+"가 "+a+"보다 큽니다.");
	}
	else {
		out.print("두 값이 같습니다.");
	}
%>
<%
	String box="box1";
	if(box=="box1") {	//JSP는 .equals를 사용하지 않아도 됨
%>
<div style="background-color: red; width: 50px; height: 50px;"></div>
<% } else if(box=="box2") { %> 
<div style="background-color: orange; width: 50px; height: 50px;"></div>
<% } %>

<%
	String username="홍길동";
	int level = 5;
	int point = 200;
%>
<table border="1">
	<tr>
		<td>고객명</td>
		<td><%=username %></td>
	</tr>
	<tr>
		<td>레벨</td>
		<td>고객님 등급은 <%=level %> 입니다.</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>현재 적립금은 <%=point %> 원 입니다.</td>
	</tr>
</table>
</body>
</html>