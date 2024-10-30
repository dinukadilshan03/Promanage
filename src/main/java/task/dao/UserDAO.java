package task.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import task.model.User;
import task.util.DBConnection;

public class UserDAO {
	private Connection connection;

	public UserDAO() {
		this.connection = DBConnection.getConnection();
	}

	public User authenticate(String username, String password) {
		User user = null;
		String query = "SELECT * FROM users WHERE username = ? AND password = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(query)) {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt("userId"), rs.getString("username"), rs.getString("password"),
						rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		String query = "SELECT * FROM users"; // Adjust this query based on your database schema
		try (PreparedStatement pstmt = connection.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				User user = new User(rs.getInt("userId"), rs.getString("username"), rs.getString("password"),
						rs.getString("role"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	// New method to get userId by username
	public static Integer getUserIdByUsername(String username) {
		Integer userId = null;
		String query = "SELECT userId FROM users WHERE username = ?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, username);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					userId = rs.getInt("userId");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework instead
		}

		return userId;
	}

	public List<User> getEmployees() {
		List<User> employees = new ArrayList<>();
		String query = "SELECT * FROM users WHERE role = 'employee'"; // Adjust if necessary
		try (PreparedStatement pstmt = connection.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				User user = new User(rs.getInt("userId"), rs.getString("username"), rs.getString("password"),
						rs.getString("role"));
				employees.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Print any SQL exceptions
		}

		// Log the number of employees fetched
		System.out.println("Number of employees fetched: " + employees.size());

		return employees;
	}

	public static String getUserUsernameBytaskId(int id) {
		String username = null;
		String query = "select u.username from users u,task t where u.userId = t.assignedTo and t.assignedTo  = ?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					username = rs.getString("username");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Consider using a logging framework instead
		}

		return username;
	}

}
