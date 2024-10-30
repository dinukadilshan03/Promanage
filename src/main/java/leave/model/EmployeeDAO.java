package leave.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

	// Method to insert a new employee (user)
	public boolean insertEmployee(Employee employee) {
		try (Connection connection = DBConnect.getConnection()) {
			String query = "INSERT INTO users (username, password, role) VALUES (?, ?, 'employee')";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, employee.getEmployeeId()); // assuming employeeId is used as username
			statement.setString(2, employee.getPassword()); // Hash in production
			return statement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to get an employee by username
	public Employee getEmployeeById(String username) {
		Employee employee = null;
		String sql = "SELECT * FROM users WHERE username = ? AND role = 'employee'";

		try (Connection connection = DBConnect.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setString(1, username);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				employee = new Employee();
				employee.setEmployeeId(resultSet.getString("username"));
				employee.setPassword(resultSet.getString("password")); // Hash in production
				// Add role and other details if needed
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return employee;
	}

	// Method to verify employee credentials
	public boolean verifyEmployee(String username, String password) {
		try (Connection connection = DBConnect.getConnection()) {
			String query = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'employee'";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, username);
			statement.setString(2, password); // Hash in production
			ResultSet resultSet = statement.executeQuery();
			return resultSet.next(); // Returns true if employee exists
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to get all employees
	public List<Employee> getAllEmployees() {
		List<Employee> employees = new ArrayList<>();
		try (Connection connection = DBConnect.getConnection()) {
			String query = "SELECT * FROM users WHERE role = 'employee'";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Employee employee = new Employee();
				employee.setEmployeeId(rs.getString("username"));
				employee.setPassword(rs.getString("password")); // Hash in production
				employees.add(employee);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return employees;
	}
}
