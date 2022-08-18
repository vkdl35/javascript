<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="lk" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- setDataSource : DB 연결 태그 -->
<sql:setDataSource var="dbs" 
url="jdbc:mysql://umj7-009.cafe24.com/vkdl35" 
driver="com.mysql.jdbc.Driver" 
user="vkdl35" 
password="kalot854@91**"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 - SQL 연결</title>
</head>
<body>
<!-- 
dataSource = Connect
query : db쿼리문 (select)
udate : db쿼리문 (insert, update, delete)
var로 query문을 실행하게 됨.
 -->
<sql:query var="select" dataSource="${dbs}">
select * from poll order by pidx desc;
</sql:query>

<!-- columnNames : SQL 필드명을 가져올때 사용 -->
<lk:forEach var="poll" items="${select.columnNames}">
	<span>
	<lk:out value="${poll}"></lk:out><!-- 컬러명 -->
	</span>
</lk:forEach>
<br><br><br>
<!-- rows : 필드에 있는 값 -->
<lk:forEach var="data" items="${select.rows}">
	<span>
	<!-- ${data['필드명']} -->
	<lk:out value="${data['pname']}"></lk:out>
	</span>
	<span>
	<lk:out value="${data['pid']}"></lk:out>
	</span>
	<span>
	<input type="button" value="삭제" onclick="abc(${data['pidx']})">
	</span>
</lk:forEach>

</body>
<script>
	function abc(z){
		alert(z);
	}
</script>

</html>