package task.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import task.dao.TaskDAO;
import task.dao.UserDAO;
import task.model.Task;

@WebServlet("/myTasks")
public class MyTasksServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the session
		HttpSession userSession = request.getSession(false);
		String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;

		if (username == null) {
			// If username is null, redirect to login page
			response.sendRedirect("login.jsp");
			return; // Stop further processing
		}

		// Retrieve tasks for the logged-in user
		retrieveAndSetTasks(request, response, username, null);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle form submission for updating task status
		String taskIdParam = request.getParameter("taskId");
		String newStatus = request.getParameter("status");
		String username = (String) request.getSession().getAttribute("username");

		String errorMessage = null;

		try {
			if (taskIdParam != null && newStatus != null) {
				int taskId = Integer.parseInt(taskIdParam);
				TaskDAO taskDAO = new TaskDAO();
				taskDAO.updateTaskStatus(taskId, newStatus); // Update task status

				// Optionally, you can retrieve the updated tasks after status change
			}
		} catch (NumberFormatException e) {
			errorMessage = "Invalid task ID. Please try again."; // Handle number format exception
		} catch (Exception e) {
			errorMessage = "Error updating task status. Please try again later."; // Handle general exceptions
			e.printStackTrace(); // Log the error for debugging
		}

		// Redirect back to the same servlet to see updates, including error message
		retrieveAndSetTasks(request, response, username, errorMessage);
	}

	private void retrieveAndSetTasks(HttpServletRequest request, HttpServletResponse response, String username,
			String errorMessage) throws ServletException, IOException {
		TaskDAO taskDAO = new TaskDAO();
		List<Task> tasks;

		try {
			// Retrieve userId from username
			int userId = UserDAO.getUserIdByUsername(username);
			tasks = taskDAO.getTasksByUserId(userId);
		} catch (Exception e) {
			e.printStackTrace(); // Log the error for debugging
			errorMessage = "Error retrieving tasks. Please try again later."; // Set a user-friendly error message
			tasks = null; // Ensure tasks is null if there's an error
		}

		// Set attributes for the JSP
		request.setAttribute("tasks", tasks);
		request.setAttribute("errorMessage", errorMessage); // Pass the error message to JSP
		request.getRequestDispatcher("task/myTasks.jsp").forward(request, response); // Forward to JSP
	}
}
