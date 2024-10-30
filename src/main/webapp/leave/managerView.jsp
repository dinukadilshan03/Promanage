<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="leave.model.Leave" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Leave Requests</title>
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
        
        h2 {
            text-align: center;
            color: #2980b9;
            margin-bottom: 30px;
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

        /* New styles for buttons */
        .action-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin: 0 5px;
            padding: 10px 15px;
            position: relative;
            color: #fff;
            font-weight: bold;
            transition: transform 0.2s;
        }

        .approve-btn {
            color: #2ecc71;
            border: 2px solid #2ecc71;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .approve-btn:hover {
            background-color: #2ecc71;
            color: #fff;
            transform: translateY(-2px);
        }

        .reject-btn {
            color: #e74c3c;
            border: 2px solid #e74c3c;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .reject-btn:hover {
            background-color: #e74c3c;
            color: #fff;
            transform: translateY(-2px);
        }

        .footer {
            background-color: #34495e;
            padding: 10px;
            text-align: center;
            color: #fff;
        }
        
        .footer p {
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

        .leave-table .fa-check-circle {
            color: #2ecc71;
        }

        .leave-table .fa-times-circle {
            color: #e74c3c;
        }

        .leave-table .fa-calendar-alt {
            color: #f39c12;
        }

    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
        function confirmAction(action) {
            return confirm("Are you sure you want to " + action + " this leave request?");
        }
    </script>
</head>
<body>

<header>
    ProManage - Employee Management System
</header>

<nav>
    <a href="managerDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</nav>

<div class="container">
    <h2><i class="fas fa-calendar-alt"></i> All Leave Requests</h2>

    <table class="leave-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
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
                List<Leave> leaves = (List<Leave>) request.getAttribute("leaves");
                if (leaves != null) {
                    for (Leave leave : leaves) {
            %>
            <tr>
                <td><%= leave.getId() %></td>
                <td><%= leave.getEmployeeId() %></td>
                <td><%= leave.getLeaveType() %></td>
                <td><%= leave.getFromDate() %></td>
                <td><%= leave.getToDate() %></td>
                <td><%= leave.getReason() %></td>
                <td>
                    <%= leave.getStatus().equals("Approved") 
                        ? "<i class='fas fa-check-circle'></i> Approved" 
                        : leave.getStatus().equals("Rejected") 
                        ? "<i class='fas fa-times-circle'></i> Rejected"
                        : leave.getStatus().equals("finished")
                        ? "<i class='fas fa-check-circle'></i> Finished"
                        : "Pending"
                    %>
                </td>
                <td>
                    <% if ("finished".equals(leave.getStatus())) { %>
                        <div style="color: red; font-size: smaller;">(Cannot edit because task is finished)</div>
                    <% } else { %>
                        <!-- Form to update leave status -->
                        <form action="<c:url value='/managerLeave' />" method="post" style="display:inline-block;">
                            <input type="hidden" name="id" value="<%= leave.getId() %>">
                            <button type="submit" class="action-btn approve-btn" name="status" value="Approved" onclick="return confirmAction('approve');">
                                <i class="fas fa-check-circle"></i> Approve
                            </button>
                            <button type="submit" class="action-btn reject-btn" name="status" value="Rejected" onclick="return confirmAction('reject');">
                                <i class="fas fa-times-circle"></i> Reject
                            </button>
                        </form>
                    <% } %>
                </td>
            </tr>
            <%
                    }
                } else {
                    out.println("<tr><td colspan='8'>No leave requests found.</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

<footer class="footer">
    <p>&copy; 2024 ProManage. All Rights Reserved.</p>
    <div class="footer-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </div>
</footer>

</body>
</html>
