<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 리스트 등록</title>
<script>
	function FAQ_check(no) {
		if(no==1) {	//리스트로 이동
			location.href='FAQ_list.html';
		}
		else {	//FAQ 저장
			if(f.select_view.value=="") {
				alert("카테고리를 선택해주세요.");
			      f.select_view.focus();
			      return false;
			}
			else if(f.ftext.value=="") {
				 alert("질문내용을 입력해주세요.");
			     f.ftext.focus();
			     return false;
			}
			else if(f.ftextarea.value==""){
			      alert("답변내용을 입력해주세요.");
			      f.fretext.focus();
			      return false;
			   }
			else {
			      f.method="POST";
			      f.action="FAQ_update_OK.do";
			      f.enctype="application/x-www-form-urlencoded";
			      f.submit();
			}
		}
		
	}
	function delete_FAQ() {	//데이터 삭제 페이지 연결
		if(confirm("해당 내용을 삭제 하시겠습니까? 데이터 삭제시 복구 되지 않습니다.")) {
			var uri = window.location.search;
			var idx = uri.split("?idx=");
			location.href='./FAQ_del.do?idx='+idx[1];
		}
		
	}
</script>
</head>
<body>
	<p>FAQ 입력 페이지</p>
	<form name="f" id="f">
	<input type="hidden" name="fidx" value="<%=request.getAttribute("fidx")%>">
		<table>
			<tr>
				<%
					//request.getAttribute : Enumeration(자료형)
					String cate = (String)request.getAttribute("fcategory");
					String cate1 = "";
					String cate2 = "";
					String cate3 = "";
					String cate4 = "";
					String cate5 = "";
					switch(cate) {
						case "0" :
							cate1 = "selected";
						break;
						case "1" :
							cate2 = "selected";
						break;
						case "2" :
							cate3 = "selected";
						break;
						case "3" :
							cate4= "selected";
						break;
						case "4" :
							cate5 = "selected";
						break;
					}
				%>	
				<td>카테고리</td>
				<td>
					<select name="select_category">
					    <option value="">카테고리를 선택해주세요.</option>
					    <option value="0" <%=cate1%>>배송문의</option>
					    <option value="1" <%=cate2%>>반품/교환/환불</option>
					    <option value="2" <%=cate3%>>주문/결제</option>
					    <option value="3" <%=cate4%>>회원서비스</option>
					    <option value="4" <%=cate5%>>안전거래</option>
					</select>
					<%
						String ck = (String)request.getAttribute("faq_view");
						String check = "";
						if(ck.equals("Y")) {
							check = "checked";
						}
					%>
					<label><input type="checkbox" name="faq_view" value="Y" <%=check%>> 리스크 출력 여부</label>
				</td>
			</tr>
			<tr>
				<td>글쓴이 <%=request.getAttribute("fname")%></td>
				<td></td>
			</tr>
			<tr>
				<td>질문내용</td>
				<td><input type="text" name="ftext" <%=request.getAttribute("ftext")%>></td>
			</tr>
			<tr>
				<td>답변내용</td>
				<td><textarea name="ftextarea" rows="20" cols="120"><%=request.getAttribute("ftextarea")%></textarea></td>
			</tr>
		</table>
		<input type="button" value="삭제" onclick="delete_FAQ();">
		<input type="button" value="FAQ리스트" onclick="FAQ_check(1);">
		<input type="button" value="수정완료" onclick="FAQ_check(2);">
		
	</form>	
</body>
</html>