<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 리스트 출력 파트</title>
</head>
<%@include file="./ex24.jsp"%>
<%
	String product[][] = {
			{"딸기","",""},
			{"청포도 2kg","35000","10%"},
			{"적포도 1kg","18000","5%"}
	};
	
	request.setCharacterEncoding("UTF-8");
	String pronm = request.getParameter("search").intern();
	
	/* String test = product[1][0];
	out.print(test);
	out.print(test.indexOf(pronm));	 */
	
	String a_pnm = null;
	String a_pmoney = null;
	String a_psales = null;
	boolean ck = false;
	int w = 0;
	while(w < product.length) {
		if(product[w][0].indexOf(pronm)>-1) {	//-1 이상은 해당 단어가 있는 경우
			a_pnm = product[w][0];
			a_pmoney = product[w][1];
			a_psales = product[w][2];
			ck = true;
			if(a_pmoney!="") {	//가격이 비어있지 않을 경우
				
%>
	<ul>
		<li>상품명 : <%=a_pnm %></li>
		<li>상품가격 : <%=a_pmoney %></li>
		<li>상품할인률 : <%=a_psales %></li>
	</ul>
<%
		}
		else {	//가격이 비어있을 경우
			out.print("<span>해당 상품은 판매 종료된 상품입니다.</span>");
		}
	};
		w++;
	};

%>

<%
	if(ck==false) {	//모든 배열을 검토한 후 값이 없을 때 출력
%>
		<span>상품명을 다시 한번 확인해주세요.</span>
<%
	}
%>
<body>
<%-- <%
String msg = "";
String nam = "";
int moo = 0;
String dff = "";
String fu = request.getParameter("age").intern();
if(fu=="딸기") {
	msg = "해당 상품은 판매 종료 된 상품입니다.";
	request.setAttribute("msg", msg);
%>
	<p>[딸기]<br>${msg}</p>
<%
}
else if(fu=="포도") {
	nam = "청포도 2kg";
	moo = 35000;
	dff = "10%";
	request.setAttribute("nam", nam);
	request.setAttribute("moo", moo);
	request.setAttribute("dff", dff);
%>
	<p>[포도]<br>${nam}<br>${moo}<br>${dff}</p>
<%	
}
else {
	msg = "상품명을 다시 한번 확인해 주세요.";
	request.setAttribute("msg", msg);
%>
	<p>${msg}</p>
<%
}

%> --%>




</body>
</html>