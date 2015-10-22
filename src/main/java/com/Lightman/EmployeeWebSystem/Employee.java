package com.Lightman.EmployeeWebSystem;

import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Employee {
	//All the properties for an Employee
	private int employeeId;
	private Date dateOfBirth;
	private String fName;
	private String sName;
	private String title;
	private Blob picture;
	private double salary;


	public Employee(){}

	//Constructor for normal employee
	public Employee(Date newDateOfBirth, String newFName, String newSName, String newTitle, Blob newPicture, double newSalary) {
		setDateOfBirth(newDateOfBirth);
		setFName(newFName);
		setSName(newSName);
		setTitle(newTitle);
		setPicture(newPicture);
		setSalary(newSalary);

	}
	//Constructor for normal Employee's with id passed in as well.
	public Employee(int id, Date newDateOfBirth, String newFName, String newSName, String newTitle, Blob newPicture,
			double newSalary, String addDepartment) {
		setEmployeeId(id);
		setDateOfBirth(newDateOfBirth);
		setFName(newFName);
		setSName(newSName);
		setTitle(newTitle);
		setPicture(newPicture);
		setSalary(newSalary);
	}

	//Default constructor
	public void viewEmployees(){

	}

	//Updates the Employee
	public static Employee updateEmployee(){
		Scanner addEmployeeScanner = new Scanner(System.in);
		System.out.println("Please enter the employee's id:");
		int id = addEmployeeScanner.nextInt();
		addEmployeeScanner.nextLine();
		System.out.println("Please enter the employee's forname:");
		String addForname = addEmployeeScanner.nextLine();
		System.out.println("Please enter the employee's surname:");
		String addSurname = addEmployeeScanner.nextLine();
		System.out.println("Please enter the employee's date of birth in format YYYY-MM-DD:");
		String addDateOfBirthString = addEmployeeScanner.nextLine();
		Date addDateOfBirth = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		try {
			addDateOfBirth = formatter.parse(addDateOfBirthString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("Please enter the employee's title");
		String addTitle = addEmployeeScanner.nextLine();
		System.out.println("Please enter the employee's salary:");
		int addSalary= addEmployeeScanner.nextInt();
		addEmployeeScanner.nextLine();
		System.out.println("Please enter the employee's department:");
		String addDepartment = addEmployeeScanner.nextLine();
		Employee newEmployee = new Employee(id,addDateOfBirth,addForname, addSurname,addTitle,null ,addSalary, addDepartment );
		return newEmployee;

	}

	public void removeEmployee(){

	}



	//Getters and Setters
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getFName() {
		return fName;
	}
	public void setFName(String fName) {
		this.fName = fName;
	}
	public String getSName() {
		return sName;
	}
	public void setSName(String sName) {
		this.sName = sName;
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
				employeeId, title, fName, sName, dateOfBirth, salary);
		return result;
	}
}
