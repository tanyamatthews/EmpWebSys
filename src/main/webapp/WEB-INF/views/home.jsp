<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
	
</head>
<body>

<div class="container login">

	<div class="centerText">
	
		<h1>Login</h1>
	
	</div>

<<<<<<< HEAD
	<form action="login-process" method="POST" class="modal-form">
=======
	<form action="dashboard" method="POST">
>>>>>>> f38c50fa19bf914be1e84239a3daa38a17b08b07
		<fieldset>
			<legend class="sr-only">Login form</legend>
			<div class="form__group clearfix">
				<label for="username">Username</label>
				<input id="username" type="text" name="username">
			</div>
			<div class="form__group clearfix">
				<label for="password">Password</label>
				<input id="password" type="password" name="password">
			</div>
			<input type="submit" name="submit" value="Login" class="btn"/>
		</fieldset>
	</form>

</div>


</body>
</html>
