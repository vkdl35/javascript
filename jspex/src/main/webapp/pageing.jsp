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
<%
	String startpage = null;	//최초 시작되는 페이지 값
	String pageno= "5";	//한 페이지당 5개씩 
	String getpage = (String)request.getParameter("p");
	if(getpage==null || getpage.equals("") || getpage.equals("1")){
		startpage =  "0";
	}
	else{
		int s = Integer.parseInt(pageno);	//한페이지에 보여줄 데이터 갯수
		int g = Integer.parseInt(getpage);	//페이징 번호값
		int t = (g-1) * s;			//(페이지번호-1) * 한페이지당 보여줄 갯수
		startpage = String.valueOf(t); 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP7일차 - 전체 리스트 및 pageing 사용법</title>
</head>
<body>
<!-- 전체갯수 -->
<sql:query var="num" dataSource="${dbs}">
select * from poll order by pidx desc;
</sql:query>

<!-- 한 페이지 당 출력 파트 -->
<sql:query var="datas" dataSource="${dbs}">
select * from poll order by pidx desc limit <%=startpage%>,<%=pageno%>;
</sql:query>

<table border="1">
<tr>
<td>NO</td>
<td>아이디</td>
<td>고객명</td>
<td>전화번호</td>
<td>입력일자</td>
</tr>
<lk:set var="spage" value="<%=startpage%>"></lk:set>
<lk:forEach var="data" items="${datas.rows}" varStatus="ct">
<!-- varStatus : 순번을 체크함 (count(1~), index(0~))  -->
<tr>
<td><lk:out value="${(num.rowCount-spage)-ct.index}"></lk:out></td>
<td><lk:out value="${data['pid']}"></lk:out></td>
<td><lk:out value="${data['pname']}"></lk:out></td>
<td><lk:out value="${data['ptel']}"></lk:out></td>
<lk:set var="indate" value="${data['pdate']}"></lk:set>
<td><lk:out value="${fn:substring(indate,0,10)}"></lk:out></td>
</tr>
</lk:forEach>
</table>
<table border="1">
<tr>
<lk:set var="pageno" value="<%=pageno%>"/>
<lk:set var="pagenum" value="${num.rowCount/pageno+((1-num.rowCount/pageno%1))%1}"></lk:set>
<lk:forEach var="ns" begin="1" end="${pagenum}" >
<td onclick="pagego(${ns})">${ns}</td>
</lk:forEach>
</tr>
</table>
<script>
	function pagego(p){
		location.href='./pageing.jsp?p='+p;
	}
</script>
</body>
</html>