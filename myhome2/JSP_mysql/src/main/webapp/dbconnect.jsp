<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	Connection con = null;
	try{
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://umj7-009.cafe24.com/vkdl35";
		String userid = "vkdl35";
		String userpw = "kalot854@91**";
		Class.forName(driver);
		
		con = DriverManager.getConnection(url,userid,userpw);
	}catch(Exception e) {
		e.getMessage();
	}

%>
