USE EmployeeSystems;
INSERT INTO project VALUES('','Project1','2015-01-01','2017-12-10');
INSERT INTO project VALUES('','Project2','2016-01-01','2016-12-10');
INSERT INTO project VALUES('','Project3','2017-01-01','2017-12-10');
INSERT INTO project VALUES('','Project4','2017-01-01','2017-12-10');
INSERT INTO project VALUES('','Project5','2017-01-01','2017-12-10');
INSERT INTO project VALUES('','Project6','2017-01-01','2017-12-10');
INSERT INTO employee VALUES('','1995-04-14','Employee','One','Mr','admin','15000');
INSERT INTO employee VALUES('','1995-05-14','Employee','Two','Mrs','admin','15000');
INSERT INTO employee VALUES('','1995-06-14','Employee','Three','Master','finance','15000');
INSERT INTO employee VALUES('','1995-07-14','Employee','Four','Miss','finance','15000');
INSERT INTO employee VALUES('','1995-08-14','Employee','Five','Mr','career','15000');
INSERT INTO employee VALUES('','1995-09-14','Employee','Six','Mr','career','15000');
INSERT INTO employee_billable VALUES('1','10','');
INSERT INTO employee_billable VALUES('2','5','');
INSERT INTO employee_billable VALUES('3','2.5','');
INSERT INTO employee_billable VALUES('4','100','');
INSERT INTO employee_billable VALUES('5','25','');
INSERT INTO employee_billable VALUES('6','15','');
INSERT INTO employee VALUES('','1995-09-14','Employee','Seven','Mr','sales','15000');
INSERT INTO employee VALUES('','1995-09-14','Employee','Eight','Mr','sales','15000');
INSERT INTO employee VALUES('','1995-09-14','Employee','Nine','Mr','sales','15000');
INSERT INTO employee VALUES('','1995-09-14','Employee','Ten','Mr','sales','15000');
INSERT INTO employee_sales VALUES('7','0.1','70000');
INSERT INTO employee_sales VALUES('8','0.2','80000');
INSERT INTO employee_sales VALUES('9','0.2','90000');
INSERT INTO employee_sales VALUES('10','0.05','100000');
INSERT INTO project_staff VALUES('1','1','2015-01-02','2015-12-09');
INSERT INTO project_staff VALUES('2','1','2016-04-02','2015-06-09');
INSERT INTO project_staff VALUES('3','2','2016-04-02','2016-12-09');
INSERT INTO project_staff VALUES('4','2','2016-11-02','2016-11-09');
INSERT INTO project_staff VALUES('5','3','2017-01-02','2017-03-09');
INSERT INTO project_staff VALUES('6','3','2017-01-02','2017-12-09');
INSERT INTO theProcs values('help','No Syntax','Lists help for all procedures');
INSERT INTO theProcs values('addEmployee','DOB(YYYY-MM-DD), FirstName, LastName, Title, Picture, Salary','Adds employee to the employee database');
INSERT INTO theProcs values('addSalesEmployee','EmployeeId, Comission Rate, Total Annual Revenue','Adds employee to the sales employee database');
INSERT INTO theProcs values('addBillableEmployee','EmployeeId, Daily Rate, CV','Adds employee to billable employees database');
INSERT INTO theProcs values('addProject','Project Name, Start Date(YYYY-MM-DD), End Date(YYYY-MM-DD)','Adds new project to projects database');
INSERT INTO theProcs values('assignToProject','Employee ID, Project ID, Start Date(YYYY-MM-DD), End Date(YYYY-MM-DD)','Assign an employee to a project');
INSERT INTO theProcs values('showEmployees','No Syntax','Lists all employees');
INSERT INTO theProcs values('showProjects','No Syntax','Lists all projects');
INSERT INTO theProcs values('showSalesEmployees','No Syntax','Lists all sales employees');
INSERT INTO theProcs values('showBillableEmployees','No Syntax','Lists all billable employees');
INSERT INTO theProcs values('searchReport','Employee ID','Returns salary for individual');
INSERT INTO theProcs values('genReport','No Syntax','Generates a payroll');
INSERT INTO theProcs values('showProjectEmployees','Project ID','Lists employees that have worked on a certain project');
INSERT INTO theProcs values('freeEmployees','Month(MM), Year(YYYY)','Shows employees that aren''t on a project on a given month');
INSERT INTO theProcs values('calcEmployees','Month(MM), Year(YYYY)','Calculates the total income for a given month');
INSERT INTO users (fullName, userName, password) VALUES ('Admin Account', 'admin', 'password1');
INSERT INTO users (fullName, userName, password) VALUES ('Finance Account', 'finance', 'password2');
INSERT INTO users (fullName, userName, password) VALUES ('Chris Reid', 'chrisr', 'password3');

