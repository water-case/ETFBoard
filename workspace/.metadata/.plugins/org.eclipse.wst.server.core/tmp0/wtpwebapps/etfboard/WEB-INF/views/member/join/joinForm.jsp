<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result}" />
<c:choose>
	<c:when test="${result=='joinFail'}">
		<script>
			alert("회원가입에 실패했습니다! 다시 시도해 주세요");
		</script>
	</c:when>
</c:choose>

<div class="container">
  <div class="py-3 text-center">
    <h2>회원가입</h2>
  </div>

  <div class="text-center">	
    <form class="needs-validation" method="post" action="${contextPath}/member/join.do">
      <div class="row">
        <div class="col-md-2 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="id">아이디</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="text" class="form-control" name="id" placeholder="" value="" required maxlength='10'>
          <div class="invalid-feedback">
            Valid id is required.
          </div>
        </div>
      </div>
        
      <div class="row">
        <div class="col-md-2 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="pwd">비밀번호</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="password" class="form-control" name="pwd" placeholder="" value="" required maxlength='12'>
          <div class="invalid-feedback">
            Valid password is required.
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-2 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="name">닉네임</label>
        </div>
        <div class="col-md-3 mb-3">
          <input type="text" class="form-control" name="name" placeholder="" value="" required maxlength='6'>
          <div class="invalid-feedback">
            Valid nickname is required.
          </div>
        </div>
      </div>
        
      <div class="row">
        <div class="col-md-2 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="email">이메일</label>
        </div>
        <div class="col-md-4 mb-3">
          <input type="email" class="form-control" name="email" placeholder="you@example.com" value="" required maxlength='30'>
          <div class="invalid-feedback">
            Valid email is required.
          </div>
        </div>
      </div>

      <hr class="mb-4">
      <button class="btn btn-dark btn-lg " type="submit">회원가입하기</button>
    </form>
  </div>
</div>