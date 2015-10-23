package com.Lightman.EmployeeWebSystem;

import java.sql.Blob;
import java.util.Date;

public class Employee {
	//All the properties for an Employee
	private int employeeId;
	private Date dob;
	private String firstName;
	private String surName;
	private String title;
	private Blob picture;
	private double salary;


	public Employee(){
		
	}

//	//Constructor for normal employee
//	public Employee(Date newDateOfBirth, String newFName, String newSName, String newTitle, Blob newPicture, double newSalary) {
//		setDateOfBirth(newDateOfBirth);
//		setFName(newFName);
//		setSName(newSName);
//		setTitle(newTitle);
//		setPicture(newPicture);
//		setSalary(newSalary);
//
//	}
//	//Constructor for normal Employee's with id passed in as well.
//	public Employee(int id, Date newDateOfBirth, String newFName, String newSName, String newTitle, Blob newPicture,
//			double newSalary, String addDepartment) {
//		setEmployeeId(id);
//		setDateOfBirth(newDateOfBirth);
//		setFName(newFName);
//		setSName(newSName);
//		setTitle(newTitle);
//		setPicture(newPicture);
//		setSalary(newSalary);
//	}

	//Getters and Setters
	

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}


	@Override
	public String toString() {
		String result = String.format(
				"%3d %8s %15s %15s %15s %10.2f", 
				employeeId, title, firstName, surName, dob, salary);
		return result;
	}

}
