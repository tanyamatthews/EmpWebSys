DROP DATABASE EmployeeSystems;
CREATE DATABASE EmployeeSystems;
USE EmployeeSystems;

CREATE TABLE employee (  
  employee_id int(11) PRIMARY KEY AUTO_INCREMENT, 
  DateOfBirth date, 
  F_name varchar(30), 
  L_name varchar(30), 
  Title varchar(20), 
  Picture blob, 
  Salary decimal(11,2) 
);
CREATE TABLE employee_sales (  
  employee_id int(11), 
  commission_rate decimal(5,2), 
  total_annual_revenue decimal(10,2), 
  FOREIGN KEY (employee_id) 
  REFERENCES employee(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE employee_billable ( 
  employee_id int(11), 
  day_rate decimal(8,2), 
  CV blob,
  FOREIGN KEY (employee_id) 
  REFERENCES employee(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE project ( 
  project_id int(11) PRIMARY KEY AUTO_INCREMENT, 
  name varchar(30), 
  start_date datetime, 
  end_date datetime 
);
CREATE TABLE project_staff ( 
  employee_id int(11), 
  project_id int(11),
  start_date datetime, 
  end_date datetime,
  FOREIGN KEY (employee_id) 
  REFERENCES employee_billable(employee_id) ON DELETE CASCADE ON UPDATE CASCADE, 
  FOREIGN KEY (project_id) 
  REFERENCES project(project_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE theProcs (
  procName varchar(30),
  procSynt varchar(100),
  procDesc varchar(100)
);
-- -----------------------------------------------------
-- Table `EmployeeSystems`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EmployeeSystems`.`users` ;

CREATE TABLE IF NOT EXISTS `EmployeeSystems`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `fullName` VARCHAR(45) NULL COMMENT '',
  `userName` VARCHAR(45) NULL COMMENT '',
  `password` VARCHAR(45) NULL COMMENT '',
  `lastLogin` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  COMMENT '',
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC)  COMMENT '')
ENGINE = InnoDB;
