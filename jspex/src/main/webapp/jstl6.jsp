<%@page import="com.mysql.jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dbinfo" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - tagdir 응용편</title>
</head>
<body>
<!--  taglibs 라이브러리 파일 중 spec.jar 이 있어야만 tag 파일과 return 값을 받을 수 있음 -->
<dbinfo:table2 no="50" no2="홍길동님 환영합니다."></dbinfo:table2>
리턴값 : ${returncall}<br>
리턴값 : ${returncall2}<br>
</body>
</html>