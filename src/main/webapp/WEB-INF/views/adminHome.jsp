<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
<link href="<c:url value="/resources/main.css" />" rel="stylesheet">

</head>
<body>

<main>
  
  <input id="tab1" type="radio" name="tabs" class="sr-only" checked>
  <label for="tab1" class="tab-item">Add Employee</label>
    
  <input id="tab2" type="radio" name="tabs" class="sr-only">
  <label for="tab2" class="tab-item">Delete Employee</label>
    
  <input id="tab3" type="radio" name="tabs" class="sr-only">
  <label for="tab3" class="tab-item">Update Employee</label>
    
  <input id="tab4" type="radio" name="tabs" class="sr-only">
  <label for="tab4" class="tab-item">Show Employees</label>
  
  <input id="tab5" type="radio" name="tabs" class="sr-only">
  <label for="tab5" class="tab-item">Show Project</label>
  
  <input id="tab6" type="radio" name="tabs" class="sr-only">
  <label for="tab6" class="tab-item">Assign project to employee</label>
  
  
    
  <section id="content1">
  
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

  </section>
    
  <section id="content2">
  
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
  
  </section>
    
  <section id="content3">
  
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

  </section>
    
  <section id="content4">
  
  <h1>Show Employees</h1>

<form action="fetchEmployees" method="GET">
	<input type="submit" name="fetchEmployeesSubmit" value="Show Employees" class=""/>
</form>
 
  </section>
  
  <section id="content5">
  
  <h1>Show Projects</h1>

<form action="fetchProjects" method="GET">
	<input type="submit" name="fetchProjectsSubmit" value="Show Projects" class=""/>
</form>
  
  </section>
  
  <section id="content6">
  
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
  
  </section>
    
</main>

















</body>
</html>