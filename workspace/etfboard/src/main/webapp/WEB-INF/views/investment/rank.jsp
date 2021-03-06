<div class="container">
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active">
	    <th class="text-right" scope="col" style="width:5%">순위</th>
	    <th class="text-right" scope="col" style="width:13%">닉네임</th>
	    <th class="text-right" scope="col" style="width:12%">현재자산</th>
	    <th class="text-right" scope="col" style="width:10%">투자시작일</th>
	    <th class="text-center" colspan="4" scope="col" style="width:60%">보유종목 TOP3</th>
	  </tr>
	</thead>
	<tbody>
	  <c:forEach var="mList" items="${memberList}" varStatus="status">
	    <tr>
	      <td class="text-right">${status.count}</td>
	      <td class="text-right">${mList.name}</td>
	      <td class="text-right"><fmt:formatNumber value="${mList.money}" /></td>
	      <td class="text-right">${mList.joinDate}</td>
	      <td class="text-right"><a id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${mList.top3code[0]}" target="_blank">${mList.top3[0]}</a></td>
	      <td class="text-right"><a id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${mList.top3code[1]}" target="_blank">${mList.top3[1]}</a></td>
	      <td class="text-right"><a id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${mList.top3code[2]}" target="_blank">${mList.top3[2]}</a></td>
	    </tr>
	  </c:forEach>
	</tbody>
   </table>
</div>