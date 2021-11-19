<style>
	#ltemlink:link { color: black; text-decoration: none;}
	#ltemlink:visited { color: black; text-decoration: none;}
	#ltemlink:hover { color: red; text-decoration: none;}
</style>

<div class="container">
  <div class="row">
  	<div class="col-md-8"></div>
  	<div class="col-md-4 mb-1 text-right">*시가총액 500억이상만 노출됩니다</div>
  </div>
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active">
	    <th class="text-center" scope="col" style="width:38%">종목명</th>
	    <th class="text-right" scope="col" style="width:10%">현재가</th>
	    <th class="text-right" scope="col" style="width:10%">전일비</th>
	    <th class="text-right" scope="col" style="width:10%">등락</th>
	    <th class="text-right" scope="col" style="width:10%">NAV</th>
	    <th class="text-right" scope="col" style="width:12%">거래량</th>
	    <th class="text-right" scope="col" style="width:10%">시총(억)</th>
	  </tr>
	</thead>
	<tbody>
	  <c:forEach var="etf" items="${etfList}">
	    <tr>
	      <td class="text-left"><a id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${etf.itemcode}" target="_blank">${etf.itemname}</a></td>
    		<c:choose>
			  <c:when test="${0 lt etf.changeVal }">
			    <td class="text-right text-danger"><fmt:formatNumber value="${etf.nowVal}" /></td>
			    <td class="text-right text-danger">▲ ${etf.changeVal}</td>
			    <td class="text-right text-danger">+${etf.changeRate}%</td>
			  </c:when>
	  		  <c:when test="${0 eq etf.changeVal}">
		        <td class="text-right"><fmt:formatNumber value="${etf.nowVal}" /></td>
		        <td class="text-right">${etf.changeVal}</td>
		        <td class="text-right">${etf.changeRate}%</td>
			  </c:when>
			  <c:when test="${0 gt etf.changeVal }">
				<td class="text-right text-primary"><fmt:formatNumber value="${etf.nowVal}" /></td>
				<td class="text-right text-primary">▼ ${etf.changeVal*-1}</td>
				<td class="text-right text-primary">${etf.changeRate}%</td>
			  </c:when>
			</c:choose>
	      <td class="text-right"><fmt:formatNumber value="${etf.nav}" /></td>
	      <td class="text-right"><fmt:formatNumber value="${etf.quant}" /></td>
	      <td class="text-right"><fmt:formatNumber value="${etf.marketSum}" /></td>
	    </tr>
	  </c:forEach>
	</tbody>
   </table>
</div>