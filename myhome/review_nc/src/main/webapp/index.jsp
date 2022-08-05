<%@page import="review_package.dataload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 출력파트</title>
<script>
	function del_data(idx) {
		if(confirm("게시글 삭제시 복구할 수 없습니다.")) {			
			location.href='review_dl.do?sidx='+idx;
		}
	}
	
	function gopage() {
		location.href='review_write.html';
	}
</script>
</head>
<body>

<%-- JSP 주석 (<% JSP OPEN) (%>JSP CLOSE) (<%= DATA 출력) --%>

<%
    ArrayList<dataload> list = (ArrayList<dataload>)request.getAttribute("list");
%>
<table border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>고객명</td>
	<td>상품명</td>
	<td>별점</td>
	<td>리뷰 사진</td>
	<td>리뷰 작성 시간</td>
	<td>수정/삭제</td>
</tr>

<% 
   for(dataload aa : list){
	   int num = Integer.parseInt(aa.getstar());
	   String star_c = null;
	   switch(num){
	   case 1:
		   star_c = "★☆☆☆☆";
		   break;
	   case 2:
		   star_c = "★★☆☆☆";
		   break;
	   case 3:
		   star_c = "★★★☆☆";
		   break;
	   case 4:
		   star_c = "★★★★☆";
		   break;
	   case 5:
		   star_c = "★★★★★";
		   break;
	   };
%> 
<tr>
	<td><%= aa.getusernm() %> </td>
	<td><%= aa.getpronm() %> </td>
	<td><%= star_c %> </td>
	<td><%= aa.getimg() %> </td>
	<td><%= aa.getindate() %> </td>
	<td><input type="button" value="수정"><input type="button" value="삭제" onclick="del_data(<%=aa.getidx()%>);"></td>
</tr>

<%
   }
%>
</table>
<input type="button" value="리뷰 등록" onclick="gopage();">
</body>
</html>