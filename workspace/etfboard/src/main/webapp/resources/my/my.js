// ContextPath 함수
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 로그아웃 버튼
function logout() {
    if (confirm("로그아웃 하시겠습니까?")) {
    	location.href = getContextPath() + '/member/logout.do'
    }
}

// 글 컨텐츠
var cip = "";
// 아이피 조회 함수
function getIP(json) {
	cip = json.ip;
}
// 추천수 증가 함수
function push() {
	$.ajax({
		type: "post",
		url: "./push",
		data: {
			'boardIndex':$('#boardIndex').val(),
			'ip':cip
			},
		success: function(data) {
			if(data.first=="true"){
				document.getElementById('push_btn').innerText = '추천 '+data.push; 
			} else{
		    	alert("추천은 1회만 가능합니다");
			}
		}
	});
}

// 회원가입 중복체크
function idCheck(){
	var id = document.getElementById("_id").value;
	const chk = /[^a-z0-9]/g;
	  
	if(id=="" || id.length < 4){
		document.getElementById('id_alert').innerText = '4자이상 입력해주세요';
		return 0;
	}
	if(id.search(chk) != -1){
		document.getElementById('id_alert').innerText = '소문자,숫자로 구성하세요';
		return 0;
	}
	/* id 검색 */
	$.ajax({
    	type: "post",
    	url: "./idCheck",
    	data: {'id':id},
    	success: function(data) {
    		if(data.check=="true"){
			    /* 중복되지 않으면 라벨OK세팅*/
    			document.getElementById('id_alert').innerText = 'OK'; 
    		} else{
    			/* 중복되면 알림 */
		    	document.getElementById('id_alert').innerText = '중복됩니다'; 
    		}
    	},
    	error: function(){
    		alert("실패");
    	}
	});
}
function nameCheck(){
	var name = document.getElementById("_name").value;
	const chk = /[^a-zA-Z0-9가-힣]/g;
	  
	if(name=="" || name.length < 4){
		document.getElementById('name_alert').innerText = '4자이상 입력해주세요'; 
		return 0;
	}
	if(name.search(chk) != -1){
		document.getElementById('name_alert').innerText = '영어,숫자,한글로 구성하세요';
		return 0;
	}
	/* name 검색 */
	$.ajax({
    	type: "post",
    	url: "./nameCheck",
    	data: {'name':name},
    	success: function(data) {
    		if(data.check=="true"){
			    /* 중복되지 않으면 라벨OK세팅*/
    			document.getElementById('name_alert').innerText = 'OK'; 
    		} else{
    			/* 중복되면 알림 */
		    	document.getElementById('name_alert').innerText = '중복됩니다'; 
    		}
    	},
    	error: function(){
    		alert("실패");
    	}
    });
}
function emailCheck(){
	var email = document.getElementById("_email").value;
	var chk = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/g;
	if(email.search(chk) == -1){
		document.getElementById('email_alert').innerText = '이메일 형식이 아닙니다';
		return 0;
	}
	  
	if(email=="" || email.length < 4){
		// 형식확인하기
		alert("4자이상 입력해주세요");
		return 0;
	}
	/* email 검색 */
	$.ajax({
    	type: "post",
    	url: "./emailCheck",
    	data: {'email':email},
    	success: function(data) {
    		if(data.check=="true"){
			    /* 중복되지 않으면 라벨OK세팅*/
    			document.getElementById('email_alert').innerText = 'OK'; 
    		} else{
    			/* 중복되면 알림 */
		    	document.getElementById('email_alert').innerText = 'email이 중복됩니다'; 
    		}
    	},
    	error: function(){
    		alert("실패");
    	}
    });
}