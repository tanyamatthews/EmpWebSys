package com.Lightman.EmployeeWebSystem;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

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

	@RequestMapping(value = "/login-process", method = RequestMethod.POST)
	public String loginProcess(Model m, HttpServletRequest request, HttpServletResponse response) {
		String msg = "";

		try {
			Connection connection = dataSource.getConnection();
			Driver db = new Driver();
			msg = db.checkUsernameAndPassword(connection, request.getParameter("username"),
					request.getParameter("password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		m.addAttribute("msg", msg);
		return "Dashboard";
	}
}
