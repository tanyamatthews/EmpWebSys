package com.Lightman.Data;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;


import com.Lightman.EmployeeWebSystem.Employee;

public interface IEmployeeSystemMapper {
	
	 @Select("SELECT * FROM employee")
	 @Results({
	  @Result(id=true, property="employeeId", column="employee_id"),
	  @Result(property="dob", column="DateOfBirth"),
	  @Result(property="firstName", column="F_name"),
	  @Result(property="surName", column="L_name"),
	  @Result(property="title", column="Title"),
	  @Result(property="salary", column="Salary")
	 })
	 public List<Employee> getAllEmployees();

}
