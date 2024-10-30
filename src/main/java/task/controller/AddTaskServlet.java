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

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get parameters from the request
		String taskName = request.getParameter("taskName");
		String assignedTo = request.getParameter("assignedTo");
		String description = request.getParameter("description");
		String priority = request.getParameter("priority");
		String deadlineStr = request.getParameter("deadline");

		// Set the default status to "Assigned"
		String status = "Assigned"; // Status is always "Assigned" by default

		// Parse the deadline string to a Date object
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date deadline = null;
		try {
			deadline = sdf.parse(deadlineStr);
		} catch (ParseException e) {
			e.printStackTrace();
			// Handle parsing error if needed (you can also set a default date or return an
			// error message)
		}

		// Create a new Task object
		Task task = new Task();
		task.setTaskName(taskName);
		task.setAssignedTo(assignedTo);
		task.setStatus(status); // The default status "Assigned"
		task.setDescription(description);
		task.setPriority(priority);
		task.setDeadline(deadline);

		// Use TaskDAO to save the task
		TaskDAO taskDAO = new TaskDAO();
		taskDAO.addTask(task);

		// Redirect to the tasks page or task listing page
		response.sendRedirect("tasks"); // Adjust the redirect URL as needed
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		List<User> employees = userDAO.getEmployees(); // Get the list of employees
		// Check if employees list is not null or empty
		if (employees != null && !employees.isEmpty()) {
			request.setAttribute("employees", employees);
			System.out.println("employees found.");
		} else {
			System.out.println("No employees found."); // Debugging line
		}

		// Forward to the JSP page (you need to create this JSP page)
		request.getRequestDispatcher("task/assignTask.jsp").forward(request, response);
	}
}
