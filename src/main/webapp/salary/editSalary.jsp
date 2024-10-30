<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Salary</title>
    <link rel="stylesheet" type="text/css" href="./salary/css/styles.css">
    <script>
        function calculateTotalSalary() {
            var baseSalary = parseFloat(document.getElementById("baseSalary").value) || 0;
            var deductions = parseFloat(document.getElementById("deductions").value) || 0;
            var allowances = parseFloat(document.getElementById("allowances").value) || 0;

            var totalSalary = baseSalary - deductions + allowances;

            // Check if the total salary is less than 0
            if (totalSalary < 0) {
                alert("Total salary cannot be less than 0!");
                totalSalary = 0; // Reset to 0
            }

            document.getElementById("salaryAmount").value = totalSalary.toFixed(2);
        }

        // Function to validate the date and other fields before submission
        function validateForm() {
            var baseSalary = document.getElementById("baseSalary").value;
            var deductions = document.getElementById("deductions").value;
            var allowances = document.getElementById("allowances").value;
            var dateIssued = document.getElementById("dateIssued").value;
            var today = new Date().toISOString().split('T')[0]; // Get today's date in yyyy-mm-dd format

            // Ensure all fields contain numerical values
            if (isNaN(baseSalary) || isNaN(deductions) || isNaN(allowances)) {
                alert("Please enter valid numerical values for Base Salary, Deductions, and Allowances.");
                return false;
            }

            // Additional checks
            if (parseFloat(baseSalary) < 0) {
                alert("Base Salary cannot be less than 0.");
                return false;
            }
            if (parseFloat(deductions) < 0) {
                alert("Deductions cannot be less than 0.");
                return false;
            }
            if (parseFloat(allowances) < 0) {
                alert("Allowances cannot be less than 0.");
                return false;
            }

            // Ensure that the date issued is not in the future
            if (dateIssued > today) {
                alert("Date Issued cannot be in the future.");
                return false;
            }

            return true;
        }
    </script>
    <style>
        /* Styles unchanged */
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
    </style>
</head>
<body>
    <header>
        ProManage - Employee Management System
    </header>

    <nav>
        <a href="managerDashboard.jsp">Dashboard</a>
        <a href="../logout">Logout</a>
    </nav>

    <div id="edit-salary">
        <h2>Edit Salary</h2>
        <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>

        <form action="salary?action=EDIT" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="salaryId" value="${salary.salaryId}">
            <label>User ID:</label>
            <input type="text" name="userId" value="${salary.userId}" readonly><br><br>
            <label>User Name:</label>
            <input type="text" name="userName" value="${salary.userName}" readonly><br><br>
            <label>Base Salary:</label>
            <input type="number" id="baseSalary" name="baseSalary" value="${salary.baseSalary}" oninput="calculateTotalSalary()" min="0" required><br><br>
            <label>Deductions:</label>
            <input type="number" id="deductions" name="deductions" value="${salary.deductions}" oninput="calculateTotalSalary()" min="0" required><br><br>
            <label>Allowances:</label>
            <input type="number" id="allowances" name="allowances" value="${salary.allowances}" oninput="calculateTotalSalary()" min="0" required><br><br>
            <label>Total Salary:</label>
            <input type="text" id="salaryAmount" name="salaryAmount" value="${salary.salaryAmount}" readonly><br><br>
            <label>Date Issued:</label>
            <input type="date" id="dateIssued" name="dateIssued" value="${salary.dateIssued}" required><br><br>
            <input type="submit" value="Update Salary">
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
