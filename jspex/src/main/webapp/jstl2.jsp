<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String nb = request.getParameter("number");
%>
<lk:set var="n" value="<%=nb%>"></lk:set>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl2.html 연동</title>
</head>
<body>
<!-- 
choose: 다중 처리 조건문을 사용함
if : 조건문을 처리함
-->
<%-- 
<lk:choose>
	<!-- 
	when : choose태그와 함께 사용하는 태그명 : 참일 경우 
	otherwise : 거짓일 경우
	-->
	<lk:when test="${n%2==0}">
		<lk:out value="${n}"></lk:out>은 짝수 입니다.
	</lk:when>
	
	<lk:when test="${n%2!=0}">
		<lk:out value="${n}"></lk:out>은 홀수 입니다.
	</lk:when>
</lk:choose>
 --%>
<lk:if test="${n=='홍길동'}">
	<span>가입 고객 입니다.</span>
</lk:if>
<lk:if test="${n=='이순신'}">
	<span>가입 고객 입니다.</span>
</lk:if>

</body>
</html>