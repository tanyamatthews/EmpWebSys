package com.Lightman.EmployeeWebSystem;

import java.util.Date;

public class Project {
	
	int projectId;
	String name;
	Date startDate;
	Date endDate;
	
	public Project(){
		//empty constructor
	}
	
	//with ID
	
	public Project(int projectId, String name, Date startDate, Date endDate){
		super();
		this.projectId = projectId;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	//without ID
	
	public Project(String name, Date startDate, Date endDate) {
		super();
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public final int getProjectId(){
		return projectId;
	}
	
	public final void setProjectId(int projectId){
		this.projectId = projectId;
	}
	
	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final Date getStartDate() {
		return startDate;
	}

	public final void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public final Date getEndDate() {
		return endDate;
	}

	public final void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}
