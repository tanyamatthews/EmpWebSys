<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
</head>
<body>

<h1>View Projects without Employees</h1>

<form action="projectsNoEmployees" class="" method="POST">
	<fieldset>
		<legend class="">View Projects without Employees</legend>
		<input type="submit" name="projNoEmpsSubmit" value="View Projects" class=""/>
	</fieldset>
</form>

<h1>View Employees without Projects</h1>

<form action="employeesNoProjects" class="" method="POST">
	<fieldset>
		<legend class="">View Employees without Projects</legend>
		<input type="submit" name="empsNoProjSubmit" value="View Employees" class=""/>
	</fieldset>
</form>

</body>
</html>