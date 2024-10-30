package empDetails.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empDetails.model.Employee;
import empDetails.model.EmployeeDAO;

@WebServlet("/createEmployee")
public class CreateEmployeeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch employee details from request
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		String department = request.getParameter("department");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");

		// Create a DAO instance to check for duplicate names
		EmployeeDAO employeeDAO = new EmployeeDAO();

		try {
			// Check if the name already exists
			if (employeeDAO.checkIfNameExists(name)) {
				// Redirect back to the form with an error message
				request.setAttribute("errorMessage", "Name already exists. Please choose a different name.");
				request.getRequestDispatcher("empDetails/createEmployee.jsp").forward(request, response);
			} else if (employeeDAO.checkIfEmailExists(email)) {

				request.setAttribute("errorMessage", "that email already exists. Please choose a different email.");
				request.getRequestDispatcher("empDetails/createEmployee.jsp").forward(request, response);
			} else {
				// If name is unique, create a new employee object and add to the database
				Employee newEmployee = new Employee(name, email, type, department, phoneNumber, address);
				employeeDAO.addEmployee(newEmployee);
				response.sendRedirect("listEmployees");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while creating the employee: " + e.getMessage());
			request.getRequestDispatcher("empDetails/error.jsp").forward(request, response);
		}
	}
}