<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script>
    function logout() {
        if (confirm("로그아웃 하시겠습니까?")) {
        	location.href='${contextPath}/member/logout.do'
        }
    }
    function etfSimulator() {
	    if (${isLogOn == true}) {
	    	location.href='${contextPath}/etfsimulator?name=${memberName}'
	    } else {
	    	alert("로그인 후 이용가능합니다");
	    }
	}
</script>

<header class="p-3 bg-dark text-white shadow">
	<div class="container-fluid d-flex justify-content-between">
		<a href="${contextPath}" class="nav-link text-white align-self-center">자산배분</a>
		<nav>
			<ul class="nav justify-content-center">
				<li><a href="${contextPath}/board/page?page=1" class="nav-link px-2 text-white">소통게시판</a></li>
				<li><a href="${contextPath}/etfkorea" class="nav-link px-2 text-white">국내ETF</a></li>
				<li><a onclick="etfSimulator()" href="#" class="nav-link px-2 text-white">모의투자</a></li>
				<li><a href="${contextPath}/rank" class="nav-link px-2 text-white">투자랭킹</a></li>
			</ul>
		</nav>
		<c:choose>
			<c:when test="${isLogOn == true}">
				<div class="d-flex justify-content-between align-self-center">
					<a href="#" class="nav-link py-2 text-white">${memberName} 님</a>
					<button id="logout" type="button" onclick="logout()" class="btn btn-warning">로그아웃</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="text-end">
					<button type="button" onclick="location.href='${contextPath}/member/login'" class="btn btn-outline-light me-2">로그인</button>
					<button type="button" onclick="location.href='${contextPath}/member/join'" class="btn btn-warning">회원가입</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</header>