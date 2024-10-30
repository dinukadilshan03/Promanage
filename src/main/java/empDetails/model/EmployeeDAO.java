package empDetails.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

	// Create Employee
	public void addEmployee(Employee employee) throws SQLException {
		String query = "INSERT INTO Employee (username, email, type, department, phoneNumber, address) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, employee.getName());
			stmt.setString(2, employee.getEmail());
			stmt.setString(3, employee.getType());
			stmt.setString(4, employee.getDepartment());
			stmt.setString(5, employee.getPhoneNumber());
			stmt.setString(6, employee.getAddress());
			stmt.executeUpdate();
		}
	}

	// Check if name exists in the database
	public boolean checkIfNameExists(String name) throws SQLException {
		String query = "SELECT * FROM Employee WHERE username = ?";
		boolean exists = false;
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, name);
			try (ResultSet rs = stmt.executeQuery()) {
				exists = rs.next(); // If a record is found, it means the name already exists
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return exists;
	}

	public boolean checkIfEmailExists(String email) throws SQLException {
		String query = "SELECT * FROM Employee WHERE email = ?";
		boolean exists = false;
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, email);
			try (ResultSet rs = stmt.executeQuery()) {
				exists = rs.next(); // If a record is found, it means the name already exists
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return exists;
	}

	// Get Employee by ID
	public Employee getEmployeeById(int id) throws SQLException {
		Employee employee = null;
		String query = "SELECT * FROM Employee WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				employee = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
						rs.getString("type"), rs.getString("department"), rs.getString("phoneNumber"),
						rs.getString("address"));
			}
		}
		return employee;
	}

	// Get All Employees
	public List<Employee> getAllEmployees() throws SQLException {
		List<Employee> employees = new ArrayList<>();
		String query = "SELECT * FROM Employee";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Employee employee = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
						rs.getString("type"), rs.getString("department"), rs.getString("phoneNumber"),
						rs.getString("address"));
				employees.add(employee);
			}
		}
		return employees;
	}

	// Update Employee
	public void updateEmployee(Employee employee) throws SQLException {
		String query = "UPDATE Employee SET username = ?, email = ?, type = ?, department = ?, phoneNumber = ?, address = ? WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, employee.getName());
			stmt.setString(2, employee.getEmail());
			stmt.setString(3, employee.getType());
			stmt.setString(4, employee.getDepartment());
			stmt.setString(5, employee.getPhoneNumber());
			stmt.setString(6, employee.getAddress());
			stmt.setInt(7, employee.getId());
			stmt.executeUpdate();
		}
	}

	// Delete Employee
	public void deleteEmployee(int id) throws SQLException {
		String query = "DELETE FROM Employee WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		}
	}

	// Get Employee by Username
	public Employee getEmployeeByUsername(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Employee employee = null;

		try {
			// Establish database connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:4444/promanage", "root", "2003");

			// Use the name column for authentication
			String sql = "SELECT * FROM Employee WHERE username = ?"; // Use name as username
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);

			// Execute query
			rs = stmt.executeQuery();

			// Check if the result set has a row
			if (rs.next()) {
				// Create an Employee object using the result set data
				employee = new Employee(rs.getInt("id"), // id
						rs.getString("username"), // name
						rs.getString("email"), // email
						rs.getString("type"), // type
						rs.getString("department"), // department
						rs.getString("phoneNumber"), // phone number
						rs.getString("address") // address
				);
			}
		} catch (SQLException e) {
			// Handle SQLException
			e.printStackTrace();
			throw e; // Rethrow the exception after logging
		} finally {
			// Close resources
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return employee; // Return the Employee object or null if not found
	}
}