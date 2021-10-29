<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="startPage" value="${startPageIndex*5}" />

<style>
#boardTitle:link { color: black; text-decoration: none;}
#boardTitle:visited { color: orange; text-decoration: none;}
#boardTitle:hover { color: blue; text-decoration: none;}
</style>

<c:choose>
	<c:when test="${result == false}">
		<script>
			alert("글쓰기에 실패했습니다");
		</script>
	</c:when>
</c:choose>

<div class="container">
<table class="table table-sm">
  <thead>
    <tr class="table-sm table-active">
      <th class="text-center" scope="col" style="width:7%">번호</th>
      <th class="text-center" scope="col" style="width:50%">글제목</th>
      <th class="text-center" scope="col" style="width:18%">닉네임</th>
      <th class="text-center" scope="col" style="width:13%">작성일</th>
      <th class="text-center" scope="col" style="width:6%">추천</th>
      <th class="text-center" scope="col" style="width:6%">조회</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach var="board" items="${boardList}">
	  <tr>
	    <td class="text-center">${board.boardIndex}</td>
	    <td class="px-4"><a id="boardTitle" href="${contextPath}/board/contents?index=${board.boardIndex}">
	      ${board.title}&nbsp;
	      <c:choose>
			<c:when test="${board.comments != 0}">
			  [${board.comments}]
			</c:when>
		  </c:choose>
	    </a></td>
	    <td class="text-center">${board.name}</td>
	    <td class="text-center">${board.writtenDate}</td>
	    <td class="text-center">${board.push}</td>
	    <td class="text-center">${board.views}</td>
	  </tr>
	</c:forEach>
  </tbody>
</table>
<hr class="mb-4">
<!-- 페이징 -->
<!-- 조건에 따라 페이징을 적합하게 변경 -->
<!-- << 1 2 3 4 5 >> 현재페이지는 색이 다르게 표시 -->
<script>
	function writeButton() {
	    if (${isLogOn == true}) {
	    	location.href='${contextPath}/board/write'
	    } else {
	    	alert("로그인 후 이용가능합니다");
	    }
	}
</script>
	<div class="text-center row">	
      <div class="col-md-2">
		<button type="button" onclick="writeButton()" class="btn btn-secondary disabled">글쓰기</button>
      </div>
      <div class="col-md-8">
        <ul class="pagination justify-content-center">
	      <c:if test="${startPageIndex <= 0}"> <!-- 5페이지씩 왼쪽으로 -->
		    <li class="page-item disabled">	
			  <a class="page-link" href="#">&laquo;</a>
            </li>
          </c:if>
		  <c:if test="${startPageIndex > 0}">
		    <li class="page-item">
			  <a class="page-link" href="${contextPath}/board/page?page=${startPage-4}">&laquo;</a>
		    </li>
		  </c:if>
		  <c:forEach var="page" begin="${startPage+1}" end="${startPage+5}" step="1">
			<c:choose>
			  <c:when test="${page == nowPage}">
		        <li class="page-item active">
				  <a class="page-link" href="${contextPath}/board/page?page=${page}">${page}</a>
			    </li>
			  </c:when>
			  <c:when test="${page <= totalIndexCount}">
			    <li class="page-item">
				  <a class="page-link" href="${contextPath}/board/page?page=${page}">${page}</a>
				</li>
			  </c:when>
			</c:choose>
		  </c:forEach>
		  <c:if test="${startPage+5 >= totalIndexCount}">
		    <li class="page-item disabled"> <!-- 5페이지씩 오른쪽으로 -->
		      <a class="page-link" href="#">&raquo;</a>
		    </li>
		  </c:if>
		  <c:if test="${startPage+5 < totalIndexCount}">
		    <li class="page-item"> <!-- 5페이지씩 오른쪽으로 -->
		      <a class="page-link" href="${contextPath}/board/page?page=${startPageIndex+6}">&raquo;</a>
		    </li>
		  </c:if>
		</ul>
      </div>
      <div class="col-md-5"></div>
    </div>
	
</div>