DELIMITER // 
CREATE PROCEDURE help (
	)
BEGIN
SELECT procName AS 'Procedure Name', 
procSynt AS 'Procedure Syntax', 
procDesc AS 'Procedure Description' FROM theProcs;
end //
DELIMITER ;
DELIMITER // 

CREATE PROCEDURE addEmployee (
	DOB datetime, f_name varchar(30), l_name varchar(30), 
	title varchar(20), picture blob, salary decimal(11,2)
	)
BEGIN
INSERT INTO employee(DateOfBirth, F_name, L_name, Title, Picture, Salary)
VALUES (dob, f_name, l_name, title, picture, salary);
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE addSalesEmployee (
	ID int(11), CR decimal(5,2), 
	TR decimal(10,2)
	)
BEGIN
INSERT INTO employee_sales(employee_id, commission_rate, total_annual_revenue)
VALUES (ID, CR, TR);
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE addBillableEmployee (
	ID int(11), DR decimal(8,2), 
	CVO blob 
	)
BEGIN
INSERT INTO employee_billable(employee_id, day_rate, CV)
VALUES (ID, DR, CVO);
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE updateEmployee (id int(11),
	DOB datetime, f_name varchar(30), l_name varchar(30), 
	title varchar(20), picture blob, salary decimal(11,2)
	)
BEGIN
	UPDATE employee
	SET DateOfBirth = dob, F_name = f_name, L_name = l_name, 
		Title = title, Picture = picture, Salary = salary
	WHERE employee_id = id;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE updateBillableEmployee (id int(11),
	DOB datetime, f_name varchar(30), l_name varchar(30), 
	title varchar(20), picture blob, salary decimal(11,2),
	DR decimal(8,2), CVO blob
	)
BEGIN
	UPDATE employee
	SET DateOfBirth = dob, F_name = f_name, L_name = l_name, 
		Title = title, Picture = picture, Salary = salary
	WHERE employee_id = id;
	UPDATE employee_billable
	SET day_rate = DR, CV = CVO
	WHERE employee_id = id;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE updateSalesEmployee (id int(11),
	DOB datetime, f_name varchar(30), l_name varchar(30), 
	title varchar(20), picture blob, salary decimal(11,2),
	CR decimal(5,2), TR decimal(10,2)
	)
BEGIN
	UPDATE employee
	SET DateOfBirth = dob, F_name = f_name, L_name = l_name, 
		Title = title, Picture = picture, Salary = salary
	WHERE employee_id = id;
	UPDATE employee_sales
	SET commission_rate = CR, total_annual_revenue = TR
	WHERE employee_id = id;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE deleteEmployee (id int(11))
BEGIN
	DELETE FROM employee WHERE employee_id = id;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE addProject ( 
	Pname varchar(30), 
	Sdate datetime, 
	Edate datetime 
	)
BEGIN
INSERT INTO project(name, start_date, end_date )
VALUES (Pname, Sdate, Edate);
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE removeProject(
	PID int(11)
)
BEGIN
DELETE FROM project
WHERE project_id=PID;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE updateProject(
	PID int(11),
	PNAME varchar(30),
	SDATE datetime,
	EDATE datetime
)
BEGIN
	UPDATE project
	SET name = PNAME, start_date = SDATE, end_date = EDATE
	WHERE project_id = PID;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE assignToProject (
	EID int(11),
	PID int(11),
	Sdate datetime, 
	Edate datetime 
	)
BEGIN
SET @tempStart := (SELECT start_date FROM project WHERE project_id = PID);
SET @tempEnd := (SELECT end_date FROM project WHERE project_id = PID);

IF ((Sdate between @tempStart and @tempEnd) AND 
(Edate between @tempStart and @tempEnd)) THEN
INSERT INTO project_staff(employee_id, project_id, start_date, 
	end_date)
