<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
core : 기본엔진
fn : 문자열 함수
sql : DB 연결
fmt(formatting) : 시간, 날짜, 다국어
 -->

<%
	//응용문제
	request.setCharacterEncoding("utf-8");
	String data[] = {"홍길동","이순신","강감찬","유관순"};
%>
<lk:set var="user" value="<%=data%>"></lk:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 - JSTL 반복문</title>
</head>
<!-- forEach : jstl에 반복문 출력 부분 -->
<body>
<table>
<tr>
<lk:forEach var="a" begin="1" end="5">
	<td><lk:out value="${a}"></lk:out></td>
</lk:forEach>
</tr>
</table>
<br><br>
<lk:forEach var="b" begin="2" end="4">
	<lk:forEach var="c" begin="1" end="5">
	<span>${b} * ${c} = ${b*c}</span><br>
	</lk:forEach>
</lk:forEach>
<b><br><br>
<%-- 
<lk:forEach var="nm" items="${user}">
고객명 : ${nm} <br>
</lk:forEach>
--%>
<lk:forEach var="nm" begin="0" end="${fn:length(user)-1}">
고객명 : ${user[nm]} <br>
</lk:forEach>

</body>
</html>