<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - select 응용</title>
</head>
<body>
	<%
		int cate = 1;
	%>
	<select>
		<option value="">[통신사를 선택하세요.]</option>
		<%
			String ck = "";
			for(int c=1; c<=4; c++) {
				if(cate==c) {
					ck = "selected";
				}
		%>
			<option value="<%=c %>" <%=ck %>>option<%=c %></option>
		<%
			}
		%>
	</select><br><br>

	<select>
		<option value="">[통신사를 선택하세요.]</option>
		<%
			for(int c=1; c<=4; c++) { 
				if(cate==c) {
					out.print("<option value='"+c+"' selected>option"+c+"</option>");
				}
				else {
					out.print("<option value='"+c+"'>option"+c+"</option>");
				}
		%>
			
			
		<%
			} 
		%>
	</select>
	<br><br><br>
	<!-- JSP 배열로 값을 선언 -->
	<%!
		//JAVA 배열을 선언
		String data[] = {"홍길동","이순신","강감찬"};
	%>
	<%
		//JAVA 배열값을 가져와서 JSP 반복문으로 출력하는 형태
		for(int aa=0; aa<data.length; aa++) {
			out.print("<span style='border:1px solid red;'>"+data[aa]+"</span>");
		}
	%>

</body>

</html>