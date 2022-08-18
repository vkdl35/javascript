<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="dbs" 
url="jdbc:mysql://umj7-009.cafe24.com/leejongh" 
driver="com.mysql.jdbc.Driver" 
user="leejongh" 
password="Tt04860486!"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - SQL 데이터 삭제</title>
</head>
<body>
<sql:update dataSource="${dbs}" var="result">
	delete from poll where pid=?
	<sql:param value="youkansun"></sql:param>  
<!-- 	param : ? 사용가능  -->
</sql:update>
<lk:if test="${result==1}">삭제완료</lk:if>
<lk:if test="${result==0}">삭제오류</lk:if>
</body>
</html>