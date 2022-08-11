<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//select2.jsp에서 받은 cate 부분을 switch문으로 확인
	String cate = request.getParameter("cate").intern();
	String msg = "";	//코드 번호를 한글화 또는 영문화로 변경
	switch(cate) {
	case "0" :
		msg = "JAVA";
		break;
	case "1" :
		msg = "JAVA Servlet";
		break;
	case "2" :
		msg = "javascript";
		break;
	case "3" :
		msg = "AJAX";
		break;
	case "4" :
		msg = "JSP";
		break;
	}
	request.setAttribute("msg", msg);	//select2.jsp로 return
%>