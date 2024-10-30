package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDBUtil {

	public static String authenticateUser(String username, String password) {
		String role = null;

		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);

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
}
