package empDetails.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empDetails.model.Employee;
import empDetails.model.EmployeeDAO;

@WebServlet("/listEmployees")
public class ListEmployeesServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Fetch all employees using EmployeeDAO
			EmployeeDAO employeeDAO = new EmployeeDAO();
			List<Employee> employees = employeeDAO.getAllEmployees();

			// Set employees list as request attribute
			request.setAttribute("employees", employees);

			// Forward to the JSP page for display
			request.getRequestDispatcher("empDetails/viewEmployees.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			// Redirect to error page in case of SQL exception
			response.sendRedirect("empDetails/error.jsp");
		}
	}
}
