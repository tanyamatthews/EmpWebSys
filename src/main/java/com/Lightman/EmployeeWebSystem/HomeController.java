package com.Lightman.EmployeeWebSystem;

import java.util.Date;
import java.sql.SQLException;
import java.sql.Connection;
import java.text.SimpleDateFormat;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lightman.Data.IEmployeeSystemMapper;
import com.Lightman.Data.IProjectSystemMapper;

import freemarker.core.ParseException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private DataSource dataSource;

	@Autowired
	public IEmployeeSystemMapper employeeSystem;
	
	@Autowired 
	public IProjectSystemMapper projectSystem;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/projectMenu", method= RequestMethod.GET)
	public String projectMenu(Model model){
		return "adminProject";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/admin-home", method = RequestMethod.GET)
	public String adminHome(Model model) {
		return "adminOptions";
	}

	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public @ResponseBody String deleteEmployee(@RequestParam(value = "id") String id) {
		int employeeId = Integer.parseInt(id);
		employeeSystem.deleteEmployeeWith(employeeId);
		String str = "Employee Deleted";
		return str;

	}
	
	@RequestMapping("/employee/{employeeId}/update")
	public String countries(Model model,@PathVariable("employeeId") String employeeId){
		
		int id = Integer.parseInt(employeeId);
		model.addAttribute("employee", employeeSystem.getEmployee(id));
		System.out.println(employeeSystem.getEmployee(id));
		return "editEmployee";
	}

	@RequestMapping(value = "/allEmployees", method = RequestMethod.GET)
	public String getAllEmployees(Model model, HttpServletRequest request) {

		if (request.getSession().getAttribute("login") != null) {
			model.addAttribute("employees", employeeSystem.getAllEmployees());
			return "allEmployees";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/allProjects", method = RequestMethod.GET)
	public String getAllProjects(Model model, HttpServletRequest request){
		
	//	if(request.getSession().getAttribute("login") != null){
			model.addAttribute("projects", projectSystem.getAllProjects());
			return "allProjects";
	//	}
		
	//	return "redirect:/";
	}

	/**
	 * @RequestMapping(value = "/signup", method = RequestMethod.POST) public
	 *                       String signUp(Model model, HttpServletRequest
	 *                       request, HttpServletResponse response) {
	 * 
	 *                       User user = new
	 *                       User(request.getParameter("full-name"),
	 *                       request.getParameter("userName"),
	 *                       request.getParameter("password")); try { Connection
	 *                       connection = dataSource.getConnection(); Driver db
	 *                       = new Driver(); db.insertUser(user, connection); }
	 *                       catch (SQLException e) { e.printStackTrace(); }
	 * 
	 *                       return "accountCreated"; }
	 **/

	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public String addEmployee(Model model, @ModelAttribute Employee employee) {

		System.out.println(employee);

		try {

			Driver db = new Driver();
			db.addEmployeeINDatabase(employee, dataSource.getConnection());
			String msg = "Employee " + employee.getFirstName() + " " + employee.getSurName() + " has been added";
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
		String home = "adminOptions";
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

		if ((loginSuccessfull) && (currentUser.equals(adminUser))) {
			msg = "Login Successful";
			request.getSession().setAttribute("login", true);
		} else if ((loginSuccessfull) && (currentUser.equals(financeUser))) {
			msg = "Login Successful";
		} else if ((loginSuccessfull) && (currentUser.equals(chrisUser))) {
			msg = "Login Successful";
		}

		model.addAttribute("msg", msg);
		return home;

	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String showDashboard(HttpServletRequest request) {

		if (request.getSession().getAttribute("login") != null) {
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

	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	public String addProject(Model m, HttpServletRequest request, HttpServletResponse response) {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date eDate;
		Date sDate;
		try {
			sDate = formatter.parse(request.getParameter("startDate"));
			eDate = formatter.parse(request.getParameter("endDate"));
			String name = request.getParameter("projectName");
			Project project = new Project(name, sDate, eDate);
			ProjectDriver db = new ProjectDriver();
			db.addProjectProcess(project, dataSource.getConnection());

			System.out.println("Project added.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "adminProject";

	}
	
	private Date getSQLDate(java.util.Date date) {
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return sqlDate;
	}

	@RequestMapping(value = "/updateProject", method = RequestMethod.POST)
	public String updateProject(Model m, HttpServletRequest request, HttpServletResponse response) {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date eDate;
		Date sDate;
		try {
			sDate = formatter.parse(request.getParameter("startDate"));
			eDate = formatter.parse(request.getParameter("endDate"));
			String name = request.getParameter("projectName");
			Project project = new Project(name, sDate, eDate);
			ProjectDriver db = new ProjectDriver();
			db.updateProjectProcess(project, dataSource.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "adminProject";
	}

	@RequestMapping(value = "/deleteProject", method = RequestMethod.POST)
	public String removeProject(Model m, HttpServletRequest request, HttpServletResponse response) {

		try {
			int id = Integer.parseInt(request.getParameter("projectId"));
			ProjectDriver db = new ProjectDriver();
			db.removeProjectProcess(id, dataSource.getConnection());
			System.out.println("Project " + id + " removed");
		} catch (SQLException e) {
			System.out.println("Project not removed");
		}

		return "adminProject";

	}
}
