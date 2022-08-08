<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	contentType="text/html; charset=UTF-8" : HTML에서 JSP 페이지를 적용할 때 코드라인을 사용하지 않아도 무방합니다. 
	text/html : html에서 JSP 출력
	text/xml : xml로 변환
	text/plain : 코드가 전부 출력됨
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 반복문1</title>
<script>
	function all_ck() {
		var me = document.getElementById("allck");
        var useck;
        
        if(me.checked==true) {
            useck=true;
        }
        else {
            useck=false;
        }
	}
	
	var w = 1;
    while(w < 6) { 
        f1.ct[w].checked = useck;
        w++;
    }
</script>
</head>
<body>
	<%
		int f;
		for(f=1;f<6;f++) {
	%>
	<input type="radio" name="rd" id="rd<%=f %>"> 설문조사<%=f %>
	<%
		}
	%>
	<br>
	<br>
	<input type="checkbox" value="" id="allck" onclick="all_ck();">전체선택
	<ul>

		<%
			int a=0;
			while(a < 6) {
		%>
		<li><input type="checkbox" name="ck" id="ck<%=a%>" value="">체크<%=a%></li>
		<%
			a++;
			}
		%>

	</ul>

	<br>
	<br>
	<form name="f1" id="f1">
	<select>
		<option value="">메뉴를 선택해주세요.</option>
		<%
				int ww=0;
				do {
			%>
		<option value="<%=ww %>">메뉴<%=ww %>
			<%
				ww++;
				}while(ww<6);
			%>
		
	</select>
	</form>
</body>
</html>