<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="leave.model.Leave" %>
<%@ page import="leave.model.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Leave Requests</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        header {
            background-color: #34495e;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            font-size: 24px;
            font-weight: bold;
        }
        
        nav {
            background-color: #2c3e50;
            padding: 10px;
            text-align: center;
        }
        
        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            font-weight: bold;
        }
        
        nav a:hover {
            color: #f1c40f;
            text-decoration: underline;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        
        .employee-details {
            font-size: 18px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2980b9;
            color: #fff;
            font-size: 18px;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .action-btn {
            background: none;
            border: 2px solid #27ae60; /* Green for Update button */
            border-radius: 5px;
            color: #27ae60; /* Green for Update button */
            padding: 8px 12px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s, color 0.2s;
        }

        .action-btn:hover {
            background-color: #27ae60; /* Darker green on hover */
            color: #fff; /* White text on hover */
        }

        .delete-btn {
            background: none;
            border: 2px solid #e74c3c; /* Red for Delete button */
            border-radius: 5px;
            color: #e74c3c; /* Red for Delete button */
            padding: 8px 12px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s, color 0.2s;
        }

        .delete-btn:hover {
            background-color: #e74c3c; /* Darker red on hover */
            color: #fff; /* White text on hover */
        }

        .new-leave-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2980b9;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            transition: background-color 0.2s;
        }

        .new-leave-btn:hover {
            background-color: #1c598a;
        }

        footer {
            background-color: #34495e;
            padding: 10px;
            text-align: center;
            color: #fff;
            margin-top: 20px;
        }
        
        footer p {
            margin: 10px 0;
        }

        .footer-icons a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
            font-size: 24px;
        }

        .footer-icons a:hover {
            color: #f1c40f;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this leave request?");
        }

        function validateForm(form) {
            const fromDate = new Date(form.fromDate.value);
            const toDate = new Date(form.toDate.value);
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Set time to midnight for accurate comparison

            // Check if fromDate is in the past
            if (fromDate < today) {
                alert("The 'From' date cannot be in the past.");
                return false;
            }

            // Check if toDate is later than fromDate
            if (toDate <= fromDate) {
                alert("The 'To' date must be later than the 'From' date.");
                return false;
            }

            // Check if leave type is selected
            const leaveType = form.leaveType.value;
            if (leaveType === "") {
                alert("Please select a Leave Type.");
                return false;
            }

            // Check if reason is provided
            const reason = form.reason.value.trim();
            if (reason === "") {
                alert("Please provide a reason for your leave.");
                return false;
            }

            
            if (reason.length < 10) {
                alert("Error: Reason must be at least 10 characters long.");
                return false;
            }
            

            return true; // All validations passed
        }
    </script>
</head>
<body>
    <header>
        ProManage - Employee Management System
    </header>
    
    <nav>
        <a href="employeeDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <div class="container">
        <%
            Employee employee = (Employee) request.getAttribute("employee");
            List<Leave> leaves = (List<Leave>) request.getAttribute("leaves");

            if (employee != null) {
        %>
            <p class="employee-details">Employee ID: <%= employee.getEmployeeId() %></p>

            <table class="leave-table">
                <thead>
                    <tr>
                        <th>Leave Type</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (leaves != null && !leaves.isEmpty()) {
                        for (Leave leave : leaves) {
                %>
                <tr>
                    <td>
                        <% if (!"Rejected".equals(leave.getStatus()) && !"Approved".equals(leave.getStatus())) { %>
                            <form action="updateLeave" method="post" onsubmit="return validateForm(this);" style="display:inline;">
                                <input type="hidden" name="id" value="<%= leave.getId() %>">
                                <input type="hidden" name="employeeId" value="<%= leave.getEmployeeId() %>">
                                <select name="leaveType" id="leaveType" required>
                                    <option value="">Select Leave Type</option>
                                    <option value="Sick Leave" <%= leave.getLeaveType().equals("Sick Leave") ? "selected" : "" %>>Sick Leave</option>
                                    <option value="Casual Leave" <%= leave.getLeaveType().equals("Casual Leave") ? "selected" : "" %>>Casual Leave</option>
                                    <option value="Paid Leave" <%= leave.getLeaveType().equals("Paid Leave") ? "selected" : "" %>>Paid Leave</option>
                                    <option value="Maternity Leave" <%= leave.getLeaveType().equals("Maternity Leave") ? "selected" : "" %>>Maternity Leave</option>
                                    <option value="Paternity Leave" <%= leave.getLeaveType().equals("Paternity Leave") ? "selected" : "" %>>Paternity Leave</option>
                                    <option value="Bereavement Leave" <%= leave.getLeaveType().equals("Bereavement Leave") ? "selected" : "" %>>Bereavement Leave</option>
                                    <option value="Study Leave" <%= leave.getLeaveType().equals("Study Leave") ? "selected" : "" %>>Study Leave</option>
                                    <option value="Sabbatical Leave" <%= leave.getLeaveType().equals("Sabbatical Leave") ? "selected" : "" %>>Sabbatical Leave</option>
                                    <option value="Unpaid Leave" <%= leave.getLeaveType().equals("Unpaid Leave") ? "selected" : "" %>>Unpaid Leave</option>
                                    <option value="Other" <%= leave.getLeaveType().equals("Other") ? "selected" : "" %>>Other</option>
                                </select>
                        <% } else { %>
                            <span><%= leave.getLeaveType() %></span>
                        <% } %>
                    </td>
                    <td>
                        <% if (!"Rejected".equals(leave.getStatus()) && !"Approved".equals(leave.getStatus())) { %>
                            <input type="date" name="fromDate" value="<%= leave.getFromDate() %>" required>
                        <% } else { %>
                            <span><%= leave.getFromDate() %></span>
                        <% } %>
                    </td>
                    <td>
                        <% if (!"Rejected".equals(leave.getStatus()) && !"Approved".equals(leave.getStatus())) { %>
                            <input type="date" name="toDate" value="<%= leave.getToDate() %>" required>
                        <% } else { %>
                            <span><%= leave.getToDate() %></span>
                        <% } %>
                    </td>
                    <td>
                        <% if (!"Rejected".equals(leave.getStatus()) && !"Approved".equals(leave.getStatus())) { %>
                            <textarea name="reason" rows="2" required><%= leave.getReason() %></textarea>
                        <% } else { %>
                            <span><%= leave.getReason() %></span>
                        <% } %>
                    </td>
                    <td><%= leave.getStatus() %></td>
                    <td>
                        <% if (!"Rejected".equals(leave.getStatus()) && !"Approved".equals(leave.getStatus())) { %>
                            <input type="submit" value="Update" class="action-btn">
                            </form>
                        <% } else { %>
                            <span style="color: red;">Leave request <%= leave.getStatus() %></span>
                        <% } %>
                        <form action="deleteLeave" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                            <input type="hidden" name="id" value="<%= leave.getId() %>">
                            <input type="submit" value="Delete" class="delete-btn">
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                        out.println("<tr><td colspan='6'>No leave requests found.</td></tr>");
                    }
                %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p>No employee details found.</p>
        <%
            }
        %>

        <a href="leave/leaveForm.jsp" class="new-leave-btn">Create New Leave Request</a>
    </div>

    <footer>
        <p>&copy; 2024 ProManage - All Rights Reserved</p>
        <div class="footer-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </footer>
</body>
</html>
