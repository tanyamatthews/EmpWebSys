package com.Lightman.Data;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import com.Lightman.EmployeeWebSystem.Project;

public interface IProjectSystemMapper {

	 @Select("SELECT * FROM project")
	 @Results({
	  @Result(id=true, property="projectId", column="project_id"),
	  @Result(property="name", column="name"),
	  @Result(property="startDate", column="start_date"),
	  @Result(property="endDate", column="end_date")
	 })
	 public List<Project> getAllProjects();
	 
	
}
