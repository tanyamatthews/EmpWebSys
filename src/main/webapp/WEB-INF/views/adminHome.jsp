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
<body class="modal-body">

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
  <p class="alert success">${msg}<p>
  <h1>Add Employee</h1>

<form action="addEmployee" class="medium" method="POST">

	<fieldset>
		<legend class="sr-only">Add Employee Form</legend>
		<div class="form__group">
			<label for="title">Title</label>
			<input id="title" type="text" name="title">
		</div>
		<div class="form__group">
			<label for="firstName">First Name</label>
			<input id="firstName" type="text" name="firstName">
		</div>
		<div class="form__group">
			<label for="surName">Surname</label>
			<input id="surName" type="text" name="surName">
		</div>

		<div class="form__group">
			<label for="dob">Date of Birth</label>
			<input id="dob" type="date" name="dob">
		</div>
		
		<div class="form__group">
			<label for="salary">Salary</label>
			<input id="salary" type="number" name="salary">
		</div>
		<input type="submit" name="addSubmit" value="Add Employee" class="btn"/>
	</fieldset>
</form>

  </section>
    
  <section id="content2">
  
  <h1>Delete Employee</h1>

<form action="deleteEmployee" class="medium" method="POST">
	<fieldset>
		<legend class="sr-only">Add Employee Form</legend>
		<div class="form__group">
			<label for="employeeId">Employee ID</label>
			<input id="employeeId" type="number" name="employeeId">
		</div>
		<input type="submit" name="deleteSubmit" value="Delete Employee" class="btn"/>
	</fieldset>
</form>
  
  </section>
    
  <section id="content3">
  
  <h1>Update Employee</h1>

<form action="updateEmployee" class="medium" method="POST">
	<fieldset>
		<legend class="sr-only">Update Employee Form</legend>
		<div class="form__group">
			<label for="employeeId">Employee ID</label>
			<input id="employeeId" type="number" name="employeeId">
		</div>
		<div class="form__group">
			<label for="title">Title</label>
			<input id="title" type="text" name="title">
		</div>
		<div class="form__group">
			<label for="firstName">First Name</label>
			<input id="firstName" type="text" name="firstName">
		</div>
		<div class="form__group">
			<label for="lastName">Password</label>
			<input id="lastName" type="text" name="lastName">
		</div>
		<div class="form__group">
			<label for="dob">Date of Birth</label>
			<input id="dob" type="date" name="dob">
		</div>
		
		<div class="form__group">
			<label for="salary">Salary</label>
			<input id="salary" type="number" name="salary">
		</div>
		<input type="submit" name="addSubmit" value="Add Employee" class="btn"/>
	</fieldset>
</form>

  </section>
    
  <section id="content4">
  
  <h1>Show Employees</h1>

<form action="fetchEmployees" class="medium" method="GET">
	<input type="submit" name="fetchEmployeesSubmit" value="Show Employees" class="btn"/>
</form>
 
  </section>
  
  <section id="content5">
  
  <h1>Show Projects</h1>

<form action="fetchProjects" class="medium" method="GET">
	<input type="submit" name="fetchProjectsSubmit" value="Show Projects" class="btn"/>
</form>
  
  </section>
  
  <section id="content6">
  
  <h1>Assign Employee to Project</h1>

<form action="assignEmployee" class="medium" method="POST">
	<fieldset>
	<legend class="sr-only">Assign Employee Form</legend>
	<div class="">
		<label for="employeeId">Employee ID</label>
		<input id="employeeId" type="number" name="employeeId">
	</div>
	<div class="">
		<label for="projectId">Project Id</label>
		<input id="projectId" type="number" name="projectId">
	</div>
	<input type="submit" name="assignEmployeeSubmit" value="Assign Employee" class="btn"/>
	</fieldset>
</form>
  
  </section>
    
</main>

















</body>
</html>