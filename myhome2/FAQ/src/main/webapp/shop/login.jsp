<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script>
	console.log("test");
	function aaa() {
		if(ffff.mid.value=="hong" && ffff.mpass.value=="hong1234") {
			ffff.action = "index.jsp";
			ffff.submit();
		}
		else {
			alert("회원 정보를 다시 확인하세요.");
	        location.href = "./member_login.jsp";
		}
	}
</script>
<!-- 
	*응용문제 
	loginok.jsp로 post 전송이며, 아이디는 hong, 패스워드는 hong1234 입니다.
	만약에 아이디 및 패스워드가 일치하지 않을 경우, '회원 정보를 다시 확인하세요.' 라는 문구와 함께
	member_login.jsp로 다시 이동 되게 하며, 로그인에 성공했을 경우 index.jsp로 이동되도록 합니다.
-->
<div style="width: 1200px; height: 500px; margin: 0 auto;">
	<form name="ffff" id="ffff" method="post" onsubmit="aaa();">
		<table border="1" cellspacing="0" cellpadding="0" align="center" style="margin-top: 200ox;">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid" id="mid" value=""></td>
			</tr>
			<tr> 
				<td>패스워드</td>
				<td><input type="password" name="mpass" id="mpass" value=""></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</div>

