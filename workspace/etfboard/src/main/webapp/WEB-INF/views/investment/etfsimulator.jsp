<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<script type="text/javascript">

	function addItem(){
		var _itemcode = document.getElementById('input_itemcode').value;
		if(_itemcode.length >= 6){
			location.href='${contextPath}/etfsimulator/add?name=${memberName}&itemcode='+_itemcode;			
		} else if(_itemcode.length < 6) {
			alert("종목코드를 제대로 입력했는지 확인해주세요");
		} else {
			alert("종목코드를 입력해주세요");
		}
	}
	
	function subItem(itemcode, havenum){
		if(havenum == 0){
			location.href='${contextPath}/etfsimulator/sub?name=${memberName}&itemcode='+itemcode;			
		} else {
			alert("보유하신 수량을 모두 매도 후 시도해주세요");
		}
	}
	
	// 리팩토링때 매수매도 함수 합치기
	function buyItem(itemcode){
		var buyNum = document.getElementById('input_buyAndSellnum'+itemcode).value;
		
		/************** 평일 09:05 ~ 15:15 이외 거래 금지 *************/
		var nowTime = new Date();
		var day = nowTime.getDay();
		var hour = nowTime.getHours();
		var min = nowTime.getMinutes();
		var time_result = hour*100+min;
		if(time_result >= 905 && time_result <= 1515 || (day == 0 || day == 6)){
		} else {
			alert("거래시간이 아닙니다 09:05 ~ 15:15");
			return 0;
		}
		/************** 평일 09:05 ~ 15:15 이외 거래 금지 끝*************/
		
		if(buyNum > 0) {
			location.href='${contextPath}/etfsimulator/buy?name=${memberName}&itemcode='+itemcode+'&buyNum='+buyNum;
		} else {
			alert('수량을 입력해주세요');
		}
	}
	
	function sellItem(itemcode){
		var sellNum = document.getElementById('input_buyAndSellnum'+itemcode).value;
		
		/************** 09:05 ~ 15:15 이외 거래 금지 *************/
		var nowTime = new Date();
		var day = nowTime.getDay();
		var hour = nowTime.getHours();
		var min = nowTime.getMinutes();
		var time_result = hour*100+min;
		if(time_result >= 905 && time_result <= 1515 || (day == 0 || day == 6)){
		} else {
			alert("거래시간이 아닙니다 09:05 ~ 15:15");
			return 0;
		}
		/************** 09:05 ~ 15:15 이외 거래 금지 끝*************/

		if(sellNum > 0){
			location.href='${contextPath}/etfsimulator/sell?name=${memberName}&itemcode='+itemcode+'&sellNum='+sellNum;
		} else {
			alert('수량을 입력해주세요');
		}
	}
	function calCount(){
		var weightMoney = document.getElementById('input_weightMoney').value; // 금액
		var itemCodeList = []; // 비중
		var nowPriceList = []; // 현재가
		var weightList = [];
		
		
		/***************데이터 파싱*****************/
		<c:forEach var="List" items="${checkList}">
			nowPriceList.push("${List.nowPrice}");
			itemCodeList.push("${List.itemcode}")
		</c:forEach>
		
		for(var i=0; i<${fn:length(checkList)}; i++){
			weightList[i] = document.getElementById('input_weightPer'+itemCodeList[i]).value;
			/* if(weightList[i] == 0)
				return 0; */
		}
		/***************데이터 파싱 끝*****************/
		
		if(weightMoney != 0){
			for(var i=0; i<${fn:length(checkList)}; i++){
				document.getElementById('result_weight'+itemCodeList[i]).innerText = Math.floor(weightMoney*(weightList[i]/100)/nowPriceList[i]);
				//alert(document.getElementById('result_weight'+itemCodeList[i]).value);
			}
			
		} else {
			alert('금액을 입력해주세요');
		}
	}
</script>
<!-- 현재 자산 가치 계산 -->
<c:set var="totalValue" value="0"/>
<c:forEach var="List" items="${checkList}">
  <c:set var="totalValue" value="${totalValue+(List.nowPrice*List.havenum)}"/>
