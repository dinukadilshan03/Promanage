package salary.controller;

import salary.model.Salary;
import salary.model.SalaryDBUtil;
import salary.model.UserDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/salary")
public class SalaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "LIST";
        }

        try {
            switch (action) {
                case "LIST":
                    listSalaries(request, response);
                    break;
                case "ADD":
                    showAddForm(request, response);
                    break;
                case "EDIT":
                    showEditForm(request, response);
                    break;
                case "DELETE":
                    deleteSalary(request, response);
                    break;
                default:
                    listSalaries(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("ADD".equals(action)) {
                addSalary(request, response);
            } else if ("EDIT".equals(action)) {
                updateSalary(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void listSalaries(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Salary> salaries = SalaryDBUtil.getAllSalaries();
        request.setAttribute("salaryList", salaries);
        request.getRequestDispatcher("salary/viewSalaries.jsp").forward(request, response);
    }

    

    private void addSalary(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userName = request.getParameter("userName");
        double baseSalary = Double.parseDouble(request.getParameter("baseSalary"));
        double deductions = Double.parseDouble(request.getParameter("deductions"));
        double allowances = Double.parseDouble(request.getParameter("allowances"));
        String dateIssued = request.getParameter("dateIssued");

        // Ensure no negative values
        if (deductions < 0.00 || allowances < 0.00) {
            request.setAttribute("errorMessage", "Deductions and Allowances cannot be less than 0.00");
            request.getRequestDispatcher("salary/addSalary.jsp").forward(request, response);
            return;
        }

        // Fetch user ID from the user name
        int userId = UserDBUtil.getUserIdByUsername(userName);
        if (userId == -1) {
            request.setAttribute("errorMessage", "Invalid User Name selected.");
            request.getRequestDispatcher("salary/addSalary.jsp").forward(request, response);
            return;
        }
        
        Salary newSalary = new Salary(userId, userName, baseSalary, deductions, allowances, dateIssued);
        SalaryDBUtil.addSalary(newSalary);

        response.sendRedirect("salary?action=LIST");
    }

    


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int salaryId = Integer.parseInt(request.getParameter("salaryId"));
        Salary existingSalary = SalaryDBUtil.getSalaryById(salaryId);
        request.setAttribute("salary", existingSalary);
        request.getRequestDispatcher("salary/editSalary.jsp").forward(request, response);
    }

    private void updateSalary(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int salaryId = Integer.parseInt(request.getParameter("salaryId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String userName = request.getParameter("userName");
        double baseSalary = Double.parseDouble(request.getParameter("baseSalary"));
        double deductions = Double.parseDouble(request.getParameter("deductions"));
        double allowances = Double.parseDouble(request.getParameter("allowances"));
        double salaryAmount = Double.parseDouble(request.getParameter("salaryAmount"));
        String dateIssued = request.getParameter("dateIssued");

      // Validation
        if (salaryAmount < 0.00) {
            request.setAttribute("errorMessage", "Salary cannot be less than 0.00");
            request.getRequestDispatcher("salary/editSalary.jsp").forward(request, response);
            return;
        }

        String existingUserName = UserDBUtil.getUserNameById(userId);
        if (existingUserName == null || !existingUserName.equals(userName)) {
            request.setAttribute("errorMessage", "User ID does not match the User Name.");
            request.getRequestDispatcher("salary/editSalary.jsp").forward(request, response);
            return;
        }
        
        Salary updatedSalary = new Salary(salaryId, userId, userName, baseSalary, deductions,allowances,salaryAmount, dateIssued);
        SalaryDBUtil.updateSalary(updatedSalary);

        response.sendRedirect("salary?action=LIST");
    }

    private void deleteSalary(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int salaryId = Integer.parseInt(request.getParameter("salaryId"));
        SalaryDBUtil.deleteSalary(salaryId);
        response.sendRedirect("salary?action=LIST");
    }
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch list of users who don't have an entry in the salary table
        List<String> availableUsers = UserDBUtil.getAvailableUsersForSalary();
        request.setAttribute("availableUsers", availableUsers);
        
        // Forward to the JSP page
        request.getRequestDispatcher("salary/addSalary.jsp").forward(request, response);
    }
    
}
