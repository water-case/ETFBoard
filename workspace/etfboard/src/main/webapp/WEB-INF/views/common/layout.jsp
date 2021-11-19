<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
	    
	<!-- tap image -->
	    <link rel="icon" type="image/jpg" href="${contextPath}/resources/icon/money_icon.jpg">
	
	<!-- title -->
		<title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<hr class="featurette-divider">
		<main>
			<tiles:insertAttribute name="body" />
		</main>
		<hr class="featurette-divider">
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</body>
</html>