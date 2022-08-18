<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./db.jsp" %>
<%
	int pageview = 5;	//한페이지당 보여지는 데이터 개수
	int startpage = 0;	//시작 페이지 값
	int pagenumber = 1;	//페이징 개수
	
	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String pt = request.getParameter("search");
	String pgno = request.getParameter("page");	//페이징 번호
	
	String andsql = " where pid='vkdl35' ";	//검색할 때 사용
	if(pt==null) {
		andsql = " ";	//sql 문법상 띄어쓰기가 적용되도록 하기 위함
	}
	else {
		andsql = " where pid='"+pt+"'";	//sql 문법 추가시에도 띄어쓰기 확인
	}
	
	String ct = "select count(*) as ct from poll";	//데이터 총 개수
	PreparedStatement psct = null;
	PreparedStatement ps = null;
	Map<String,Object> mp = null;
	List<Map<String,Object>> data = null;
	int total = 0;
	try{
		psct = con.prepareStatement(ct);
		ResultSet rsct = psct.executeQuery();
		while(rsct.next()) {
			total = rsct.getInt("ct");
		}
		
		if(pgno==null || pgno=="") {
			startpage = 0;
		}
		else {	//페이지 2번부터 적용되는 사항
			startpage = (Integer.parseInt(pgno)-1)*pageview;
		}
		
		//페이징 총 개수 파악
		if(total % pageview==0) {
			pagenumber = total / pageview;
		}
		else {
			pagenumber = (total / pageview) + 1;
		}
		
		String sql = "select * from poll"+andsql+"order by pidx desc limit "+startpage+","+pageview;	//데이터 리스트
		//String sql = "select * from poll order by pidx desc limit 0,?";	//? 사용시
		ps = con.prepareStatement(sql);
		//ps.setInt(1,pageview);	//sql에 ? 사용시 자료형에 맞춰서 값을 넣어줌
		ResultSet rs = ps.executeQuery();
		//out.print(rs.next());	//true 뜨면 정상, false 뜨면 오류
		data = new ArrayList<>();
		while(rs.next()) {	//next()는 버퍼라 한번만 사용 가능
			mp = new HashMap<>();
			mp.put("idx",rs.getString("pidx"));
			mp.put("username",rs.getString("pname"));	//앞은 변수명 뒤는 필드값
			mp.put("userid",rs.getString("pid"));
			mp.put("usertel",rs.getString("ptel"));
			mp.put("indate",rs.getString("pdate").substring(0,10));
			data.add(mp);
		}
	}
	catch(Exception e) {
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 8일차 - 페이지 번호 및 검색 기능</title>
<style>
	ul,ol {list-style:none; margin:0; padding:0; width:1000px; height:30px;
	font-size:13px;}
	li {float:left; background-color:skyblue; height:30px; line-height:30px;
	text-align:center; border:1px solid #333; box-sizing:border-box;}
	.bgcolor{background-color:#fff;}
	.t_ul>li:nth-of-type(1){width: 100px;}
	.t_ul>li:nth-of-type(2){width: 200px;}
	.t_ul>li:nth-of-type(3){width: 300px;}
	.t_ul>li:nth-of-type(4){width: 200px;}
	.t_ul>li:nth-of-type(5){width: 200px;}
</style>
</head>
<body>
	<ul class="t_ul">
		<li>번호</li>
		<li>고객명</li>
		<li>고객아이디</li>
		<li>전화번호</li>
		<li>입력일자</li>
	</ul>
	<em style="clear:both;"></em>
	<%
		int w = 0;
		int no = 0; 
		do{
			no = (total - w)-startpage;
	%>
	<ul class="t_ul" style="clear:both;">
		<li class="bgcolor"><%=no %></li>
		<li class="bgcolor"><%=data.get(w).get("username") %></li>
		<li class="bgcolor"><%=data.get(w).get("userid") %></li>
		<li class="bgcolor"><%=data.get(w).get("usertel") %></li>
		<li class="bgcolor"><%=data.get(w).get("indate") %></li>
	</ul>
	<%
			w++;
		}while(w < data.size());
	%>
	<div style="width:1000px; height:30px; margin-top:20px; text-align:center;">
		<ol style="display:inline;">
		<%
			int p = 1;
			while(p <= pagenumber) {
		%>
			<li onclick="pagego(<%=p %>)" style="width:30px; border-radius:5px; display:inline-block; cursor:pointer;"><%=p %></li>
		<%
			p++;
			}
		%>
		</ol>
	</div>
	<div style="width:1000px; height:30px; margin-top:20px;">
		<form name="f67" id="f67" method="get" action="./pageing2.jsp" enctype="application/x-www-form-urlencoded">
			<input type="text" name="search">
			<input type="submit" value="검색">
			<input type="button" value="전체리스트" onclick="abc();">
		</form>
	</div>
</body>
<script>
	function abc() {
		location.href='./pageing2.jsp';
	}
	function pagego(pgno1) {
		location.href='./pageing2.jsp?page='+pgno1;
	}
</script>
<%con.close(); %>
</html>