<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file =  "./config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - 기본문법 형태(날짜 출력)</title>
</head>
<body>
<%
	Date day = new Date();	//현재 날짜 KST : 한국 시간 / UST : 미국 시간
	//out.print(day);
	int h = day.getHours();
	int m = day.getMinutes();
	int s = day.getSeconds();
	out.print(h+"시 "+m+"분 "+s+"초"+"<br>");
	int y = day.getYear()+1900;	//2000년도 이상 넘어가면 버그남(버그라 사용 안함), +1900을 붙이면 2000년도 이상 적용 가능
	int mm = day.getMonth()+1;	//월 (0부터 시작하기 때문에 +1 붙여야함)
	int d = day.getDate();	//일
	int w = day.getDay();	//요일
	out.print(y+"년 "+mm+"월 "+d+"일");
%>
</body>
</html>