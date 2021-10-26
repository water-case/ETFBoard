<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="container">
  <div class="py-3 text-center">
    <h2>글쓰기</h2>
  </div>

  <div class="text-center">	
    <form class="needs-validation" method="post" action="${contextPath}/board/write.do">
      <div class="row">
        <div class="col-md-4 mb-3"></div>
        <div class="col-md-5 mb-3">
          <input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요" value="" required>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 mb-3"></div>
        <div class="col-md-5 mb-3">
          <textarea class="form-control" name="text" placeholder="내용을 입력해 주세요" style="margin-top: 0px; margin-bottom: 0px; height: 118px;" required></textarea>
        </div>
      </div>
      <input type="hidden" name="name" value="${member.name}"/>
      <hr class="mb-4">
      <button class="btn btn-dark btn-lg " type="submit">글쓰기</button>
    </form>
  </div>
</div>