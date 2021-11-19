<c:set var="result" value="${param.result}" />

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
  <c:choose>
	<c:when test="${result=='joinFail'}">
	  alert("회원가입에 실패했습니다! 다시 시도해 주세요");
	</c:when>
  </c:choose>
  
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
	  var chk = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
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
  
</script>

<div class="container">
  <div class="py-3 text-center">
    <h2>회원가입</h2>
  </div>

  <div class="text-center">	
    <form class="needs-validation" method="post" action="${contextPath}/member/join.do">
      <div class="row">
        <div class="col-md-1 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="id">아이디</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="text" class="form-control" name="id" id="_id" pattern="^[a-z0-9]{4,10}$" maxlength='10' minlength='4' placeholder="소문자,숫자로 4~10글자" required>
        </div>
          <button type="button" class="btn btn-secondary mb-3" id="id_btn" onClick="idCheck()">중복확인</button>
          <p class="text-primary ml-3 align-self-center" id="id_alert"></p>
      </div>
        
      <div class="row">
        <div class="col-md-1 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="pwd">비밀번호</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="password" class="form-control" name="pwd" id="_pwd" pattern="^[a-zA-Z0-9]{8,14}$" maxlength='12' minlength='4' placeholder="대소문자구별" required >
        </div>
      </div>

      <div class="row">
        <div class="col-md-1 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="name">닉네임</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="text" class="form-control" name="name" id="_name" pattern="^[a-zA-Z0-9가-힣]{2,8}$" placeholder="4~8글자" value="" required maxlength='8' minlength='4'>
        </div>
        <button type="button" class="btn btn-secondary mb-3" id="name_btn" onClick="nameCheck()">중복확인</button>
        <p class="text-primary ml-3 align-self-center" id="name_alert"></p>
      </div>
        
      <div class="row">
        <div class="col-md-1 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="email">이메일</label>
        </div>
        <div class="col-md-4 mb-3">
          <input type="email" class="form-control" name="email" id="_email" pattern="/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/" placeholder="you@example.com" value="" required maxlength='30'>
          
        </div>
        <button type="button" class="btn btn-secondary mb-3" id="email_btn" onClick="emailCheck()">중복확인</button>
        <p class="text-primary ml-3 align-self-center" id="email_alert"></p>
      </div>

      <hr class="mb-4">
      <button class="btn btn-dark btn-lg " type="submit">회원가입하기</button>
    </form>
  </div>
</div>