<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Salary</title>
    <link rel="stylesheet" type="text/css" href="./salary/css/styles.css">
    <style>
        /* Same styles as before */
        header {
            background-color: #191970; /* Dark blue color */
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            position: relative;
        }

        nav {
            background-color: #202092;
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
            background-color: #0056b3;
        }

        footer {
            background-color: #191970;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            position: relative;
            bottom: 0;
            width: 100%;
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
            color: #ff6f61;
        }

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

        input[type="text"],
        select,
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            font-size: 16px;
            color: #333;
            transition: border-color 0.3s;
            margin-bottom: 10px;
        }

        input[type="text"]:focus,
        select:focus,
        input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }
    </style>
    <script>
        // Function to validate that Date Issued is today or in the past
        function validateDateIssued() {
            const dateIssuedInput = document.querySelector('input[name="dateIssued"]');
            const dateIssued = new Date(dateIssuedInput.value);
            const today = new Date();
            
            // Set time to 0:00:00 for both dates to compare only the date part
            today.setHours(0, 0, 0, 0);
            dateIssued.setHours(0, 0, 0, 0);

            if (dateIssued > today) {
                alert("Date Issued cannot be in the future. Please select today or a past date.");
                return false;
            }
            return true;
        }

        // Attach validation function to form submission
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.querySelector('form');
            form.addEventListener('submit', function (event) {
                if (!validateDateIssued()) {
                    event.preventDefault(); // Prevent form submission if validation fails
                }
            });
        });

        // Validation function to allow only numerical input
        function validateNumberInput(event) {
            const inputField = event.target;
            const value = inputField.value;

            // Regular expression for only numbers, decimal allowed
            const isValid = /^\d*\.?\d*$/.test(value);

            if (!isValid) {
                inputField.setCustomValidity("Please enter a valid numerical value.");
            } else {
                inputField.setCustomValidity("");
            }
        }

        // Attach event listeners to numerical fields on DOM content load
        document.addEventListener('DOMContentLoaded', function () {
            const baseSalaryField = document.querySelector('input[name="baseSalary"]');
            const deductionsField = document.querySelector('input[name="deductions"]');
            const allowancesField = document.querySelector('input[name="allowances"]');

            baseSalaryField.addEventListener('input', validateNumberInput);
            deductionsField.addEventListener('input', validateNumberInput);
            allowancesField.addEventListener('input', validateNumberInput);
        });
    </script>
</head>
<body>
    <header>
        ProManage - Employee Management System
    </header>

    <nav>
        <a href="managerDashboard.jsp">Dashboard</a>
        <a href="logout">Logout</a>
    </nav>

    <div id="addsalary">
        <h2>Add Salary</h2>
        <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>
        
        <form action="salary?action=ADD" method="post">
            <label>User Name:</label>
            <select name="userName" required>
                <option value="">Select User</option>
                <c:forEach var="user" items="${availableUsers}">
                    <option value="${user}">${user}</option>
                </c:forEach>
            </select><br>

            <label>Base Salary:</label>
            <input type="text" name="baseSalary" required><br>
            <label>Deductions:</label>
            <input type="text" name="deductions" required><br>
            <label>Allowances:</label>
            <input type="text" name="allowances" required><br>
            <label>Date Issued:</label>
            <input type="date" name="dateIssued" required><br>
            <input class="bttn" type="submit" value="Add Salary">
        </form>
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
