package com.Lightman.EmployeeWebSystem;

public class User {
	
	private String fullName;
	private String userName;
	private String password;
	
	public User(String fullName, String userName, String password) {
		setFullName(fullName);
		setUserName(userName);
		setPassword(password);	
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}
