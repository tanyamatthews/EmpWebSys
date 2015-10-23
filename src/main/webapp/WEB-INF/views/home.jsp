<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body class="modal-body">

<div class="sm-container login">
    
    <div class="centerText">
    
    <object class="svg">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve"><g><path d="M27.271,23.54l-3.893-1.851l-6.459,4.344c-0.229,0.155-0.501,0.233-0.776,0.233c-0.26,0-0.521-0.071-0.745-0.213   l-6.841-4.335L4.73,23.54c-0.408,0.186-0.67,0.593-0.67,1.04v3.817c0,0.631,0.513,1.142,1.143,1.142h21.596   c0.629,0,1.141-0.511,1.141-1.142V24.58C27.939,24.133,27.68,23.726,27.271,23.54z"></path><path d="M20.727,20.482l-0.781-2.548c0.436-0.34,1.148-1.419,1.562-2.092c0.492-0.802,0.909-1.926,1.033-2.822l0.227-2.44   c0.002-0.021,0.002-1.043,0.002-1.064c0-1.778-0.715-3.563-1.961-4.897C19.508,3.227,17.801,2.461,16,2.461   c-1.799,0-3.507,0.766-4.809,2.157c-1.245,1.334-1.96,3.119-1.96,4.897c0,0.021,0,1.043,0.002,1.064l0.228,2.44   c0.123,0.896,0.539,2.021,1.033,2.822c0.412,0.673,1.125,1.752,1.562,2.092l-0.78,2.548l4.847,3.145L20.727,20.482z"></path></g></svg>
    
    </object>
        
    </div>


	<form action="dashboard" method="POST">

		<fieldset>
			<legend class="sr-only">Login form</legend>
			<div class="clearfix">
				<label for="username" class="sr-only">Username</label>
				<input id="username" type="text" name="username" placeholder="Username"/>
			</div>
			<div class="clearfix">
				<label for="password" class="sr-only">Password</label>
				<input id="password" type="password" name="password" placeholder="password"/>
			</div>
            <div class="clearfix">
			     <input type="submit" name="submit" value="Login" class="btn" />
            </div>
		</fieldset>
	</form>

</div>


</body>
</html>
