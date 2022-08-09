<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%
	//CORS : 도메인 및 아이피가 다를 경우 외부에서 .json을 가져가지 못함
	response.addHeader("Access-Control-Allow-Origin", "*");
	response.addHeader("Access-Control-Allow-Credentials", "true");
%>	
<%
	//JSONObject js = new JSONObject();	//jsp에서 JSON파일처럼 인식되도록 하는 클래스
	//ajax 통신시 HTML 코드는 따로 사용하지 않음
	
	String aa = request.getParameter("mid").intern();
	String bb = null;
	
	if(aa=="hong") {
		bb = "no";
	}	
	else {
		bb = "ok";
	}
	//js.put("sign",bb);	//put을 이용해서 배열로 생성 ("배열키",배열값)
	//out.print(js);
	
	//String a = "hong";
	//String b = "홍길동";
	//js.put("mid",a);
	//js.put("mname",b);
	//out.print(js);
	/*
	if(aa=="aaaa") {
		String arr[][] = {
				{"hong","이경민"},
				{"park","이경민2"}
		};
		
		JSONArray ar = new JSONArray();	
		//JSONArray는 각각의 배열로 만들어진 데이터를 그룹화[]하여 값을 저장하는 클래스입니다. 
		for(int k=0; k<arr.length; k++) {
			JSONObject js = new JSONObject();
			js.put("mid",arr[k][0]);
			js.put("mname",arr[k][1]);
			ar.add(js);
		}
		out.print(ar);
	}
	*/
%>
