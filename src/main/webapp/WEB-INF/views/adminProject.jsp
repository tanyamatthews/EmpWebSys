<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Project Menu</title>

<link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>

<h1>Add Project</h1>

<form action="addProject" class="medium" method="POST">
	<fieldset>
		<legend class="sr-only">Add Project Form</legend>
		<div class="form__group">
			<label for="name">Project Name</label>
			<input id="name" type="text" name="name">
		</div>
		<div class="form__group">
			<label for="startDate">Start Date</label>
			<input id="startDate" type="date" name="startDate">
		</div>
		<div class="form__group">
			<label for="endDate">End Date</label>
			<input id="endDate" type="date" name="endDate">
		</div>
		<input type="submit" name="projectAddSubmit" value="Add Project" class="btn"/>
	</fieldset>
</form>

<form action="updateProject" class="medium" method="POST">
	<fieldset>
		<legend class="sr-only">Update Project Form</legend>
		<div class="form__group">
			<label for="projectId">Project Id</label>
			<input id="projectId" type="number" name="projectId">
		</div> 
		<div class="form__group">
			<label for="name">Project Name</label>
			<input id="name" type="text" name="name">
		</div>
		<div class="form__group">
			<label for="startDate">Start Date</label>
			<input id="startDate" type="date" name="startDate">
		</div>
		<div class="form__group">
			<label for="endDate">End Date</label>
			<input id="endDate" type="date" name="endDate">
		</div>
		<input type="submit" name="projectUpdateSubmit" value="Update Project" class="btn"/>
	</fieldset>
</form>

<form action="deleteProject" class="medium" method="POST">
	<fieldset>
		<legend class="sr-only">Delete Project Form</legend>
		<div class="form__group">
			<label for="projectId">Project ID</label>
			<input id="projectId" type="number" name="projectId">
		</div>
		<input type="submit" name="deleteSubmit" value="Delete Project" class="btn"/>
	</fieldset>
</form>

<h1>Show Projects</h1>
<form action="allProjects" class="medium" method="GET">
	<fieldset>
		<div class="form__group">
		<input type="submit" value="Show Projects" class="btn"/>
	</fieldset>	
</form>
</div>


</body>
</html>