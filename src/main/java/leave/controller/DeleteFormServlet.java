package leave.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import leave.model.LeaveDAO;

@WebServlet("/deleteLeave")
public class DeleteFormServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		LeaveDAO dao = new LeaveDAO();
		if (dao.deleteLeave(id)) {
			response.sendRedirect("leave/delete_success.jsp");
		} else {
			response.sendRedirect("leave/error.jsp");
		}
	}
}
