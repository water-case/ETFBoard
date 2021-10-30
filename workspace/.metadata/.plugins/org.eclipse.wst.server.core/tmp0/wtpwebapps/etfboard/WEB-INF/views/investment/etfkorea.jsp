<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<div class="container">
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active">
	    <th class="text-center" scope="col" style="width:43%">종목명</th>
	    <th class="text-right" scope="col" style="width:9%">현재가</th>
	    <th class="text-right" scope="col" style="width:9%">전일비</th>
	    <th class="text-right" scope="col" style="width:9%">등락</th>
	    <th class="text-right" scope="col" style="width:9%">NAV</th>
	    <th class="text-right" scope="col" style="width:12%">거래량</th>
	    <th class="text-right" scope="col" style="width:9%">시총(억)</th>
	  </tr>
	</thead>
	<tbody>
	  <c:forEach var="etf" items="${etfList}">
	    <c:choose>
		  <c:when test="${0 eq etf.changeVal}">
		    <tr>
		      <td class="text-left">${etf.itemname}</td>
		      <td class="text-right">${etf.nowVal}</td>
		      <td class="text-right">${etf.changeVal}</td>
		      <td class="text-right">${etf.changeRate}%</td>
		      <td class="text-right">${etf.nav}</td>
		      <td class="text-right">${etf.quant}</td>
		      <td class="text-right">${etf.marketSum}</td>
		    </tr>
		  </c:when>
		  <c:when test="${0 lt etf.changeVal }">
			<tr>
			  <td class="text-left">${etf.itemname}</td>
			  <td class="text-right text-danger">${etf.nowVal}</td>
			  <td class="text-right text-danger">▲ ${etf.changeVal}</td>
			  <td class="text-right text-danger">${etf.changeRate}%</td>
			  <td class="text-right">${etf.nav}</td>
			  <td class="text-right">${etf.quant}</td>
			  <td class="text-right">${etf.marketSum}</td>
			</tr>
		  </c:when>
		  <c:when test="${0 gt etf.changeVal }">
			<tr>
			  <td class="text-left">${etf.itemname}</td>
			  <td class="text-right text-primary">${etf.nowVal}</td>
			  <td class="text-right text-primary">▼ ${etf.changeVal}</td>
			  <td class="text-right text-primary">${etf.changeRate}%</td>
			  <td class="text-right">${etf.nav}</td>
			  <td class="text-right">${etf.quant}</td>
			  <td class="text-right">${etf.marketSum}</td>
			</tr>
		  </c:when>
		</c:choose>
	  </c:forEach>
	</tbody>
   </table>
</div>