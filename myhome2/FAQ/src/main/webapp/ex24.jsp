<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - 상품 검색 응용 파트</title>
<script>
	function adk() {
		if(f12.search=="") {
			alert("검색할 상품명을 입력해주세요.");
			return false;
		}
		else {
			return;
		}
	}
</script>


</head>
<body>
	<form name="f12" id="f12" method="post" action="ex24_1.jsp" onsubmit="return adk();">
		<input type="text" name="search">
		<input type="submit" value="검색">
	</form>
</body>
</html>