</c:forEach>
<!-- 현재 자산 가치 계산 끝 -->
<div class="container">
  <table class="table mb-0">
    <tr>
      <td class="text-left" style="width:50%">
        <strong>현재 잔액 : <fmt:formatNumber value="${money}" /> 원 (보유 비중 <fmt:formatNumber type="percent" pattern="0.00%" value="${money/(totalBuyMoney + money)}"/>)</strong>
      </td>
      <td class="text-left" style="width:50%">
        <strong>자산 총계 : <fmt:formatNumber value="${totalValue + money}" /> 원</strong>
      </td>
    </tr>
    <tr>
      <td class="text-left" style="width:50%">
        <strong>총 매수액 : <fmt:formatNumber value="${totalBuyMoney}" /> 원 (보유 비중 <fmt:formatNumber type="percent" pattern="0.00%" value="${totalBuyMoney/(totalBuyMoney + money)}"/>)</strong>
      </td>
      <td class="text-left" style="width:50%">
        <strong>총 평가액 : <fmt:formatNumber value="${totalValue}" /> 원 (수익률 <fmt:formatNumber type="percent" pattern="0.00%" value="${totalValue/totalBuyMoney-1}"/>)</strong>
      </td>
    </tr>
  </table>
  <hr class="mt-0 mb-2">
  
  <div class="row mb-2">
      <div class="col-md-3 text-right align-self-center">
        <strong>추가할 종목코드를 입력 : </strong>
      </div>
      <div class="col-md-2">
        <input class="form-control" type="text" id="input_itemcode" style="text-align:center;" maxlength='6'>
      </div>
      <div class="col-md-3 pl-0">
        <button type="button" class="btn btn-primary" onclick="addItem()">종목추가</button>
      </div>
      <div class="col-md-2 pr-0 pl-5">
        <input class="form-control text-right " type="text" id="input_weightMoney" placeholder="계산할 금액" style="text-align:center;" maxlength='10'>
      </div>
      <div class="col-md-2">
        <button type="button" class="btn btn-warning btn-block" onclick="calCount()">수량계산</button>
      </div>
  </div>
  
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active" style="font-size: 14px">
	    <th class="text-center align-middle" scope="col" style="width:3%"></th>
	    <th class="text-center align-middle" scope="col" style="width:40%">종목명</th>
	    <th class="text-right  align-middle" scope="col" style="width:6%">현재가</th>
	    <th class="text-center  align-middle" scope="col" style="width:6%">보유량</th>
	    <th class="text-center  align-middle" scope="col" style="width:8%">보유<br>비중</th>
	    <th class="text-right  align-middle" scope="col" style="width:7%">평균&nbsp;&nbsp;<br>매수가</th>
	    <th class="text-right  align-middle" scope="col" style="width:6%">수익률</th>
	    <th class="text-center align-middle" scope="col" style="width:3%">매수</th>
	    <th class="text-center align-middle" scope="col" style="width:7%">수량</th>
	    <th class="text-center align-middle" scope="col" style="width:3%">매도</th>
	    <th class="text-center align-middle" scope="col" style="width:6%">비중(%)</th>
	    <th class="text-center  align-middle" scope="col" style="width:5%">추천수량</th>
	  </tr>
	</thead>
	<tbody>
	  <c:forEach var="checkList" items="${checkList}">
		<tr>
	      <td class="text-center align-middle">
	        <button type="button" class="btn btn-warning btn-sm" id="subItem_btn${checkList.itemcode}" onclick="subItem(${checkList.itemcode}, ${checkList.havenum})">-</button>
	      </td>
	      <c:choose>
	  		<c:when test="${checkList.nowPrice gt checkList.savePrice}">
		      <td class="text-left align-middle"><a class="text-danger" href="https://finance.naver.com/item/main.naver?code=${checkList.itemcode}" target="_blank">${checkList.itemName}</a></td>
		      <td class="text-right align-middle text-danger"><fmt:formatNumber value="${checkList.nowPrice}" /></td>
	  		</c:when>
	  		<c:when test="${checkList.nowPrice eq checkList.savePrice}">
		      <td class="text-left align-middle"><a class="text-dark" id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${checkList.itemcode}" target="_blank">${checkList.itemName}</a></td>
		      <td class="text-right align-middle"><fmt:formatNumber value="${checkList.nowPrice}" /></td>
	  		</c:when>
	  		<c:when test="${checkList.nowPrice lt checkList.savePrice}">
		      <td class="text-left align-middle"><a class="text-primary" id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${checkList.itemcode}" target="_blank">${checkList.itemName}</a></td>
		      <td class="text-right align-middle text-primary"><fmt:formatNumber value="${checkList.nowPrice}" /></td>
	  		</c:when>
	  	  </c:choose>
	      <td class="text-right align-middle">${checkList.havenum}</td>
	      <td class="text-right align-middle "><fmt:formatNumber type="percent" pattern="0.00%" value="${checkList.buymoney/totalBuyMoney}"/></td>
	      <td class="text-right align-middle"><fmt:formatNumber value="${checkList.buymoney/checkList.havenum}" /></td>
	      <td class="text-right align-middle"><fmt:formatNumber type="percent" pattern="0.00%" value="${((checkList.nowPrice*checkList.havenum)/checkList.buymoney)-1}"/></td>
	      <td class="text-center align-middle">
	        <button type="button" class="btn btn-danger btn-sm" onclick="buyItem('${checkList.itemcode}')" style="font-size: 12px">매수</button>
	      </td>
	      <td class="text-right align-middle">
	        <input class="form-control" type="text" id="input_buyAndSellnum${checkList.itemcode}" maxlength='3' style="text-align:center;">
	      </td>
	      <td class="text-center align-middle">
	        <button type="button" class="btn btn-primary btn-sm" onclick="sellItem('${checkList.itemcode}')" style="font-size: 12px">매도</button>
	      </td>
	      <td class="text-right align-middle">
	      	<input class="form-control" type="text" id="input_weightPer${checkList.itemcode}" maxlength='2' style="text-align:center;">
	      </td>
	      <td class="text-center align-middle" id="result_weight${checkList.itemcode}">0</td>
	    </tr>
	  </c:forEach>
	</tbody>
  </table>
</div>