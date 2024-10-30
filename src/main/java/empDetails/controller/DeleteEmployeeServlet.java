package empDetails.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import empDetails.model.EmployeeDAO;

@WebServlet("/deleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			EmployeeDAO employeeDAO = new EmployeeDAO();
			employeeDAO.deleteEmployee(id);
			response.sendRedirect("listEmployees");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("empDetails/error.jsp");
		}
	}
}
