package empDetails.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import empDetails.model.Employee;
import empDetails.model.EmployeeDAO;

@WebServlet("/viewEmployeeProfile")
public class ViewEmployeeProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get the username from the session
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		if (username == null) {
			// If no session, redirect to login
			response.sendRedirect("login.jsp");
			return;
		}

		try {
			EmployeeDAO employeeDAO = new EmployeeDAO();

			// Fetch employee details using the username
			Employee employee = employeeDAO.getEmployeeByUsername(username);

			if (employee != null) {
				// Set employee details as request attribute and forward to profile view
				request.setAttribute("employee", employee);
				request.getRequestDispatcher("empDetails/employeeProfile.jsp").forward(request, response);
			} else {
				// Handle case when employee is not found
				response.sendRedirect("empDetails/error.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("empDetails/error.jsp");
		}
	}
}
