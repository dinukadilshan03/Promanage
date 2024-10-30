package task.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import task.dao.TaskDAO;
import task.model.Task;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
	private TaskDAO taskDAO;

	@Override
	public void init() {
		taskDAO = new TaskDAO(); // Initialize TaskDAO
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve all tasks
		List<Task> tasks = taskDAO.getAllTasks();

		// Set tasks in request scope
		request.setAttribute("tasks", tasks);

		// Forward to the JSP page to display tasks
		request.getRequestDispatcher("task/viewAllTasks.jsp").forward(request, response);
	}
}
