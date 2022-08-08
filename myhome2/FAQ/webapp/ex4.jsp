<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 반복문 응용</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- 주의사항 : JSP 코드에 HTML 태그를 넣으면 안됩니다. -->
	<table border="1">
		<%
			int a = 0;
			while(a < 4) {
		%>
		<tr>
			<%
				int aa=0;
				while(aa < 4) {
			%>
			<td style="width: 100px; height: 30px;"></td>
			<%
				aa++;
				}
			%>
		</tr>
		<%
			a++;
			}
		%>
	</table>
	<br><br>
	<table border="1">
		
			<%
			String m = "";
				int w = 1;
				while(w < 9) {
					if(w%2 ==0) {
						m="red";
					}
					else {
						m="";
					}
			%>
			<tr ><td style="background-color: <%=m%>; width: 300px; height: 30px;"></td></tr>
			<%
					
				w++;
				}
			%>
		
	</table>

</body>
</html>