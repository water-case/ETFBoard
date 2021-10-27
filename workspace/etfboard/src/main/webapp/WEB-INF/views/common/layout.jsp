<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <!-- bootstrap css -->
	    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
	    <link rel="stylesheet" href="${contextPath}/resources/my/my.css">
	    <link rel="icon" type="image/jpg" href="${contextPath}/resources/icon/money_icon.jpg">
		<title>
			<tiles:insertAttribute name="title" />
		</title>
		
		
	</head>
	<body>
		<div id="container">
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<hr class="featurette-divider">
			<div id="content">
				<tiles:insertAttribute name="body" />
			</div>
			<hr class="featurette-divider">
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</body>
</html>