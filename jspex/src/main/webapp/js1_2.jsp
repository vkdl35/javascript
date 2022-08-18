<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1 - session확인</title>
</head>
<body>
<%
	session.setMaxInactiveInterval(20*60);

	Object id = session.getAttribute("mid");
	Object lv = session.getAttribute("lv");
	String mail = (String)session.getAttribute("mail");
	
	
	out.print(id+"<br>");
	out.print(lv);
	out.print(mail);
	
	if(mail==null){
		out.print("<script>alert('시간 경과로 자동 로그아웃 되셨습니다.'); location.href='./js1.jsp';</script>");
	}
	
%>
</body>
</html>