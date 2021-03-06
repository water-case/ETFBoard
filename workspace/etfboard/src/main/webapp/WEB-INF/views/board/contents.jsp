<script type="text/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
<script type="text/javascript">
	// 글 제목으로 title 변경
    document.title = "${boardContents.title}" ; 
</script>

<c:choose>
  <c:when test="${isLogOn == true && memberName != null}">
	<script type="text/javascript">
		// 댓글 작성
		function comment_insert(){
			$.ajax({
	    		type: "post",
	    		url: "./insertReply",
	    		data: {'boardIndex':'${boardContents.boardIndex}',
	    			   'grade':0,
	    			   'groupIndex':0, // 사용안함
	    			   'name':'${memberName}',
	    			   'text':$('#reply_textarea').val()
	    		},
	    		success: function(data) {
	    			window.location.reload(true);
	    		},
	    		error: function(){
	    			alert("댓글이 작성되지 않았습니다");
	    		}
	    	});
	    }
		
		// 댓글 수정
		var editOn = false;
		function reply_edit(replyIndex,text){
			if(editOn == false){
				editOn = true;
				$('#reply_text'+replyIndex).attr("readonly", false);
				$('#replyEdit_btn'+replyIndex).text("완료");
			} else {
				editOn = false;
				if($('#reply_text'+replyIndex).val() == text){
					$('#reply_text'+replyIndex).attr("readonly", true);	
					$('#replyEdit_btn'+replyIndex).text("수정");
				} else {
					// 서버로 데이터 전송
					$.ajax({
			    		type: "post",
			    		url: "./updateReply",
			    		data: {'replyIndex':replyIndex,
			    				'text':$('#reply_text'+replyIndex).val()
			    		},
			    		success: function(data) {
			    			if(data.success){
				    			alert("수정되었습니다");
			    			} else {
			    				alert("특정문제로 수정되지 않았습니다");
			    				window.location.reload(true);
			    			}
			    		},
			    		error: function(){
			    			alert("수정되지 않았습니다");
			    			$('#reply_text'+replyIndex).val(text);
			    		}
			    	});
					// 버튼과 text원상태로
					$('#reply_text'+replyIndex).attr("readonly", true);
					$('#replyEdit_btn'+replyIndex).text("수정");
				}
			}
		}
		
		// 댓글 삭제
		function reply_delete(replyIndex){
			$.ajax({
	    		type: "post",
	    		url: "./deleteReply",
	    		data: {'replyIndex':replyIndex, 'boardIndex':'${boardContents.boardIndex}'},
	    		success: function(data) {
	    			if(data.success){
		    			alert("삭제되었습니다");
		    			window.location.reload(true);
	    			} else {
	    				alert("특정문제로 삭제되지 않았습니다");
	    			}
	    		},
	    		error: function(){
	    			alert("삭제되지 않았습니다");
	    		}
	    	});
		}
		// 대댓글 폼 생성 함수
		function rereply_div(replyIndex){
			$("#reply_div"+replyIndex).after('<hr class="featurette-divider" id="rere1">'
					+'<div class="row" id="rere2">'
					  +'<div class="col-md-1"></div>'
					  +'<div class="col-md-2">'
						+'<input class="form-control" type="text" value="${memberName}" readonly="">'
					  +'</div>'
					  +'<div class="col-md-7">'
						+'<textarea class="form-control" id="reply_textarea'+replyIndex+'" rows="2" placeholder="욕설, 비방등 타인에게 피해를 줄 수 있는 댓글은 자제해 주세요" minlength="3" maxlength="30"></textarea>'
					  +'</div>'
					  +'<div class="col-md-2">'
					    +'<button type="button" class="btn btn-info disabled float-right mr-1" onclick="comment2_insert('+replyIndex+')">등록</button>'
					  +'</div>'
				    +'</div>'
				    +'<hr class="featurette-divider" id="rere3">');
		}
		// 대댓글 폼
		var rereplyOn = false;
		var rereplyIndex;
		function rereply_form(replyIndex){
			// readonly 이면 폼생성 아니면 무반응
			if($('#reply_text'+replyIndex).prop("readonly") == true && rereplyOn == false){
				rereplyOn = true;
				rereplyIndex=replyIndex;
				// 대댓글 폼 생성 함수 호출
				rereply_div(replyIndex);
			} else if(replyIndex != rereplyIndex) {
				rereplyOn = true;
				rereplyIndex=replyIndex;
				$("#rere1").remove();
				$("#rere2").remove();
				$("#rere3").remove();
				// 대댓글 폼 생성 함수 호출
				rereply_div(replyIndex);
			} else {
				$("#rere1").remove();
				$("#rere2").remove();
				$("#rere3").remove();
				rereplyOn = false;
			}
		}
		// 대댓글 작성
	    function comment2_insert(replyIndex){
	    	$.ajax({
	    		type: "post",
	    		url: "./insertReply",
	    		data: {'boardIndex':'${boardContents.boardIndex}',
	    			   'grade':1,
	    			   'groupIndex':replyIndex,
	    			   'name':'${memberName}',
	    			   'text':$('#reply_textarea'+replyIndex).val()
	    		},
	    		success: function(data) {
	    			window.location.reload(true);
	    		},
	    		error: function(){
	    			alert("대댓글이 작성되지 않았습니다");
	    		}
	    	});
	    }
	</script>
  </c:when>
</c:choose>


