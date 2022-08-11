<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 - SQL 연동(select)</title>
</head>
<body>

<%@include file="dbconnect.jsp" %>
<%
	String sql = "SELECT * FROM poll ORDER BY pidx DESC";
	ArrayList<Map<String,Object>> al = null;
	try{
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		al = new ArrayList<>();
		while(rs.next()){
			Map<String,Object> mp = new HashMap<>();
			mp.put("pidx",rs.getString("pidx"));
			mp.put("pname",rs.getString("pname"));
			mp.put("pid",rs.getString("pid"));
			mp.put("ptel",rs.getString("ptel"));
			mp.put("ptext",rs.getString("ptext"));
			mp.put("pdate",rs.getString("pdate").substring(0,19)); ;
			al.add(mp);
		};
	}catch(Exception e) {
		out.print("DB 연결 실패 및 테이블 오류");
	}finally{
		if(con!=null) {
			con.close();
		}
	}
%>
<%
	int w = 0;
	while(w < al.size()) {
	//jsp 태그 사용 이유는, 설문조사 0~4까지의 내용이 확인할 수 없음
	//switch.jsp 에서 사용자가 어떤 내용에 대한 설문조사를 응하였는지 확인하는 사항
%>
<jsp:include page="switch.jsp">
	<jsp:param value='<%=al.get(w).get("ptext") %>' name="cate"/>
</jsp:include>
<%--
	//setAttribute로 생성된 가변수명을 getAttribute로 받아서 처리
	//또는, ${} 액션태그로 바로 출력 가능함
	//String msg = (String)request.getAttribute("msg");
--%>
	<ul>
		<li>고유번호 : <%=al.get(w).get("pidx") %></li>
		<li>고객명 : <%=al.get(w).get("pname") %></li>
		<li>고객 아이디 : <%=al.get(w).get("pid") %></li>
		<li>연락처 : <%=al.get(w).get("ptel") %></li>
		<li>설문조사 내용 : ${msg}</li>
		<!-- switch.jsp에서 setAttribute를 사용했기 때문에 따로 getAtteribute로 받지 않고 ${}로 처리해도 됨 -->
		<li>참여일자 : <%=al.get(w).get("pdate") %></li>
	</ul>
<%
	w++;
	}
%>
</body>
</html>