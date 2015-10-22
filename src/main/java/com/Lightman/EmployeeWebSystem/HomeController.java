package com.Lightman.EmployeeWebSystem;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Lightman.Data.IEmployeeSystemMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public IEmployeeSystemMapper employeeSystem;


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/allEmployees", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {
		model.addAttribute("employees", employeeSystem.getAllEmployees());
		return "allEmployees";
	}

/**
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(Model model, HttpServletRequest request, HttpServletResponse response) {

		User user = new User(request.getParameter("full-name"), request.getParameter("userName"),
				request.getParameter("password"));
		try {
			Connection connection = dataSource.getConnection();
			Driver db = new Driver();
			db.insertUser(user, connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "accountCreated";
	}
**/
	
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public String addEmployee(Model model, @ModelAttribute Employee employee) {
		
		System.out.println(employee);
		
		
		try {

			Driver db = new Driver();
			db.addEmployeeINDatabase(employee, dataSource.getConnection());
			String msg ="Employee "+employee.getFirstName()+" "+employee.getSurName()+" has been added";
			model.addAttribute("msg", msg);
			System.out.println("employee Added");
			
		} catch (SQLException e) {
			System.out.println("employee NOT Added");
			e.printStackTrace();
		}

		return "adminHome";
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
	
	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.POST)
	public String deleteEmployee(Model model, HttpServletRequest request, HttpServletResponse response) {
		

		try {
			int id = Integer.parseInt(request.getParameter("employeeId"));
			Driver db = new Driver();
			db.removeEmployeeFromDatabase(id, dataSource.getConnection());
			System.out.println("employee has been removed");
			
		} catch (SQLException e) {
			System.out.println("employee NOT removed");
			e.printStackTrace();
		}

		return "adminHome";
	}
	
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String loginProcess(Model model, HttpServletRequest request, HttpServletResponse response) {
		String msg = "Access Denied, Please try again";
		String adminUser = "admin";
		String financeUser = "finance";
		String chrisUser = "chrisr";
		String currentUser = request.getParameter("username");
		String currentPassword = request.getParameter("password");
		String home = "home";
		Boolean loginSuccessfull = false;
		
		/*
		 * Checking credentials to determine if logged in or not		
		 */
		try {
			Connection connection = dataSource.getConnection();
			Driver db = new Driver();
			loginSuccessfull = db.checkUsernameAndPassword(connection, currentUser, currentPassword);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if((loginSuccessfull) && (currentUser.equals(adminUser))){
			msg = "Login Successful";
			request.getSession().setAttribute("login", true);
			home = "adminHome";
		}else if((loginSuccessfull) && (currentUser.equals(financeUser))){
			msg = "Login Successful";
			home = "financeHome";
		}else if((loginSuccessfull) && (currentUser.equals(chrisUser))){
			msg = "Login Successful";
			home= "chrisHome";
		}

		model.addAttribute("msg", msg);
		return home;

	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String showDashboard(HttpServletRequest request) {
		
		if (request.getSession().getAttribute("login") != null){
			return "adminHome";
		}
		return "redirect:/";
	}
	
	
	
	
	
	
	/**
	 * 
	 * @param m
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(value="/addProject", method= RequestMethod.POST)
	public String addProjectProcess(Model m, HttpServletRequest request, HttpServletResponse response){

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date eDate;
		Date sDate;
		try{
			sDate = formatter.parse(request.getParameter("startDate"));
			eDate = formatter.parse(request.getParameter("endDate"));
			String name = request.getParameter("projectName");
			Project project = new Project(name, sDate, eDate);
			ProjectDriver db = new ProjectDriver();
			db.addProject(project, dataSource.getConnection());

			System.out.println("Project added.");
		}catch(ParseException e){
			System.out.println("Project NOT added.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "adminHome";

	}

	@RequestMapping(value="/updateProject", method= RequestMethod.POST)
	public String updateProjectProcess(Model m, HttpServletRequest request, HttpServletResponse response){

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date eDate;
		Date sDate;
		try{
			sDate = formatter.parse(request.getParameter("startDate"));
			eDate = formatter.parse(request.getParameter("endDate"));
			String name = request.getParameter("projectName");
			Project project = new Project(name, sDate, eDate);
			ProjectDriver db = new ProjectDriver();
			db.updateProject(project, dataSource.getConnection());
		}catch(ParseException pe){
			System.out.println("Project NOT updated");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "adminHome";
	}

	@RequestMapping(value="/deleteProject", method= RequestMethod.POST)
	public String deleteProjectProcess(Model m, HttpServletRequest request, HttpServletResponse response){

		try{
			int id = Integer.parseInt(request.getParameter("projectId"));
			ProjectDriver db = new ProjectDriver();
			db.removeProject(id, dataSource.getConnection());
			System.out.println("Project " + id + " removed");
		}catch(SQLException e){
			System.out.println("Project not removed");
		}

		return "adminHome";

	}
}
