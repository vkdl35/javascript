<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 참여자 저장파일</title>
</head>
<body>
<%!
	LocalDateTime time = LocalDateTime.now();
	DateTimeFormatter drf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String datatime = time.format(drf);
%>
<%@include file="./dbconnect.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String unm = request.getParameter("username");
	String uid = request.getParameter("userid");
	String utel = request.getParameter("usertel");
	String urd = request.getParameter("rd");
	
	String sql = "insert into poll values ('0',?,?,?,?,'"+datatime+"')";

	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, unm);
	ps.setString(2, uid);
	ps.setString(3, utel);
	ps.setString(4, urd);
	
	int a = 0;
	a = ps.executeUpdate();

	if(a > 0) {
		out.print("<script>alert('설문조사 종료'); location.href='./select2.jsp'</script>");
	}
	else {
		out.print("<script>alert('error'); history.go(-1);</script>");
	}
%>
</body>
<script type="text/javascript">

</script>
</html>