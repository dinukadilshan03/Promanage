<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="task.model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="css/employeeDashboard.css"> <!-- External CSS -->
</head>
<body>
    <header>
        <h1>Welcome, <%= username %>!</h1>
    </header>

    <nav>
        <a href="employeeDashboard.jsp">Dashboard</a>
        <a href="viewProfile.jsp">View Profile</a>
        <a href="logout">Logout</a>
    </nav>

    <section>
        <div class="section-container">
            <!-- Profile Management Card -->
            <div class="feature-card">
                <i class="fas fa-user feature-icon"></i>
                <h3>View Profile</h3>
                <p>Check your personal information and update if necessary.</p>
                <a href="viewEmployeeProfile" class="manage-button">View Profile</a>
            </div>

            <!-- Task Management Card -->
            <div class="feature-card">
                <i class="fas fa-tasks feature-icon"></i>
                <h3>View Assigned Tasks</h3>
                <p>See the tasks assigned to you and their status.</p>
                <a href="myTasks" class="manage-button">View Tasks</a>
            </div>

            <!-- Leave Management Card -->
            <div class="feature-card">
                <i class="fas fa-calendar-alt feature-icon"></i>
                <h3>Leave Management</h3>
                <p>Request leave or view your leave status.</p>
                <div class="leave-buttons">
                    <a href="leave/leaveForm.jsp" class="manage-button">Request Leave</a>
                    <a href="leaveForm" class="manage-button">View Leaves</a>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Promanage. All rights reserved.</p>
        <div class="footer-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </footer>
</body>
</html>
