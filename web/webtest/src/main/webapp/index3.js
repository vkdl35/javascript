let data;
function wck(){
   if(window.XMLHttpRequest){
      return new XMLHttpRequest();
   }
}
function members(){
   
   if(data.readyState == XMLHttpRequest.DONE && data.status==200){
      member_list(data.response);
   }
   else if(data.status==404){
      error();      
   }
}
data = wck();
data.onreadystatechange = members;
data.open("GET","./index3.json",true);
data.send();

function member_list(jdata){
   var j = JSON.parse(jdata);
   
   var total = j["members"].length;
   var f, tb, tr, td, text;
   tb = document.getElementById("tb");
   for(f in j.members) {
		tr = document.createElement("tr");
		td = document.createElement("td");
		td.innerText = total;
		tr.append(td);
		var ff;
		//getAttribute : 속성값을 가져올 때(style,onclick,class...)
		for(ff in j.members[f]) {
			if(ff=="id") {				
				tr.setAttribute("onclick","java_get('"+j.members[f][ff]+"')");
			}
			td = document.createElement("td");
			//console.log(j.members[f][ff]);
			if(ff == "area") {
				ff = "phone";
			}
			else if(ff == "phone") {
				ff = "area";
			}
			text = document.createTextNode(j.members[f][ff]);
			td.append(text);
			tr.append(td);
		}
		
		tb.append(tr);
		total--;
	}
	

   //console.log(j);
   /*var tb, tr, td, w, ww, no;
	tb = document.getElementById("tb");
	
	for(w in j["members"]) {
		tr = document.createElement("tr");
		for(ww in j["members"][w]) {
			var code;
			switch(ww) {
				case "id":
				code = "name";
				break;
				case "name":
				code = "id";
				break;
				case "email":
				code = "email";
				break;
				case "area":
				code = "phone";
				break;
				case "phone":
				code = "area";
				break;
			}
			td = document.createElement("td");
			td.append(j["members"][w][code]);
			tr.append(td);
		}
		//td.append();
		tb.append(tr);
	}*/
}
function error() {
	//alert("파일 로드 불가");
	return false;
}

function java_get(mid) {
	location.href='./first.do?mid='+mid;
}


