<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 기초문법</title>
</head>
<body>
	<%-- 
		<% : jsp시작 
		%> : jsp종료
		<%!.....%> : 자바 변수나 메소드를 정의할 때 사용함
		<%=.....%> : 문자열이나 숫자 등의 값을 출력할 때 사용함
		<%@.....%> : 페이지 속성 지정 & 외부 페이지를 로드할 수 있음
	--%>
	<%@ include file = "ex2.jsp" %>
	<!-- Java 문법 -->
	<%!
		int a;
		int b;
		public int sum(int aa, int bb) {
			return aa+bb;
		}
	%>
	<!-- JSP 문법 (웹에 출력) -->
	<% 
		a = 20;
		b = 10;
		out.print(sum(a,b));	//out.print : JSP 출력 파트
	%>
	<!-- JSP 문법만 사용 -->
	<ul>
		<% for(int i=0; i<9; i++) { %>
		<li><%=i %></li>
		<% } %>
	</ul>
</body>
</html> 