package com.Lightman.EmployeeWebSystem;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private DataSource dataSource;


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
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
	public String addEmployee(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth;
		try {
			dateOfBirth = formatter.parse(request.getParameter("dob"));
			String title = request.getParameter("title");
			String forname = request.getParameter("firstName");
			String surname = request.getParameter("lastName");
			double salary = Double.parseDouble(request.getParameter("salary"));	
			Employee employee = new Employee(dateOfBirth,forname, surname,title,null ,salary);
			Driver db = new Driver();
			db.addEmployeeINDatabase(employee, dataSource.getConnection());
			
			System.out.println("employee Added");
			
		} catch (ParseException e) {
			System.out.println("employee NOT Added");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("employee NOT Added");
			e.printStackTrace();
		}

		return "adminHome";
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
}
