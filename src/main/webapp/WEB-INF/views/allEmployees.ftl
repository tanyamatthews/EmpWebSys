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
    	table{width:100%}
		.deleterow{cursor:pointer}
    </style>
</head>

<body>

    <div class="container" id="container">

        <h1>All Employees</h1>
        <div class="table-responsive">
            <table class="table table-bordered">
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Salary</th>
                    <th>Remove</th>
                </tr>
                <#list employees as employee>
                    <tr>

                        <td>${employee.employeeId}</td>
                        </td>
                        <td>${employee.title} ${employee.firstName} ${employee.surName}</td>
                        <td>£${employee.salary}</td>
                        <td>
                            <button id="${employee.employeeId}" type="button" class="btn btn-danger" onclick="deleteEmployee(this.id);">Delete</button>
                            <button id="${employee.employeeId}" type="button" class="btn btn-danger" onclick="updateEmployee(this.id);">Update</button>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>

    </div>
    <!-- /.container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
        function deleteEmployee(passedID) {
            var id = passedID;
            
            $.ajax({
                type: "Get",
                url: "deleteEmployee",
                data: "id=" + id,
                success: function(response) {
                	location.reload();
                },
                error: function(e) {
					alert("Error deleting Employee");
					location.reload();
                }
            });
        }
        
        function updateEmployee(passedID) {
            var id = passedID;
            
            $.ajax({
                type: "POST",
                url: "updateEmployee",
                data: "id=" + id,
                success: function(response) {
                	$('#container').load(response);
                },
                error: function(e) {
					alert("Error updating Employee");
					$('#container').load(response);
                }
            });
        }
        
        
        
    </script>
</body>

</html>