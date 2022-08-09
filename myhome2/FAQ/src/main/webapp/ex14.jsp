<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file =  "./config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - 데이터 처리</title>
</head>
<body>

<table border="1">
	<tr>
		<td>POST전송이름</td>
		<td>POST전송값</td>
	</tr>


<%
	Enumeration pm = request.getParameterNames();
	//Enumeration : 자료형 클래스이며, 배열 형태로 모든 값을 받을 때 사용한다. (name값에 한에서만 사용)
	//getParameterNames : 전송된 페이지에서 모든 name을 가져오는 부분
	String bb = null;
	int j = 0;
	
	while(pm.hasMoreElements()) {	//hasMoreElements : 해당 자료형 클래스에 있는 모든 개체 요소를 가져올 때 사용
	 	String aa = (String)pm.nextElement();	//name값 모두 확인하는 함수
	 	if(!aa.equals("userpw2")) {	//==, != 사용못함 (intern 사용불가)
	 	bb = request.getParameter(aa);
	 	request.setAttribute("code"+j, bb);	//디렉티브 태그로 변환하여 반복문 밖에서 출력할 때 사용s
%>
	<tr>
		<td><%=aa %></td>
		<td><%=bb %></td>
	</tr>
<%	 	 	}
	 	j++;
	 	//out.print(bb);
	}
%>
</table>
<span>${code0}</span>
</body>
</html>