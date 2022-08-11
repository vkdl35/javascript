<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 - SQL 연동(select)</title>
</head>
<body>

<%@include file="dbconnect.jsp" %><!-- DB접속환경을 로드함 -->
<%
	String sql = "select * from poll";	//SQL 문법
	try{
		//PreparedStatement : SQL 문법을 실행시키는 클래스
		PreparedStatement ps = con.prepareStatement(sql);
		//ResultSet : select에서만 ResultSet를 사용함. 값을 받아서 처리하는 클래스
		ResultSet rs = ps.executeQuery();
		while(rs.next()){	//SQL에 있는 데이터를 반복시킴
			//getString : 문자
			//getInt : 숫자
			//getBoolean : true, false
			//getfloat...등등이 있음
%>
	<ul>
		<li>고유번호 : <%=rs.getString("pidx") %></li>
		<li>고객명 : <%=rs.getString("pname") %></li>
		<li>고객 아이디 : <%=rs.getString("pid") %></li>
		<li>연락처 : <%=rs.getString("ptel") %></li>
		<li>설문조사 내용 : <%=rs.getString("ptext") %></li>
		<li>참여일자 : <%=rs.getString("pdate").substring(0,19) %></li>
	</ul>
<%
		};
	}catch(Exception e) {
		out.print("DB 연결 실패 및 테이블 오류");
	}finally{	//DB 연결 및 출력이 모두 완료되면 DB접속 해제
		if(con!=null) {
			con.close();
		}
	}
%>
</body>
</html>