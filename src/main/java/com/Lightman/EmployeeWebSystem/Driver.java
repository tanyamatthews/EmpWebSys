package com.Lightman.EmployeeWebSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.sql.*;

public class Driver {
	
	/*
	 * Get All users from database
	 */
	public void printAllUsers(Connection connection){

		try {
			Statement create = connection.createStatement();
			ResultSet result = create.executeQuery("Select * from users");
			
			while(result.next()){
				System.out.println(result.getString(2));
			}
		} catch (SQLException e) {
			System.out.println("Unable to get all user");
			e.printStackTrace();
		}
		
	}
	/*
	 * Insert User into Database
	 */
	public void insertUser(User user, Connection connection){
		
		try {
			//SQL statement to add user
			PreparedStatement addUser = connection.prepareStatement(
					"INSERT INTO users (fullName, userName, password) Values(?,?,?)");
			addUser.setString(1,user.getFullName());
			addUser.setString(2,user.getUserName());
			addUser.setString(3, user.getPassword());
			
			//Executing prepared statement
			addUser.executeUpdate();
			System.out.println("User "+user.getFullName()+" has been added Successfully");
			
		} catch (SQLException e) {
			System.out.println("Unable to create user ");
	
		}
		
	}
	
	/**
	 * Save Employee in Database
	 * 
	 * @param employee
	 */
	public void addEmployeeINDatabase(Employee employee, Connection connection) {

		try {
			// SQL statement to add user
			PreparedStatement addEmployee = connection.prepareStatement("call addEmployee(?,?,?,?,?,?)");

			addEmployee.setDate(1, getSQLDate(employee.getDob()));
			addEmployee.setString(2, employee.getFirstName());
			addEmployee.setString(3, employee.getSurName());
			addEmployee.setString(4, employee.getTitle());
			addEmployee.setBlob(5, employee.getPicture());
			addEmployee.setDouble(6, employee.getSalary());

			// Executing prepared statement
			addEmployee.executeUpdate();
			System.out.println("Employee has been added Successfully");

		} catch (SQLException e) {
			System.out.println("Unable to create Employee ");
			e.printStackTrace();
		}
	}
	
	/**
	 * Remove Employee from the database based on id
	 * 
	 * @param id
	 */
	public void removeEmployeeFromDatabase(int id, Connection connection) {
	
		try {
			PreparedStatement removeEmployee = connection.prepareStatement("call deleteEmployee (?)");

			removeEmployee.setInt(1, id);
			removeEmployee.executeUpdate();
			System.out.println("Employee " + id + " has been deleted.");

		} catch (SQLException e) {
			System.out.println("Unable to remove employee.");
			e.printStackTrace();
		}

	}
	
	/**
	 * Takes a normal date and returns a SQL date
	 * 
	 * @param date
	 * @return
	 */
	private Date getSQLDate(java.util.Date date) {
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return sqlDate;
	}

	/**
	 * Check if the password and user matches in the database
	 */
	public Boolean checkUsernameAndPassword(Connection connection, String userName, String password){
		
		Boolean loginSuccessfull = false;
		
		//Sql statement to validate user credentials
		String query = "SELECT fullName, lastLogin FROM users WHERE userName=? AND password=?";
		PreparedStatement checkUser;
		
		try {
			checkUser = connection.prepareStatement(query);
			checkUser.setString(1, userName);
			checkUser.setString(2, password);
			
			//Executing prepared statement
			ResultSet result = checkUser.executeQuery();
			
			if (result.next()){
			 Timestamp date = result.getTimestamp(2);
			 
			 loginSuccessfull = true;
			 
			 if (date != null){ 
				 updateLastLoginTimeStamp(connection, userName, password);
			 }
			} else{
				loginSuccessfull = false;
			}
		} catch (SQLException e) {
			loginSuccessfull = false;
			e.printStackTrace();
		}
		return loginSuccessfull;
	}
	
	/*
	 * Update Time stamp on Login
	 */
	private void updateLastLoginTimeStamp(Connection connection, String userName, String password) {
		
		try {
			//SQL statement to update timeStamp
			PreparedStatement addUser = connection.prepareStatement(
					"Update users SET lastLogin=? WHERE userName=? AND password=?");
			java.util.Date date = new java.util.Date();
			addUser.setTimestamp(1, new java.sql.Timestamp(date.getTime()));
			addUser.setString(2, userName);
			addUser.setString(3, password);
			
			//Executing prepared statement
			addUser.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("Time Stamp could not be updated");
			e.printStackTrace();
			System.exit(1);
		}
	}
}
