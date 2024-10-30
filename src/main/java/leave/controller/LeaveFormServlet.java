package leave.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import leave.model.Employee;
import leave.model.EmployeeDAO;
import leave.model.Leave;
import leave.model.LeaveDAO;

@WebServlet("/leaveForm")
public class LeaveFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String employeeId = (String) session.getAttribute("username");
		System.out.println("Employee ID retrieved from session: " + employeeId);

		// Redirect to login if employeeId is not found
		if (employeeId == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		EmployeeDAO employeeDAO = new EmployeeDAO();
		Employee employee = employeeDAO.getEmployeeById(employeeId);

		if (employee == null) {
			request.setAttribute("errorMessage", "Employee details not found.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("leave/error.jsp");
			dispatcher.forward(request, response);
			return;
		}

		LeaveDAO leaveDAO = new LeaveDAO();
		List<Leave> leaves = leaveDAO.getLeaveByEmployee(employeeId);

		// Pass employee and leave data to JSP
		request.setAttribute("employee", employee);
		request.setAttribute("leaves", leaves);

		// Forward to the view.jsp to display the employee's leave information
		RequestDispatcher dispatcher = request.getRequestDispatcher("leave/view.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Handle leave form submission
		String employeeId = request.getParameter("employeeId");
		String leaveType = request.getParameter("leaveType");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String reason = request.getParameter("reason");

		// Debugging: Print form values
		System.out.println("Employee ID: " + employeeId);
		System.out.println("Leave Type: " + leaveType);
		System.out.println("From Date: " + fromDate);
		System.out.println("To Date: " + toDate);
		System.out.println("Reason: " + reason);

		// Validation checks
		if (employeeId == null || employeeId.isEmpty()) {
			forwardError(request, response, "Employee ID is missing.");
			return;
		}

		if (leaveType == null || leaveType.isEmpty()) {
			forwardError(request, response, "Leave type is required.");
			return;
		}

		if (fromDate == null || toDate == null || fromDate.isEmpty() || toDate.isEmpty()) {
			forwardError(request, response, "Both dates are required.");
			return;
		}

		// Check if fromDate is before toDate
		if (fromDate.compareTo(toDate) > 0) {
			forwardError(request, response, "From Date cannot be later than To Date.");
			return;
		}

		if (reason == null || reason.isEmpty()) {
			forwardError(request, response, "Reason for leave is required.");
			return;
		}

		Leave leave = new Leave();
		leave.setEmployeeId(employeeId);
		leave.setLeaveType(leaveType);
		leave.setFromDate(fromDate);
		leave.setToDate(toDate);
		leave.setReason(reason);

		LeaveDAO dao = new LeaveDAO();

		// Check if the employee exists before trying to insert
		if (dao.employeeExists(employeeId)) {
			if (dao.insertLeave(leave)) {
				response.sendRedirect("leaveForm"); // Redirect back to view after success
			} else {
				forwardError(request, response, "Failed to submit leave request.");
			}
		} else {
			// Employee does not exist
			forwardError(request, response, "Invalid Employee ID.");
		}

	}

	private void forwardError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
			throws ServletException, IOException {
		request.setAttribute("errorMessage", errorMessage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("leave/error.jsp");
		dispatcher.forward(request, response);
	}
}
