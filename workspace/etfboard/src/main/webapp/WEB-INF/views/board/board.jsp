<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container">
<table class="table table-bordered">
  <thead>
    <tr class="table-sm table-active">
      <th class="text-center" scope="col" style="width:7.5%">번호</th>
      <th class="text-center" scope="col" style="width:50%">글제목</th>
      <th class="text-center" scope="col" style="width:12.5%">닉네임</th>
      <th class="text-center" scope="col" style="width:15%">작성일</th>
      <th class="text-center" scope="col" style="width:7.5%">추천수</th>
      <th class="text-center" scope="col" style="width:7.5%">조회수</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach var="board" items="${boardList}">
	    <tr>
	      <td class="text-center">${board.boardIndex}</td>
	      <td>${board.title}</td>
	      <td class="text-center">${board.name}</td>
	      <td class="text-center">${board.writtenDate}</td>
	      <td class="text-center">${board.push}</td>
	      <td class="text-center">${board.views}</td>
	    </tr>
	</c:forEach>
  </tbody>
</table>

<!-- 페이징 -->
<div>
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</div>
</div>
