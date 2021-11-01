<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script type="text/javascript">
	function addItem(){
		var _itemcode = document.getElementById('input_itemcode').value;
		location.href='${contextPath}/etfsimulator/add?name=${memberName}&itemcode='+_itemcode;
	}
	
	function subItem(itemcode, havenum){
		if(havenum == 0){
			location.href='${contextPath}/etfsimulator/sub?name=${memberName}&itemcode='+itemcode;			
		} else {
			alert("보유하신 수량을 모두 매도 후 시도해주세요");
		}
	}
</script>

<div class="container">
  <table class="table mb-0">
    <tr>
      <td class="text-left text-primary" style="width:50%">
        <strong>잔고 : <fmt:formatNumber value="${money}" /> 원</strong>
      </td>
      <td class="text-left text-primary" style="width:50%">
        <strong>자산 총계 : <fmt:formatNumber value="${money}" /> 원</strong>
        </td>
    </tr>
  </table>
  <hr class="mt-0 mb-2">
  
  <div class="row mb-2">
      <div class="col-md-6 text-right align-self-center">
        <strong>추가할 종목의 코드를 입력하세요 : </strong>
      </div>
      <div class="col-md-2">
        <input class="form-control" type="text" id="input_itemcode" style="text-align:center;" maxlength='6'>
      </div>
      <div class="col-md-2 pl-0">
        <button type="button" class="btn btn-primary" onclick="addItem()">종목추가</button>
      </div>
    <div class="col-md-2">
      <button type="button" class="btn btn-warning btn-block">수량계산</button>
    </div>
  </div>
  
  <table class="table table-sm">
	<thead>
	  <tr class="table-sm table-active">
	    <th class="text-center" scope="col" style="width:5%"></th>
	    <th class="text-center" scope="col" style="width:23%">종목명</th>
	    <th class="text-right" scope="col" style="width:7%">현재가</th>
	    <th class="text-right" scope="col" style="width:7%">보유량</th>
	    <th class="text-right" scope="col" style="width:12%">평균매수가</th>
	    <th class="text-right" scope="col" style="width:8%">수익률</th>
	    <th class="text-center" scope="col" style="width:8%">매수</th>
	    <th class="text-center" scope="col" style="width:7%">수량</th>
	    <th class="text-center" scope="col" style="width:8%">매도</th>
	    <th class="text-center" scope="col" style="width:7%">비중</th>
	    <th class="text-right" scope="col" style="width:8%">추천수량</th>
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
		      <td class="text-right align-middle text-danger">${checkList.nowPrice}</td>
	  		</c:when>
	  		<c:when test="${checkList.nowPrice eq checkList.savePrice}">
		      <td class="text-left align-middle"><a id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${checkList.itemcode}" target="_blank">${checkList.itemName}</a></td>
		      <td class="text-right align-middle">${checkList.nowPrice}</td>
	  		</c:when>
	  		<c:when test="${checkList.nowPrice lt checkList.savePrice}">
		      <td class="text-left align-middle"><a class="text-primary" id="ltemlink" href="https://finance.naver.com/item/main.naver?code=${checkList.itemcode}" target="_blank">${checkList.itemName}</a></td>
		      <td class="text-right align-middle text-primary">${checkList.nowPrice}</td>
	  		</c:when>
	  	  </c:choose>
	      <td class="text-right align-middle">${checkList.havenum}</td>
	      <td class="text-right align-middle">${checkList.buymoney/checkList.havenum}</td>
	      <td class="text-right align-middle">0%</td>
	      <td class="text-center align-middle">
	        <button type="button" class="btn btn-primary btn-sm">매수</button>
	      </td>
	      <td class="text-right align-middle">
	        <input class="form-control" type="text"  maxlength='3' style="text-align:center;">
	      </td>
	      <td class="text-center align-middle">
	        <button type="button" class="btn btn-danger btn-sm">매도</button>
	      </td>
	      <td class="text-right align-middle">
	      	<input class="form-control" type="text"  maxlength='2' style="text-align:center;">
	      </td>
	      <td class="text-right align-middle">13</td>
	    </tr>
	  </c:forEach>
	</tbody>
  </table>
</div>