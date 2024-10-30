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

@WebServlet("/updateEmployee")
public class UpdateEmployeeServlet extends HttpServlet {

	// Handle the GET request to populate the edit form
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			EmployeeDAO employeeDAO = new EmployeeDAO();
			Employee employee = employeeDAO.getEmployeeById(id);
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("empDetails/editEmployee.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("empDetails/error.jsp");
		}
	}

	// Handle the POST request to update the employee
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve updated employee data from the form
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		String department = request.getParameter("department");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");

		// Create an updated Employee object
		Employee updatedEmployee = new Employee(id, name, email, type, department, phoneNumber, address);

		try {
			// Use the DAO to update the employee in the database
			EmployeeDAO employeeDAO = new EmployeeDAO();
			employeeDAO.updateEmployee(updatedEmployee);
			response.sendRedirect("listEmployees"); // Redirect to the list after updating
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("empDetails/error.jsp");
		}
	}
}
