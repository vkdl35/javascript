<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - JAVA + JSP</title>
<%!	//JAVA 코드 - module
	
	public class abc{
		String a = "홍길동";
		String b = "이순신";
		String zz = null;
		public ArrayList<String> getter() {	//getter
			ArrayList<String> ar = new ArrayList<String>();
			ar.add(a);
			ar.add(b);
			return ar;
		}
		public void setter(String z) {	//setter에 값을 적용 후 전산/산술 처리 후 this로 값을 보냄
			this.zz = z;
		}
		public String getter2() {	//JSP에 출력 역할
			return this.zz;
		}
	}
%>

<%	
	//JSP에서 JAVA를 로드해서 사용
	
	abc aa = new abc();	//Controller
	ArrayList<String> result = aa.getter();	
	aa.setter("유관순");
	String name2 = aa.getter2();
	request.setAttribute("result", result);
%>
</head>
<!-- view -->
<body>
	고객명 : <%=result %><br>
	고객명 : ${result}<br>
	리턴값 이름 : <%=name2 %>
	<!-- 
	응용문제 
	고객명 : 홍길동 이순신
	배열값으로 jsp 전달
	-->
</body>
</html>