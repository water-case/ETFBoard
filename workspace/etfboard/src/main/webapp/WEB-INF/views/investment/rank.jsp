<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div class="container">
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active">
	    <th class="text-right" scope="col" style="width:5%">순위</th>
	    <th class="text-right" scope="col" style="width:15%">닉네임</th>
	    <th class="text-right" scope="col" style="width:15%">현재자산</th>
	    <th class="text-right" scope="col" style="width:15%">투자시작일</th>
	    <th class="text-center" colspan="4" scope="col" style="width:50%">주력종목 TOP3</th>
	  </tr>
	</thead>
	<tbody>
	  <c:forEach var="mList" items="${memberList}" varStatus="status">
	    <tr>
	      <td class="text-right">${status.count}</td>
	      <td class="text-right">${mList.name}</td>
	      <td class="text-right"><fmt:formatNumber value="${mList.money}" /></td>
	      <td class="text-right">${mList.joinDate}</td>
	      <td class="text-right">삼성전자</td>
	      <td class="text-right">LG이노텍</td>
	      <td class="text-right">삼성전기</td>
	    </tr>
	  </c:forEach>
	</tbody>
   </table>
</div>