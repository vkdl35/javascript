<%@page import="FAQ_pack.ex23"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 JAVA 파일 로드</title>

</head>
<body>
<%-- 	<%	//권장사항은 아니니 기본 지식정도로 알고 있으면 됨(속도가 느리고 메모리를 많이 잡아먹기 때문에)
		ex23 ex = new FAQ_pack.ex23();	
		ex.innames();
	%>	 --%>
	<!-- userBean : JABA 파일에 대한 Class를 로드할 때 사용하는 jsp 태그입니다. -->
	<jsp:useBean id="abc" class="FAQ_pack.ex23" scope="request"></jsp:useBean>
	<% //abc.innames(); 
		abc.innames2("강감찬","골드회원");
		request.setCharacterEncoding("UTF-8");
	%>
	<p>고객명 : <%=abc.names() %></p>
	<p>고객등급 : <%=abc.level() %></p>
	<jsp:include page="ex23_1.jsp">
		<jsp:param value="abc.names()" name="person"/>
	</jsp:include>
	
	
	
	
	<br><br><p>사용자 입력 페이지</p>
		<input type="text" name="tt" id="tt" value="">
		<input type="button" value="검색" onclick="faa();">

		<jsp:include page="ex24_1.jsp">
		<jsp:param value="<%= %>" name="age"/>
		</jsp:include>

</body>
</html>