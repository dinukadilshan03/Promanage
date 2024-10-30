package task.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import task.dao.TaskDAO;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
	private TaskDAO taskDAO = new TaskDAO();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int taskId = Integer.parseInt(request.getParameter("taskId"));
			taskDAO.deleteTask(taskId);
			response.sendRedirect("tasks"); // Redirect to the task list after deletion
		} catch (NumberFormatException e) {
			// Handle error if taskId is not a valid integer
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid task ID");
		} catch (Exception e) {
			// Handle any other errors
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"An error occurred while deleting the task");
		}
	}
}