<div class="container">
	<!-- 목록, 수정, 삭제버튼 -->
	<div class="row">
		<input type="hidden" id="boardIndex" value="${boardContents.boardIndex}"/>
        <div class="col-md-3"></div>
        <div class="col-md-6"></div>
        <div class="col-md-3">
        	<c:choose>
			  <c:when test="${isLogOn == true && boardContents.name == memberName}">
		        <button type="button" class="btn btn-danger disabled float-right mr-1" onclick="location.href='${contextPath}/board/delete?index=${boardContents.boardIndex}'">삭제</button>
		        <button type="button" class="btn btn-warning disabled float-right mr-1" onclick="location.href='${contextPath}/board/update?index=${boardContents.boardIndex}'">수정</button>
			  </c:when>
			</c:choose>
        	<button type="button" class="btn btn-secondary disabled float-right mr-1" onclick="location.href='${contextPath}/board'">목록</button>
        </div>
    </div>
	<hr class="featurette-divider">
	<!-- 제목 -->
	<div class="row">
        <div class="col-md-8">
          <h6><strong>${boardContents.title}</strong></h6>
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-2">
        </div>
    </div>
    
    <!-- 닉네임과 작성시간 조회수 추천수 댓글수-->
	<div class="row">
        <div class="col-md-4">
          ${boardContents.name} / ${boardContents.writtenDate}
        </div>
        <div class="col-md-5"></div>
        <div class="col-md-3 text-right">
          조회 ${boardContents.views} 추천 ${boardContents.push} 댓글 ${boardContents.comments}
        </div>
    </div>
    <hr class="featurette-divider">
    
    <!-- 글내용 -->
    <textarea readonly class="form-control" name="text" style="margin-top: 10px; margin-bottom: 10px; height: 400px; textarea.autosize; resize:none;" required maxlength='400'>${boardContents.text}</textarea>
    <hr class="featurette-divider">
    <!-- 추천버튼 -->
    <div class="row">
        <div class="col-md-5"></div>
        <div class="col-md-3">
    		<button type="button" id="push_btn" class="btn btn-primary disabled" onclick="push()">추천 ${boardContents.push}</button>
        </div>
        <div class="col-md-4">
    		<button type="button" class="btn btn-primary disabled float-right" onclick="window.location.reload(true)">새로고침</button>
        </div>
    </div>
    <hr class="featurette-divider">
    <!-- 댓글,대댓글 조회 -->
    <c:forEach var="replyList" items="${replyList}">
      <c:choose>
	    <c:when test="${replyList.groupIndex==0}">
	  	  <hr class="featurette-divider">
	    </c:when>
	  </c:choose>
	  <div class="row" id="reply_divNull">
	    <c:choose>
	      <c:when test="${replyList.groupIndex==0}">
	      	<div class="col-md-2 mb-1">
			  <input class="form-control" type="text" placeholder="" readonly="">
		    </div>
		    <div class="col-md-8">
			  <input class="form-control text-danger" type="text" id="reply_text${replyList.replyIndex}_delete" value="삭제된 댓글입니다" readonly="" minlength='2' maxlength='30'>
		    </div>
		    <div class="col-md-2"></div>
	      </c:when>
	    </c:choose>
	  </div>
      <div class="row" id="reply_div${replyList.replyIndex}">
        <c:choose>
          <c:when test="${replyList.grade==0}">
	    	<div class="col-md-2 mb-1">
				<input class="form-control" type="text" placeholder="${replyList.name}" readonly="">
	    	</div>
	        <div class="col-md-8">
				<input class="form-control" type="text" onclick="rereply_form(${replyList.replyIndex})" id="reply_text${replyList.replyIndex}" value="${replyList.text}" readonly="" minlength='2' maxlength='30'>
	        </div>
          </c:when>
          <c:otherwise>
            <div class="col-md-1 pr-0 text-right align-self-center">⇒</div>
            <div class="col-md-2 mb-1">
				<input class="form-control" type="text" placeholder="${replyList.name}" readonly="">
	    	</div>
	        <div class="col-md-7">
				<input class="form-control" type="text" id="reply_text${replyList.replyIndex}" value="${replyList.text}" readonly="" minlength='2' maxlength='30'>
	        </div>
          </c:otherwise>
        </c:choose>
        <div class="col-md-2">
        	<c:choose>
			  <c:when test="${isLogOn == true && memberName == replyList.name}">
	        	<button type="button" class="btn btn-danger disabled float-right mr-1" onclick="reply_delete(${replyList.replyIndex})">삭제</button>
				<button type="button" id="replyEdit_btn${replyList.replyIndex}" onclick="reply_edit(${replyList.replyIndex},'${replyList.text}')" class="btn btn-warning disabled float-right mr-1">수정</button>
			  </c:when>
			</c:choose>
        </div>
      </div>
    </c:forEach>
    <!-- 댓글 작성창과 등록버튼 -->
    <hr class="featurette-divider">
    <div class="row">
	  <div class="col-md-2">
		<input class="form-control" type="text" value="${memberName}" readonly="">
	  </div>
	  <div class="col-md-8">
		<textarea class="form-control" id="reply_textarea" rows="2" placeholder="욕설, 비방등 타인에게 피해를 줄 수 있는 댓글은 자제해 주세요" minlength='3' maxlength='30'></textarea>
	  </div>
	  <div class="col-md-2">
	    <button type="button" class="btn btn-info disabled float-right mr-1" onclick="comment_insert()">등록</button>
	  </div>
    </div>
</div>