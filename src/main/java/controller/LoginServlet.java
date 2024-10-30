package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDBUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username"); // Used for user login
		String password = request.getParameter("password");
		System.out.println("Employee ID set in session: " + username);

		// First try to authenticate from the 'user' table
		String role = UserDBUtil.authenticateUser(username, password);

		if (role != null) {
			// If authenticated as a user (manager or regular user), store in session
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("role", role);

			if (role.equals("manager")) {
				response.sendRedirect("managerDashboard.jsp");
			} else {
				response.sendRedirect("employeeDashboard.jsp");
			}
		} else {

			request.setAttribute("errorMessage", "Invalid credentials, please try again.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
