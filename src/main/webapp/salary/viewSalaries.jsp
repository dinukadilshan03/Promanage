<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Salaries</title>
    <link rel="stylesheet" type="text/css" href="./salary/css/styles.css">
    <style>
        /* Header styles */
        header {
            background-color: #191970; /* Dark blue color */
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            position: relative;
        }

        /* Navigation bar styles */
        nav {
            background-color: #202092; /* Set background color for nav */
            padding: 10px 0;
            text-align: center;
        }

        nav a {
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin: 0 10px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Footer styles */
        footer {
            background-color: #191970; /* Same as header */
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 300px;
        }

        .footer-icons {
            margin-top: 10px;
        }

        .footer-icons a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            font-size: 18px;
        }

        .footer-icons a:hover {
            color: #ff6f61; /* Change color on hover */
        }

        /* Container styling */
        #container {
            width: 90%; /* Set width of the container */
            max-width: 1200px; /* Maximum width to prevent excessive stretching */
            margin: 0 auto; /* Center the container */
            padding: 20px;
        }

        /* Table styling for wider layout */
        #salary-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f9f9f9;
            font-size: 16px;
        }

        #salary-table th, #salary-table td {
            padding: 12px 20px;
            border: 1px solid #ddd;
            text-align: center;
            white-space: nowrap; /* Prevent text wrapping */
        }

        #salary-table th {
            background-color: #003366;
            color: white;
        }

        #salary-table tr {
            transition: background-color 0.3s;
        }

        #salary-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #salary-table tr:hover {
            background-color: #e1e1e1;
        }

        /* Individual column width adjustments */
        #salary-table th:nth-child(1), 
        #salary-table td:nth-child(1) {
            width: 10%; /* Salary ID */
        }

        #salary-table th:nth-child(2), 
        #salary-table td:nth-child(2) {
            width: 12%; /* User ID */
        }

        #salary-table th:nth-child(3), 
        #salary-table td:nth-child(3) {
            width: 15%; /* User Name */
        }

        #salary-table th:nth-child(4), 
        #salary-table td:nth-child(4) {
            width: 15%; /* Base Salary */
        }

        #salary-table th:nth-child(5), 
        #salary-table td:nth-child(5) {
            width: 12%; /* Deductions */
        }

        #salary-table th:nth-child(6), 
        #salary-table td:nth-child(6) {
            width: 12%; /* Allowances */
        }

        #salary-table th:nth-child(7), 
        #salary-table td:nth-child(7) {
            width: 15%; /* Salary Amount */
        }

        #salary-table th:nth-child(8), 
        #salary-table td:nth-child(8) {
            width: 12%; /* Date Issued */
        }

        #salary-table th:nth-child(9), 
        #salary-table td:nth-child(9) {
            width: 15%; /* Actions */
        }

        /* Additional button styles */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .bttn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .bttn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        ProManage - Employee Management System
    </header>

    <nav>
    	
    	<a href="managerDashboard.jsp">Dashboard</a>
    	<a href="logout">Logout</a>
	</nav>
    
    <div id="container">
        <h2 align="center">Salary List</h2>
        <table>
    <tr>
        <th>Salary ID</th>
        <th>User ID</th>
        <th>User Name</th>
        <th>Base Salary</th>
        <th>Deductions</th>
        <th>Allowances</th>
        <th>Total Salary</th>
     
        <th>Actions</th>
    </tr>
    <c:forEach var="salary" items="${salaryList}">
        <tr>
            <td>${salary.salaryId}</td>
            <td>${salary.userId}</td>
            <td>${salary.userName}</td>
            <td><fmt:formatNumber value="${salary.baseSalary}" pattern="Rs ,##0.00" /></td>
            <td><fmt:formatNumber value="${salary.deductions}" pattern="Rs ,##0.00" /></td>
            <td><fmt:formatNumber value="${salary.allowances}" pattern="Rs ,##0.00" /></td>
            <td><fmt:formatNumber value="${salary.salaryAmount}" pattern="Rs ,##0.00" /></td>
            
            <td>
                <a href="salary?action=EDIT&salaryId=${salary.salaryId}">Edit</a> |
                <a href="salary?action=DELETE&salaryId=${salary.salaryId}" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>


    </div>
    
    <br>
    <div class="button-container">
        <a href="salary?action=ADD" class="bttn">Add New Salary</a>
    </div>
    
    <footer>
        <p>&copy; 2024 ProManage. All Rights Reserved.</p>
        <div class="footer-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>
</body>
</html>
