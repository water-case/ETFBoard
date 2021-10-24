<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result}" />
<c:choose>
	<c:when test="${result=='joinSuccess'}">
		<script>
			alert("회원가입에 성공했습니다! 로그인 하세요");
		</script>
	</c:when>
	<c:when test="${result=='loginFail'}">
		<script>
			alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
		</script>
	</c:when>
</c:choose>

<div class="container">
	<form class="form-signin" method="post" action="${contextPath}/member/login.do">
		<h2 class="h2 mb-4 font-weight-normal">로그인 정보 입력</h2>
		<input type="text" name="id" id="inputId" class="form-control" placeholder="Id" required autofocus>
		<div class="mb-3"></div>
		<input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required>
		<!-- <div class="checkbox mb-3">
			<label>
				<input type="checkbox" value="remember-me"> Remember me
			</label>
		</div> -->
		<div class="text-center">
			<button class="btn btn-lg btn-dark" type="submit">로그인</button>
		</div>
	</form>
</div>