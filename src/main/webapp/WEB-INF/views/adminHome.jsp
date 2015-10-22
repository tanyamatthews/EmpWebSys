<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
</head>
<body>

<h1>Add Employee</h1>

<form action="addEmployee" method="POST">
	<fieldset>
		<legend class="">Add Employee Form</legend>
		<div class="">
			<label for="title">Title</label>
			<input id="title" type="text" name="title">
		</div>
		<div class="">
			<label for="firstName">First Name</label>
			<input id="firstName" type="text" name="firstName">
		</div>
		<div class="">
			<label for="lastName">Password</label>
			<input id="lastName" type="text" name="lastName">
		</div>
		<div class="">
			<label for="dob">Date of Birth</label>
			<input id="dob" type="date" name="dob">
		</div>
		
		<div class="">
			<label for="salary">Salary</label>
			<input id="salary" type="number" name="salary">
		</div>
		<input type="submit" name="addSubmit" value="Add Employee" class=""/>
	</fieldset>
</form>

<h1>Delete Employee</h1>

<form action="deleteEmployee" method="POST">
	<fieldset>
		<legend class="">Add Employee Form</legend>
		<div class="">
			<label for="employeeId">Employee ID</label>
			<input id="employeeId" type="number" name="employeeId">
		</div>
		<input type="submit" name="deleteSubmit" value="Delete Employee" class=""/>
	</fieldset>
</form>

<h1>Update Employee</h1>

<form action="updateEmployee" method="POST">
	<fieldset>
		<legend class="">Update Employee Form</legend>
		<div class="">
			<label for="employeeId">Employee ID</label>
			<input id="employeeId" type="number" name="employeeId">
		</div>
		<div class="">
			<label for="title">Title</label>
			<input id="title" type="text" name="title">
		</div>
		<div class="">
			<label for="firstName">First Name</label>
			<input id="firstName" type="text" name="firstName">
		</div>
		<div class="">
			<label for="lastName">Password</label>
			<input id="lastName" type="text" name="lastName">
		</div>
		<div class="">
			<label for="dob">Date of Birth</label>
			<input id="dob" type="date" name="dob">
		</div>
		
		<div class="">
			<label for="salary">Salary</label>
			<input id="salary" type="number" name="salary">
		</div>
		<input type="submit" name="addSubmit" value="Add Employee" class=""/>
	</fieldset>
</form>

<h1>Show Employees</h1>

<form action="fetchEmployees" method="GET">
	<input type="submit" name="fetchEmployeesSubmit" value="Show Employees" class=""/>
</form>

<h1>Show Projects</h1>

<form action="fetchProjects" method="GET">
	<input type="submit" name="fetchProjectsSubmit" value="Show Projects" class=""/>
</form>

<h1>Assign Employee to Project</h1>

<form action="assignEmployee" method="POST">
	<fieldset>
	<legend class="">Assign Employee Form</legend>
	<div class="">
		<label for="employeeId">Employee ID</label>
		<input id="employeeId" type="number" name="employeeId">
	</div>
	<div class="">
		<label for="projectId">Project Id</label>
		<input id="projectId" type="number" name="projectId">
	</div>
	<input type="submit" name="assignEmployeeSubmit" value="Assign Employee" class=""/>
	</fieldset>
</form>

</body>
</html>