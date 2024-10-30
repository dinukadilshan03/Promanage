package leave.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import leave.model.Leave;
import leave.model.LeaveDAO;

@WebServlet("/managerLeave")
public class ManagerLeaveServlet extends HttpServlet {

	// Handle displaying the leave requests
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LeaveDAO dao = new LeaveDAO();
		List<Leave> leaves = dao.getAllLeaves();

		// Set the list of leaves as a request attribute and forward to JSP
		request.setAttribute("leaves", leaves);
		RequestDispatcher dispatcher = request.getRequestDispatcher("leave/managerView.jsp");
		dispatcher.forward(request, response);
	}

	// Handle updating leave status
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String status = request.getParameter("status");

		LeaveDAO dao = new LeaveDAO();
		if (dao.updateLeaveStatus(id, status)) {
			response.sendRedirect("managerLeave");
		} else {
			response.sendRedirect("leave/error.jsp");
		}
	}
}
