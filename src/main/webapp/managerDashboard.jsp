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
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome for icons -->
   	<link rel="stylesheet" href="css/managerDashboard.css">
</head>
<body>
    <header>
        <h1>Welcome, <%= username %>!</h1> 
  
    </header>

    <nav>
       	<a href="managerDashboard.jsp">Dashboard</a>
        <a href="listEmployees">Manage Employees</a>
        <a href="tasks">Manage Tasks</a>
        <a href="managerLeave">Manage Leaves</a>
        <a href="salary">Manage Salaries</a>
        <a href="logout">Logout</a>
    </nav>

    <section>
        <div class="section-container">
            <!-- Employee Management Card -->
            <div class="feature-card">
                <i class="fas fa-users feature-icon"></i>
                <h3>Manage Employees</h3>
                <p>View, add, edit, and delete employee details.</p>
                <a href="empDetails/createEmployee.jsp" class="manage-button">Add Employee</a>
                <a href="listEmployees" class="manage-button">View Employees</a>
            </div>

            <!-- Task Management Card -->
            <div class="feature-card">
                <i class="fas fa-tasks feature-icon"></i>
                <h3>Manage Tasks</h3>
                <p>Assign tasks, update status, and view all tasks.</p>
                <a href="tasks" class="manage-button">Manage Now</a>
            </div>

            <!-- Leave Management Card -->
            <div class="feature-card">
                <i class="fas fa-calendar-alt feature-icon"></i>
                <h3>Manage Leaves</h3>
                <p>View and approve employee leave requests.</p>
                <a href="managerLeave" class="manage-button">Manage Now</a>
            </div>

            <!-- Salary Management Card -->
            <div class="feature-card">
                <i class="fas fa-dollar-sign feature-icon"></i>
                <h3>Manage Salaries</h3>
                <p>View, add, edit, and delete salary details.</p>
                <a href="salary" class="manage-button">Manage Now</a>
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
