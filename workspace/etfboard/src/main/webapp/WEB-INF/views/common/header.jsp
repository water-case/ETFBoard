<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script>
    function logout() {
        if (confirm("로그아웃 하시겠습니까?")) {
        	location.href='${contextPath}/member/logout.do'
        }
    }
    function rebalancing() {
	    if (${isLogOn == true && member != null}) {
	    	location.href='${contextPath}/rebalancing'
	    } else {
	    	alert("로그인 후 이용가능합니다");
	    }
	}
</script>

				<header class="p-3 bg-dark text-white shadow">
					<div class="container-fluid">
						<div class="d-flex justify-content-between">
							<a href="${contextPath}" class="nav-link px-3 text-white">자산배분</a>
							
							<ul class="nav col-5 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					          <%-- <li><a href="${contextPath}" class="nav-link px-2 text-secondary">홈</a></li> --%>
					          <li><a href="${contextPath}/board" class="nav-link px-2 text-white">소통게시판</a></li>
					          <li><a href="${contextPath}/etfkorea" class="nav-link px-2 text-white">국내ETF</a></li>
					          <li><a onclick="rebalancing()" href="#" class="nav-link px-2 text-white">리밸런싱계산기</a></li>
					        </ul>
							
							<c:choose>
								<c:when test="${isLogOn == true && member != null}">
									<div class="d-flex justify-content-between">
										<a href="#" class="nav-link py-2 text-white">${member.name} 님</a>
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
					</div>
				</header>