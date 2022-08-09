<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//CORS : 도메인 및 아이피가 다를 경우 외부에서 .json을 가져가지 못함
	response.addHeader("Access-Control-Allow-Origin", "*");
	response.addHeader("Access-Control-Allow-Credentials", "true");
	//response.addHeader : .bashrc (서버) 입력하게 되어 있음
	//JSP에 코드를 입력해서 Access-Control-Allow 이용해서 접근을 허용함
	
	//A서버에서 자신의 서버로 접속시 허락된 파라미터명 + 파라미터 값을 확인
	String aa = request.getParameter("apikey").intern();
	
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
%>	