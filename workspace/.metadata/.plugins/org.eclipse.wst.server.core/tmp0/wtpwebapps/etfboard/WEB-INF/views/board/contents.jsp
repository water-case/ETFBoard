<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script>
    document.title = "${boardContents.title}" ; <!-- 글 제목으로 title 변경 -->
</script>

<div class="container">
	<!-- 목록, 수정, 삭제버튼 -->
	<div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6"></div>
        <div class="col-md-3">
        	<button type="button" class="btn btn-secondary disabled">목록</button>
        	<button type="button" class="btn btn-warning disabled">수정</button>
        	<button type="button" class="btn btn-danger disabled">삭제</button>
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
        <div class="col-md-3">
          조회 ${boardContents.views} 추천 ${boardContents.push} 댓글 #
        </div>
    </div>
    <hr class="featurette-divider">
    
    <!-- 글내용 -->
    ${boardContents.text}
    <hr class="featurette-divider">
    <!-- 추천버튼 -->
    <div class="row">
        <div class="col-md-5"></div>
        <div class="col-md-3">
    		<button type="button" class="btn btn-primary disabled">추천 ${boardContents.push}</button>
        </div>
        <div class="col-md-3"></div>
    </div>
    <hr class="featurette-divider">
    <!-- 댓글,대댓글 -->
    <div class="row">
    	<div class="col-md-2">
			<input class="form-control" type="text" placeholder="${boardContents.name}" readonly="">
    	</div>
        <div class="col-md-8">
			<input class="form-control" type="text" placeholder="${boardContents.title}" readonly="">
        </div>
        <div class="col-md-2">
			<button type="button" class="btn btn-warning disabled">수정</button>
        	<button type="button" class="btn btn-danger disabled">삭제</button>
        </div>
    </div>
    <hr class="featurette-divider">
    <!-- 댓글 작성창과 등록버튼 -->
    <div class="row">
    	<div class="col-md-2">
			<input class="form-control" type="text" placeholder="${member.name}" readonly="">
    	</div>
        <div class="col-md-8">
			<textarea class="form-control" rows="2" placeholder="욕설, 비방등 남에게 피해를 줄 수 있는 댓글은 자제해 주세요"></textarea>
        </div>
        <div class="col-md-2">
			<button type="button" class="btn btn-info disabled">등록</button>
        </div>
    </div>
</div>