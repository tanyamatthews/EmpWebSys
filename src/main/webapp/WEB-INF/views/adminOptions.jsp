<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin options</title>
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body class="modal-body">
<div class="md-container options">

	<div class="centerText">

		<h1>Admin options</h1>
		<ul class="optionsMenu">
			<a href=<c:url value="/dashboard/" />><li>Manage employee's</li></a>
			<a href=<c:url value="/projectMenu/" />><li>Manage projects</li></a>
		</ul>
	
	</div>


</div>
</body>
</html>