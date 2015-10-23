<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>All Employees</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        table {
            width: 100%
        }
        .deleterow {
            cursor: pointer
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>Edit Employee</h1>
        
        <form action="editEmployee" class="medium" method="POST">

	<fieldset>
		<legend class="sr-only">Add Employee Form</legend>
		<div class="form__group">
			<label for="title">Title</label>
			<input id="title" type="text" name="title" value="${employee.title}">
		</div>
		<div class="form__group">
			<label for="firstName">First Name</label>
			<input id="firstName" type="text" name="firstName" value="${employee.firstName}">
		</div>
		<div class="form__group">
			<label for="surName">Surname</label>
			<input id="surName" type="text" name="surName" value="${employee.surName}">
		</div>

		<div class="form__group">
			<label for="dob">Date of Birth</label>
			<input id="dob" type="date" name="dob" value="${employee.dob?string('yyyy-MM-dd')}">
		</div>
		
		<div class="form__group">
			<label for="salary">Salary</label>
			<input id="salary" type="number" name="salary" value="${employee.salary?c}">
		</div>
		<input type="submit" name="addSubmit" value="Edit Employee" class="btn"/>
	</fieldset>
</form>


    </div>
    <!-- /.container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>

</html>