package empDetails.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import empDetails.model.Employee;

public class EmployeeProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Check if session exists
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("employeeId") != null) {
			int employeeId = (Integer) session.getAttribute("employeeId");

			// Fetch employee details
			Employee employee = getEmployeeById(employeeId);
			request.setAttribute("employee", employee);

			// Forward to the JSP page
			RequestDispatcher dispatcher = request.getRequestDispatcher("empDetails/employeeProfile.jsp");
			dispatcher.forward(request, response);
		} else {
			// Redirect to login if session doesn't exist
			response.sendRedirect("login.jsp");
		}
	}

	private Employee getEmployeeById(int employeeId) {
		Employee employee = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			// Database connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:4444/promanage", "root", "2003");

			// Updated query to reflect new fields
			String sql = "SELECT * FROM employees WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, employeeId);

			rs = stmt.executeQuery();

			if (rs.next()) {
				// Map new fields to the Employee object
				employee = new Employee(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
						rs.getString("type"), rs.getString("department"), rs.getString("phoneNumber"),
						rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Close resources
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return employee;
	}
}
