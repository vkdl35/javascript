<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자 발송 시스템</title>
</head>
<%
	String no = "123456";
%>
<body>
	<form name="f" id="f" method="post" action="security.jsp">
		<input type="hidden" name="method" value="2">
		발신자 번호 : <input type="text" name="senderPhone"><br>
		문자 메세지 내용 : <input type="text" name="smsContent" value="<%=no %>" maxlength="50"><br>
		<input type="hidden" name="userDefine">		
		<input type="button" value="인증번호 받기" onclick="ok()">
	</form>
	<script>
		function ok() {
			f.submit();
		}
	</script>
</body>
</html>