VALUES (EID, PID, Sdate, Edate);
ELSE SELECT 'Error, these are not valid dates for this project';
END IF;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showEmployees ()
BEGIN
SELECT employee_id, CONCAT(Title, '.',F_name, ' ',L_name) AS 'Employee Name' FROM employee;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showProjects ()
BEGIN
SELECT project_id, name AS 'Project Name' FROM project;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showSalesEmployees ()
BEGIN
SELECT employee.employee_id, CONCAT(Title, '.',F_name, ' ',L_name) AS 'Sales Employee Name', 
CONCAT(ROUND(commission_rate,2),'%') AS 'Commission Rate' 
FROM employee JOIN employee_sales ON employee.employee_id = employee_sales.employee_id ;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showBillableEmployees ()
BEGIN
SELECT employee.employee_id, CONCAT(Title, '.',F_name, ' ',L_name) AS 'Billable Employee Name', 
CONCAT(ROUND(day_rate,2),'%') AS 'Day Rate' 
FROM employee JOIN employee_billable ON employee.employee_id = employee_billable.employee_id ;
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE searchReport (ID int(11)) BEGIN 
SELECT @ID := employee_sales.employee_id 
FROM employee JOIN employee_sales ON employee.employee_id = employee_sales.employee_id 
WHERE employee_sales.employee_id = ID;
if(@ID = ID) 
THEN SELECT (employee.Salary+((total_annual_revenue/100)*commission_rate)) FROM employee_sales JOIN employee ON employee.employee_id = employee_sales.employee_id 
WHERE employee_sales.employee_id = ID;
ELSE SELECT Salary FROM employee WHERE employee_id = ID; 
END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE genReport () 
BEGIN 
SELECT @temp := employee.employee_id AS 'Employee Id', 
concat(F_name, ' ', L_name) AS 'Employee Name', 
if(@temp IN(SELECT employee_id FROM employee_sales), 
(SELECT CONCAT('£',ROUND(Salary+((total_annual_revenue/100)*commission_rate)))
from employee JOIN employee_sales ON employee.employee_id = employee_sales.employee_id ), 
CONCAT('£',ROUND(employee.Salary))) AS 'Total Amount Due'
FROM employee; 
END //
DELIMITER ;

DELIMITER //
 CREATE PROCEDURE showProjectEmployees (ID int(11)) 
BEGIN 
SELECT CONCAT(employee.F_name, ' ', employee.L_name) 
FROM employee 
JOIN project_staff ON employee.employee_id = project_staff.employee_id 
JOIN project on project.project_id = project_staff.project_id 
WHERE project.project_id = ID; 
END//
DELIMITER ;

DELIMITER //
 CREATE PROCEDURE freeEmployees (month int(2), year int(4)) 
BEGIN 
declare start_Date datetime;
declare end_Date datetime;
SET start_Date := Concat(year,'-',month,'-01');
SET end_Date := Concat(year,'-',month,'-',(SELECT DAY(LAST_DAY(start_Date))));
SELECT employee.F_name, employee.employee_id FROM employee WHERE employee.employee_id NOT IN 
(SELECT project_staff.employee_id FROM project_staff 
WHERE 
(start_Date between project_staff.start_date and project_staff.end_date) 
OR 
(end_Date between project_staff.start_date and project_staff.end_date));
END //
DELIMITER ;

DELIMITER //
 CREATE PROCEDURE calcEmployees (month int(2), year int(4)) 
BEGIN 
declare start_Date datetime;
declare end_Date datetime;
declare billable_days int;
declare month_days int;
SET start_Date := Concat(year,'-',month,'-01');
SET month_days := (SELECT DAY(LAST_DAY(start_Date)));
SET end_Date := Concat(year,'-',month,'-',month_days);
SELECT  SUM((IFNULL(employee_billable.day_rate,0)*IFNULL((CASE 
WHEN (project_staff.start_date BETWEEN start_Date AND end_Date) AND 
(project_staff.end_date BETWEEN start_Date AND end_Date)
THEN  DATEDIFF(project_staff.end_date,project_staff.start_date)
WHEN (project_staff.start_date BETWEEN start_Date AND end_Date) AND
(project_staff.end_date NOT BETWEEN start_Date AND end_Date) 
THEN  DATEDIFF(end_Date,project_staff.start_date)
WHEN (project_staff.end_date BETWEEN start_Date AND end_Date) AND
(project_staff.start_date NOT BETWEEN start_Date AND end_Date) 
THEN  DATEDIFF(project_staff.end_date,start_Date)
WHEN  (project_staff.end_date NOT BETWEEN start_Date AND end_Date) AND
(project_staff.start_date NOT BETWEEN start_Date AND end_Date) 
THEN  month_days
else '0'
END),0))) AS 'Total Monthly Income'
FROM  employee_billable 
JOIN project_staff ON employee_billable.employee_id = project_staff.employee_id 
WHERE employee_billable.employee_id IN 
(SELECT project_staff.employee_id FROM project_staff 
WHERE 
(start_Date between project_staff.start_date and project_staff.end_date) 
OR 
(end_Date between project_staff.start_date and project_staff.end_date));
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showEmployeesWithoutProjects()
BEGIN
	SELECT employee.employee_id, employee.DateOfBirth,
		employee.F_name, employee.L_name, employee.Title, employee.Picture, employee.Salary
	FROM employee LEFT JOIN project_staff
	ON employee.employee_id = project_staff.employee_id
	WHERE project_staff.project_id IS NULL;
end //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE showProjectsWithoutEmployees()
BEGIN
	SELECT project.project_id, project.name, project.start_date, project.end_date
	FROM project LEFT JOIN project_staff
	ON project.project_id = project_staff.project_id
	WHERE project_staff.project_id IS NULL;
end //
DELIMITER ;
