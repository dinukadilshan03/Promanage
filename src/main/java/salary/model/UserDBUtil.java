package salary.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

	public static String authenticateUser(String username, String password) {
		String role = null;

		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password); // In a real app, use hashed password

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				role = rs.getString("role");
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return role;
	}

	public static String getUserNameById(int userId) {
		String userName = null;

		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT username FROM users WHERE userId = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				userName = rs.getString("userName");
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userName;
	}

	public static List<String> getAvailableUsersForSalary() {
		List<String> userList = new ArrayList<>();

		try {
			Connection conn = DBConnection.getConnection();

			// SQL to get users who are not in the salary table and have the role 'employee'
			String sql = "SELECT u.username FROM users u " + "LEFT JOIN salary s ON u.userId = s.userId "
					+ "WHERE s.userId IS NULL AND u.role = 'employee'";
			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				userList.add(rs.getString("username"));
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userList;
	}

	public static int getUserIdByUsername(String userName) {
		int userId = -1;

		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT userId FROM users WHERE username = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				userId = rs.getInt("userId");
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userId;
	}

}
