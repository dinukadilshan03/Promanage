package task.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import task.model.Task;
import task.util.DBConnection;

public class TaskDAO {

	// Method to add a new task
	public void addTask(Task task) {
		String sql = "INSERT INTO task (taskName, assignedTo, status, description, priority, deadline) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, task.getTaskName());
			stmt.setString(2, task.getAssignedTo());
			stmt.setString(3, task.getStatus());
			stmt.setString(4, task.getDescription());
			stmt.setString(5, task.getPriority());
			stmt.setTimestamp(6, new java.sql.Timestamp(task.getDeadline().getTime()));

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Method to update an existing task
	public void updateTask(Task task) {
		String sql = "UPDATE task SET taskName=?, assignedTo=?, status=?, description=?, priority=?, deadline=? WHERE taskId=?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, task.getTaskName());
			stmt.setString(2, task.getAssignedTo());
			stmt.setString(3, task.getStatus());
			stmt.setString(4, task.getDescription());
			stmt.setString(5, task.getPriority());
			stmt.setTimestamp(6, new java.sql.Timestamp(task.getDeadline().getTime()));
			stmt.setInt(7, task.getTaskId());

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Method to delete a task
	public void deleteTask(int taskId) {
		String sql = "DELETE FROM task WHERE taskId = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, taskId);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Method to get a task by ID
	public Task getTask(int taskId) {
		Task task = null;
		String sql = "SELECT * FROM task WHERE taskId=?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setInt(1, taskId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				task = new Task();
				task.setTaskId(rs.getInt("taskId"));
				task.setTaskName(rs.getString("taskName"));
				task.setAssignedTo(rs.getString("assignedTo"));
				task.setStatus(rs.getString("status"));
				task.setDescription(rs.getString("description"));
				task.setPriority(rs.getString("priority"));
				task.setDeadline(rs.getTimestamp("deadline"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return task;
	}

	// Method to get all tasks
	public List<Task> getAllTasks() {
		List<Task> tasks = new ArrayList<>();
		String sql = "SELECT t.taskId, t.taskName, u.username AS assignedTo, "
				+ "t.status, t.description, t.priority, t.deadline " + "FROM task t "
				+ "JOIN users u ON t.assignedTo = u.userId"; // Assuming 'assignedTo' is a user ID

		try (Connection conn = DBConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {

			while (rs.next()) {
				Task task = new Task();
				task.setTaskId(rs.getInt("taskId"));
				task.setTaskName(rs.getString("taskName"));
				task.setAssignedTo(rs.getString("assignedTo")); // This will now be the username
				task.setStatus(rs.getString("status"));
				task.setDescription(rs.getString("description"));
				task.setPriority(rs.getString("priority"));
				task.setDeadline(rs.getTimestamp("deadline"));
				tasks.add(task);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tasks;
	}

	// Method to get tasks assigned to a specific user by userId
	public List<Task> getTasksByUserId(int userId) {
		List<Task> tasks = new ArrayList<>();
		String sql = "SELECT t.taskId, t.taskName, u.username AS assignedTo, "
				+ "t.status, t.description, t.priority, t.deadline " + "FROM task t "
				+ "JOIN users u ON t.assignedTo = u.userId WHERE u.userId = ?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setInt(1, userId); // Set the userId in the query
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Task task = new Task();
				task.setTaskId(rs.getInt("taskId"));
				task.setTaskName(rs.getString("taskName"));
				task.setAssignedTo(rs.getString("assignedTo")); // Use the username from users table
				task.setStatus(rs.getString("status"));
				task.setDescription(rs.getString("description"));
				task.setPriority(rs.getString("priority"));
				task.setDeadline(rs.getTimestamp("deadline"));
				tasks.add(task);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tasks;
	}

	// Method to update the status of a specific task by taskId
	public void updateTaskStatus(int taskId, String newStatus) {
		String sql = "UPDATE task SET status = ? WHERE taskId = ?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, newStatus); // Set the new status
			stmt.setInt(2, taskId); // Set the task ID in the query
			stmt.executeUpdate(); // Execute the update
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
