<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request Form</title>
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
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #2980b9;
        }

        .description-box, .rules-box {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="date"], input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
        }

        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check input {
            margin-right: 10px;
        }

        .submit-btn {
            background-color: #2980b9;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .submit-btn:hover {
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
        function validateDates() {
            const fromDateInput = document.getElementById("fromDate");
            const toDateInput = document.getElementById("toDate");
            
            const fromDate = new Date(fromDateInput.value);
            const toDate = new Date(toDateInput.value);
            
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Set time to midnight for accurate comparison

            // Check if fromDate is before today
            if (fromDate < today) {
                alert("Error: From Date cannot be before today's date.");
                fromDateInput.focus(); // Set focus to the input field
                return false;
            }

            // Check if fromDate is later than toDate
            if (fromDate > toDate) {
                alert("Error: From Date cannot be later than To Date.");
                toDateInput.focus(); // Set focus to the input field
                return false;
            }
            
            return true;
        }

        function validateForm() {
            const reason = document.getElementById("reason").value.trim();
            if (reason.length < 10) {
                alert("Error: Reason must be at least 10 characters long.");
                return false;
            }
            return validateDates();
        }
    </script>
</head>
<body>
    <!-- Header -->
    <header>
        ProManage - Employee Management System
    </header>

    <!-- Navigation -->
    <nav>
        <a href="../employeeDashboard.jsp">Dashboard</a>
        <a href="../leaveForm">View Leaves</a>
        <a href="../logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <div class="container">
        <h2>Leave Request Form</h2>

        <!-- Company Description -->
        <div class="description-box">
            <h3>Company Leave Policy</h3>
            <p>Before submitting a leave request, ensure you understand the following guidelines. Non-compliance may result in rejection of your leave request.</p>
        </div>

        <!-- Rules Section -->
        <div class="rules-box">
            <h4>Rules and Regulations:</h4>
            <ul>
                <li>Submit leave requests at least 5 working days in advance.</li>
                <li>Medical leave over 3 days requires a doctor's note.</li>
                <li>Vacation leave is subject to prior approval.</li>
                <li>Emergency leave requires appropriate documentation.</li>
            </ul>
        </div>

        <form action="<c:url value='/leaveForm' />" method="post" class="form-container" onsubmit="return validateForm()">

            <div class="form-group">
                <label for="employeeId"></label>
                <input type="hidden" name="employeeId" value="${sessionScope.username}">
            </div>
            <div class="form-group">
                <label for="leaveType">Leave Type</label>
                <select name="leaveType" id="leaveType" required>
                    <option value="">Select Leave Type</option>
                    <option value="Sick Leave">Sick Leave</option>
                    <option value="Casual Leave">Casual Leave</option>
                    <option value="Paid Leave">Paid Leave</option>
                    <option value="Maternity Leave">Maternity Leave</option>
                    <option value="Paternity Leave">Paternity Leave</option>
                    <option value="Bereavement Leave">Bereavement Leave</option>
                    <option value="Study Leave">Study Leave</option>
                    <option value="Sabbatical Leave">Sabbatical Leave</option>
                    <option value="Unpaid Leave">Unpaid Leave</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fromDate">From Date</label>
                <input type="date" name="fromDate" id="fromDate" required>
            </div>
            <div class="form-group">
                <label for="toDate">To Date</label>
                <input type="date" name="toDate" id="toDate" required>
            </div>
            <div class="form-group">
                <label for="reason">Reason</label>
                <textarea name="reason" id="reason" rows="4" required></textarea>
            </div>

            <!-- Agree to Rules -->
            <div class="form-group form-check">
                <input type="checkbox" name="agree_rules" id="agree_rules" required>
                <label for="agree_rules">I have read and agree to the company's rules and regulations</label>
            </div>

            <div class="form-group">
                <input type="submit" value="Submit" class="submit-btn">
            </div>
        </form>
    </div>

    <!-- Footer -->
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
