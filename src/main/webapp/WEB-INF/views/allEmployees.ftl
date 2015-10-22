<h1>All Empployees</h1>
<table border="1">
<tr><th>Title</th><th>Full Name</th><th>Salary</th></tr>
<#list employees as employee>
<tr>
<td>${employee.title}</td><td>${employee.firstName} ${employee.surName}</td><td>${employee.salary}</td>
</tr>
</#list>
</table>