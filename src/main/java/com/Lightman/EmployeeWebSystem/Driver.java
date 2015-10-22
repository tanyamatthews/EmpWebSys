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
	 * Check if the password and user matches in the database
	 */
	public String checkUsernameAndPassword(Connection connection, String userName, String password){
		
		String msg = "Access Denied, Please try again";
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
			 String fullName = result.getString(1);
			 Timestamp date = result.getTimestamp(2);
			 
			 msg = fullName+" Successfully Logged in!";
			 
			 if (date != null){ 
				 updateLastLoginTimeStamp(connection, userName, password);
			 }
			} else{
				msg = "Access Denied, Please try again";
			}
		} catch (SQLException e) {
			msg = "Access Denied, Please try again";
			e.printStackTrace();
		}
		return msg;
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
