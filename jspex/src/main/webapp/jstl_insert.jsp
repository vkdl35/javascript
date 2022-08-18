<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="dbs" 
url="jdbc:mysql://umj7-009.cafe24.com/vkdl35" 
driver="com.mysql.jdbc.Driver" 
user="vkdl35" 
password="kalot854@91**"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - SQL 데이터 입력</title>
</head>
<body>
<!--  update : insert , update, delete 세가지만 사용 합니다. -->
 <sql:query var="sresult" dataSource="${dbs}">
 select count(*) from poll where pid='youkansun2';
 </sql:query>
 <!--  해당 값에 대한 SQL에 저장 여부를 확인 하는 작업  -->
<%--  <lk:out value="${sresult.rowCount}"></lk:out><br> --%>
<%--  <lk:out value="${sresult.rowsByIndex[0][0]}"></lk:out> --%>
 <lk:if test="${sresult.rowsByIndex[0][0]==0}">
 
 <sql:update  var="result" dataSource="${dbs}"> 
  insert into poll values ('0','유관순','youkansun2','01012345611','3','2022-08-17 14:18:00'); 
 </sql:update> 
 <lk:if test="${result==0}">입력 오류</lk:if> 
 <lk:if test="${result==1}">입력 성공</lk:if>
   </lk:if>
 
</body>
</html>