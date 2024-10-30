package leave.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class LeaveDAO {

	// Method to insert a new leave request
	public boolean insertLeave(Leave leave) {
		try (Connection connection = DBConnect.getConnection()) {
			String query = "INSERT INTO leave_form (employee_id, leave_type, from_date, to_date, reason) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, leave.getEmployeeId()); // Assuming employeeId is username from users table
			statement.setString(2, leave.getLeaveType());
			statement.setString(3, leave.getFromDate());
			statement.setString(4, leave.getToDate());
			statement.setString(5, leave.getReason());

			int rowsAffected = statement.executeUpdate();
			return rowsAffected > 0; // Return true if insertion is successful
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to get all leave requests by employee
	public List<Leave> getLeaveByEmployee(String employeeId) {
		List<Leave> leaves = new ArrayList<>();
		try (Connection connection = DBConnect.getConnection()) {
			String query = "SELECT * FROM leave_form WHERE employee_id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, employeeId); // Assuming employeeId is the username from users table
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				Leave leave = new Leave();
				leave.setId(rs.getInt("id"));
				leave.setLeaveType(rs.getString("leave_type"));
				leave.setFromDate(rs.getString("from_date"));
				leave.setToDate(rs.getString("to_date"));
				leave.setReason(rs.getString("reason"));
				leave.setStatus(rs.getString("status"));
				leaves.add(leave);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return leaves;
	}

	// Method to update leave request
	public boolean updateLeave(Leave leave) {
		String sql = "UPDATE leave_form SET leave_type = ?, from_date = ?, to_date = ?, reason = ? WHERE id = ?";
		try (Connection connection = DBConnect.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setString(1, leave.getLeaveType());
			statement.setDate(2, java.sql.Date.valueOf(leave.getFromDate()));
			statement.setDate(3, java.sql.Date.valueOf(leave.getToDate()));
			statement.setString(4, leave.getReason());
			statement.setInt(5, leave.getId());

			int rowsUpdated = statement.executeUpdate();
			return rowsUpdated > 0; // Returns true if the update was successful
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Method to delete a leave request
	public boolean deleteLeave(int id) {
		try (Connection connection = DBConnect.getConnection()) {
			String query = "DELETE FROM leave_form WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			return statement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to get all leave requests
	public List<Leave> getAllLeaves() {
		List<Leave> leaves = new ArrayList<>();
		try (Connection connection = DBConnect.getConnection()) {
			String query = "SELECT * FROM leave_form";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				Leave leave = new Leave();
				leave.setId(rs.getInt("id"));
				leave.setEmployeeId(rs.getString("employee_id"));
				leave.setLeaveType(rs.getString("leave_type"));
				leave.setFromDate(rs.getString("from_date"));
				leave.setToDate(rs.getString("to_date"));
				leave.setReason(rs.getString("reason"));
				leave.setStatus(rs.getString("status"));
				leaves.add(leave);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return leaves;
	}

	// Method to update leave status
	public boolean updateLeaveStatus(int id, String status) {
		try (Connection connection = DBConnect.getConnection()) {
			String query = "UPDATE leave_form SET status = ? WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, status);
			statement.setInt(2, id);
			return statement.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to check if an employee exists in the users table
	public boolean employeeExists(String employeeId) {
		String query = "SELECT COUNT(*) FROM users WHERE username = ?";
		try (Connection connection = DBConnect.getConnection();
				PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, employeeId); // employeeId is now the username
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getInt(1) > 0; // Return true if the count is greater than 0
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to get leave request by ID
	public Leave getLeaveById(int id) {
		Leave leave = null;
		String sql = "SELECT * FROM leave_form WHERE id = ?";

		try (Connection connection = DBConnect.getConnection();
				PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				leave = new Leave();
				leave.setId(resultSet.getInt("id"));
				leave.setEmployeeId(resultSet.getString("employee_id"));
				leave.setLeaveType(resultSet.getString("leave_type"));

				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				leave.setFromDate(dateFormat.format(resultSet.getDate("from_date")));
				leave.setToDate(dateFormat.format(resultSet.getDate("to_date")));

				leave.setReason(resultSet.getString("reason"));
				leave.setStatus(resultSet.getString("status"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return leave;
	}
}
