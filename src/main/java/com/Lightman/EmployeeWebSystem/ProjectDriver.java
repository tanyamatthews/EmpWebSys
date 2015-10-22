package com.Lightman.EmployeeWebSystem;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Lightman.EmployeeWebSystem.Project;

public class ProjectDriver{
	
	public ProjectDriver(){
		//empty constructor 
	}
		
	public String showProjects(){
		String query = "CALL showProjects();";
		return query;
	}
	
	private Date getSQLDate(java.util.Date date) {
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return sqlDate;
	}
	
	public void addProject(Project project, Connection c){
	
		String query = "CALL insertEmployee(?,?,?);";
		
		try {
			PreparedStatement addProject = c.prepareStatement(query);
			
			addProject.setString(1, project.getName());
			addProject.setDate(2, getSQLDate(project.getStartDate()));
			addProject.setDate(3, getSQLDate(project.getEndDate()));
			
			addProject.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void removeProject(int id, Connection c){
		String query = "CALL removeEmployee(?);";

		try{
			PreparedStatement removeProject = c.prepareStatement(query);
			
			removeProject.setInt(1, id);
			removeProject.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void updateProject(Project project, Connection c){
		String query = "CALL updateProject(?,?,?,?);";
		
		try{
			PreparedStatement updateProject = c.prepareStatement(query);
			
			updateProject.setInt(1, project.getProjectId());
			updateProject.setString(2, project.getName());
			updateProject.setDate(3, getSQLDate(project.getStartDate()));
			updateProject.setDate(4, getSQLDate(project.getEndDate()));
			
			updateProject.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public String employeesNoProjects(){
		String query = "CALL showEmployeesWithoutProjects();";
		return query;
	}

	public String projectsNoEmployees(){
		String query = "CALL showProjectsWithoutEmployees;";
		return query;
	}	
	
}