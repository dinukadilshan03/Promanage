package leave.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import leave.model.Leave;
import leave.model.LeaveDAO;

@WebServlet("/updateLeave")
public class UpdateFormServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve parameters
		String idParam = request.getParameter("id");
		String employeeId = request.getParameter("employeeId"); // Assuming you pass this from the form
		String leaveType = request.getParameter("leaveType");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String reason = request.getParameter("reason");

		// Debugging output
		System.out.println("Received ID: " + idParam);
		System.out.println("Received Employee ID: " + employeeId);
		System.out.println("Received Leave Type: " + leaveType);
		System.out.println("Received From Date: " + fromDate);
		System.out.println("Received To Date: " + toDate);
		System.out.println("Received Reason: " + reason);

		// Validate parameters
		if (idParam == null || employeeId == null || leaveType == null || fromDate == null || toDate == null
				|| reason == null) {
			response.sendRedirect("leave/error.jsp"); // Redirect if any parameter is missing
			return;
		}

		// Parse ID parameter
		int id;
		try {
			id = Integer.parseInt(idParam);
		} catch (NumberFormatException e) {
			response.sendRedirect("leave/error.jsp"); // Redirect if ID is not a valid number
			return;
		}

		// Create Leave object and set parameters
		Leave leave = new Leave();
		leave.setId(id);
		leave.setEmployeeId(employeeId); // Make sure you set this from the form
		leave.setLeaveType(leaveType);
		leave.setFromDate(fromDate);
		leave.setToDate(toDate);
		leave.setReason(reason);

		// Update leave record in database
		LeaveDAO dao = new LeaveDAO();
		if (dao.updateLeave(leave)) {
			response.sendRedirect("leave/update_success.jsp"); // Redirect on successful update
		} else {
			response.sendRedirect("leave/error.jsp"); // Redirect if update fails
		}
	}
}