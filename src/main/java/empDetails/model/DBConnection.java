package empDetails.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String jdbcURL = "jdbc:mysql://localhost:4444/promanage";
	private static String jdbcUsername = "root";
	private static String jdbcPassword = "2003";

	public static Connection getConnection() throws SQLException {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new SQLException("JDBC Driver not found");
		}
		return connection;
	}
}
