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

@WebServlet("/employeeDashboard")
public class EmployeeDashboardServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch employee ID from session
		HttpSession session = request.getSession();
		int employeeId = (int) session.getAttribute("employeeId");

		try {
			EmployeeDAO employeeDAO = new EmployeeDAO();
			// Fetch employee details by ID
			Employee employee = employeeDAO.getEmployeeById(employeeId);
			// Set the employee object as a request attribute
			request.setAttribute("employee", employee);
			// Forward to the dashboard JSP page
			request.getRequestDispatcher("employeeDashboard.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			// Redirect to error page in case of exception
			response.sendRedirect("empDetails/error.jsp");
		}
	}
}
