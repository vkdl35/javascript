<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - Jquery Ajax - 그래프 + 타이머 + 배열</title>
<script src="./js/jquery.js"></script>
<script>
	$(function() {
		$.fn.weather = function() {
			var $apikey = "hohoho";
			$.ajax({
				url:"./ajax2_ok.jsp",	//외부에서도 적속할 수 있도록 하기 위해서는 JSON, JSP 값을 받아야 합니다.
				cache:false,
				dataType:"text",	//JSON,XML 파일 외에는 모두 html로 적용해야 합니다.
				data:{
					apikey:$apikey	//데이터 통신을 위해서 APIKEY를 확인합니다.
				},
				type:"GET",
				success:function($data) {
					//JSON 파일이 아닌 이상은 parseJSON을 이용해서 파서해야만 배열로 인식합니다.
					var $jdata = jQuery.parseJSON($data);	//JS에서는 JSON.parse()
					$.fn.ani($jdata);
					//console.log($jdata);
				},
				error:function() {
					console.log("ajax 통신 오류");
				}
			});
			setTimeout($.fn.weather,5000);	//매 5초마다 데이터를 로드합니다.
		}
		setTimeout($.fn.weather,5000);	//최초 실행시 적용되는 부분S
		
		$.fn.ani = function($jdata) {
			//console.log($jdata.length);
			var $w = 0;
			while($w < $jdata.length) {
				var $area = $jdata[$w]["area"];
				var $areanum = $jdata[$w]["areanum"];
				//console.log($area+$areanum);
				//$("#dataload>apan:eq(0)>ul >li:eq(1)").css("width",$areanum*2 + "px");
				$("#dataload>span:eq("+$w+")>ul>li:eq(1)").animate({
						"width":$areanum*2 + "px"
				},500);
				$w++;
			}
		}
	});
</script>
</head>
<body>
	<p>각 지역구 강수량</p>
	<div id="dataload" style="width: 700px; height: 500px; border-left: 1px solid black; border-bottom: 1px solid black;">
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">강동구</li>
				<li style="width: 0px; height: 25px; background-color: purple;"></li>
			</ul>
		</span>
		
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">중랑구</li>
				<li style="width: 0px; height: 25px; background-color: green;"></li>
			</ul>
		</span>
		
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">강남구</li>
				<li style="width: 0px; height: 25px; background-color: red;"></li>
			</ul>
		</span>
		
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">동대문구</li>
				<li style="width: 0px; height: 25px; background-color: blue;"></li>
			</ul>
		</span>
		
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">중구</li>
				<li style="width: 0px; height: 25px; background-color: orange;"></li>
			</ul>
		</span>
		
		<span style="display: block; width: inherit; height: 50px;">
			<ul style="list-style: none; margin: 0px; padding: 0px; width: inherit; height: inherit;">
				<li style="height: 25px;">성동구</li>
				<li style="width: 0px; height: 25px; background-color: pink;"></li>
			</ul>
		</span>
	</div>
</body>
</html>