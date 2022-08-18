<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1 - session삭제</title>
</head>
<body>
<%

//특정 session을 삭제할 때 사용
//session.removeAttribute("mid");
//session.removeAttribute("lv");
//session.removeAttribute("mail");

//모든 session 삭제
session.invalidate();
%>
</body>
</html>