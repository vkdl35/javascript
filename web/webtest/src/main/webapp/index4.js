function idcheck() {
	let id = document.getElementById("mid");
	if(id.value=="") {
		alert("아이디를 입력해주세요.");
		id.focus();
	}
	else{
		ajax(id.value);
	}
}

function ajax(mid) {
	let aj;
	function wck() {
		if(window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
	}
	function datack() {
		if(aj.readyState==XMLHttpRequest.DONE && aj.status==200) {
			if(this.response=="ok") {
				alert("아이디 사용 가능");
				document.getElementById("mid").readOnly = true;
			}
			else if(this.response=="no") {
				alert("아이디 중복");
				document.getElementById("mid").value="";
			}
		}
	}
	var postdata = "userid="+mid;
	aj = wck();
	aj.onreadystatechange = datack;
	aj.open("POST","./index4.do",true);
	aj.setRequestHeader("content-type","application/x-www-form-urlencoded");
	aj.send(postdata);
	
}