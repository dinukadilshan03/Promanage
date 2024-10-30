package task.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import task.dao.TaskDAO;
import task.dao.UserDAO;
import task.model.Task;
import task.model.User;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {
	private TaskDAO taskDAO;
	private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		taskDAO = new TaskDAO();
		userDAO = new UserDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UpdateTaskServlet triggered");

		// Retrieve the task ID from the request
		int taskId = Integer.parseInt(request.getParameter("taskId"));

		// Get the task details and users
		Task task = taskDAO.getTask(taskId);
		List<User> users = userDAO.getEmployees();

		// Predefined task statuses
		String[] statuses = { "Assigned", "Ongoing", "Finished" };

		// assigned user
		String username = UserDAO.getUserUsernameBytaskId(taskId);
		// Set attributes for JSP
		request.setAttribute("task", task);
		request.setAttribute("users", users);
		request.setAttribute("statuses", statuses);
		request.setAttribute("username", username);

		// Forward to editTask.jsp
		request.getRequestDispatcher("task/editTask.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("UpdateTaskServlet triggered");
		// Retrieve parameters from the request
		int taskId = Integer.parseInt(request.getParameter("taskId"));
		String taskName = request.getParameter("taskName");
		String assignedTo = request.getParameter("assignedTo");
		String description = request.getParameter("description");
		String priority = request.getParameter("priority");
		String status = request.getParameter("status");
		String deadlineStr = request.getParameter("deadline");

		// Parse the deadline date
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = null;
		try {
			deadline = dateFormat.parse(deadlineStr);
		} catch (ParseException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Invalid date format for deadline.");
			request.getRequestDispatcher("task/editTask.jsp").forward(request, response);
			return;
		}

		// Create a Task object with the updated values
		Task task = new Task();
		task.setTaskId(taskId);
		task.setTaskName(taskName);
		task.setAssignedTo(assignedTo);
		task.setDescription(description);
		task.setPriority(priority);
		task.setStatus(status);
		task.setDeadline(deadline);

		// Update the task in the database
		taskDAO.updateTask(task);

		// Redirect to a confirmation page or back to the task list
		response.sendRedirect("tasks");
	}
}
