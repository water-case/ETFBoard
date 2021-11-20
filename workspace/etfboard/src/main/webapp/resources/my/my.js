// ContextPath 함수
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 게시판 글쓰기 버튼
function writeButton(isLogOn) {
    if (isLogOn == true) {
    	location.href = getContextPath() + '/board/write';
    } else {
    	alert("로그인 후 이용가능합니다");
    }
}

// 로그아웃 버튼
function logout() {
    if (confirm("로그아웃 하시겠습니까?")) {
    	location.href = getContextPath() + '/member/logout.do'
    }
}

// 모의투자 접속 버튼
function etfSimulator(isLogOn, memberName) {
    	var _uri = getContextPath() + '/etfsimulator?name='+ memberName;
    	var uri=encodeURI(_uri);
	    if (isLogOn == true) {
	    	location.href=uri;
	    } else {
	    	alert("로그인 후 이용가능합니다");
	    }
	}