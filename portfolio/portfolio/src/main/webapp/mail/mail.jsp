<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="f32" id="f32" method="post" action="mailto.jsp" enctype="application/x-www-form-urlencoded">
	<div>
		<ul>
			<li>
				<input type="hidden" name="admin" value="max21lkm@gmail.com"><br>
				메일 주소(받는 분) : <input type="text" name="postmail"><br>
				메일 제목 : <input type="text" name="postsubject"><br>
				메일 내용 : 
				<textarea rows="10" cols="60" name="postmsg"></textarea><br>
				<input type="button" value="메일전송" onclick="ok();">
			</li>
		</ul>
	</div>
</form>
<script>
	function ok() {
		f32.submit();
	}
</script>