<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1 - session생성</title>
</head>
<body>
<%
	//request.setAttribute(name, o);
	//request.getAttribute(name);
	
	String user = "hong";
	String email = "hong@nate.com";
	int level = 4;
	
	session.setAttribute("mid", user);
	session.setAttribute("mail", email);
	session.setAttribute("lv", level);
	session.setMaxInactiveInterval(20*60);
	
	//long last = session.getLastAccessedTime();	//세션 유지 시간
	//long create = session.getCreationTime();	//세션 생성 시간	
	//long user_time = (last-create) / 60000;	//세션 경과 시간
	
	//out.print(last + "<br>");
	//out.print(create + "<br>");	
	//out.print(user_time + "<br>");
	
	//MaxInactiveInterval : 1800초
	//session.setMaxInactiveInterval(-1);	//무한으로 지정
	//session.setMaxInactiveInterval(0);	//소멸
	//session.setMaxInactiveInterval(60*60);	//최대시간을 조정하는 부분
	//int time = session.getMaxInactiveInterval() / 60;	//30분 session 사용
	//out.print(time);
	
%>
</body>
</html>