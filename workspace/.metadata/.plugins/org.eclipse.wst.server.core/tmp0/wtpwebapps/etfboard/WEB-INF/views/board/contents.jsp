<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
    document.title = "${boardContents.title}" ; <!-- 글 제목으로 title 변경 -->
    
    
    function push() {
    	$.ajax({
    		type: "post",
    		url: "./push",
    		data: {'boardIndex':'${boardContents.boardIndex}'},
    		success: function(data) {
    			if(data.first=="true"){
    				document.getElementById('push_btn').innerText = '추천 '+data.push; 
    			} else{
			    	alert("추천은 1회만 가능합니다");    				
    			}
    		}
    	});
	}
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
	    				'name':'${memberName}',
	    				'text':$('#reply_text').val()
	    		},
	    		success: function(data) {
	    			window.location.reload(true);
	    		},
	    		error: function(){
	    			alert("댓글이 작성되지 않았습니다");
	    		}
	    	});
	    }
	</script>
  </c:when>
  <c:otherwise>
  	<script>
	    // 대댓글함수
	    function comment2_insert(){
	    	alert("구현예정입니다");
	    }
	  	function comment_insert(){
	    	alert("로그인 후 가능합니다");
	    }
  	</script>
  </c:otherwise>
</c:choose>

<div class="container">
	<!-- 목록, 수정, 삭제버튼 -->
	<div class="row">
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
        <div class="col-md-3">
          ${boardContents.name} / ${boardContents.writtenDate}
        </div>
        <div class="col-md-6"></div>
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
    		<button type="button" class="btn btn-primary disabled float-right" onclick="replyRefresh()">새로고침</button>
        </div>
    </div>
    <hr class="featurette-divider">
    <!-- 댓글,대댓글 조회 -->
    <div class="row" id="reply_div">
      <c:forEach var="replyList" items="${replyList}">
      	<input type="hidden" value="${replyList.replyIndex}">
    	<div class="col-md-2 mb-1">
			<input class="form-control" type="text" placeholder="${replyList.name}" readonly="">
    	</div>
        <div class="col-md-8">
			<input class="form-control" type="text" placeholder="${replyList.text}" readonly="">
        </div>
        <div class="col-md-2">
        	<c:choose>
			  <c:when test="${isLogOn == true && memberName == replyList.name}">
	        	<button type="button" class="btn btn-danger disabled float-right mr-1">삭제</button>
				<button type="button" class="btn btn-warning disabled float-right mr-1">수정</button>
			  </c:when>
			</c:choose>
        </div>
      </c:forEach>
    </div>
    <!-- 댓글 작성창과 등록버튼 -->
    <hr class="featurette-divider">
    <div class="row">
	  <div class="col-md-2">
		<input class="form-control" type="text" value="${memberName}" readonly="">
	  </div>
	  <div class="col-md-8">
		<textarea class="form-control" id="reply_text" rows="2" placeholder="욕설, 비방등 타인에게 피해를 줄 수 있는 댓글은 자제해 주세요"></textarea>
	  </div>
	  <div class="col-md-2">
	    <button type="button" class="btn btn-info disabled" onclick="comment_insert()">등록</button>
	  </div>
    </div>
</div>