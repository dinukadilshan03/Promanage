<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Employee</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .form-container {
        	width:100%;
            max-width: 600px;
            margin: 0 auto;
            flex-grow: 1;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Header styling */
        header {
            background-color: #002366; /* Dark blue color */
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-family: Arial, sans-serif;
            width: 100%; /* Ensure full width */
            box-sizing: border-box; /* Include padding in width calculation */
        }

        /* Nav styling */
        nav {
            background-color: #004080; /* Slightly lighter blue */
            text-align: center;
            padding: 10px 0;
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: white; /* White text for contrast */
            margin: 0 15px;
            font-size: 18px;
            font-family: Arial, sans-serif;
        }

        nav a:hover {
            color: #ADD8E6; /* Light blue on hover */
        }

        /* Footer styling - same as header */
        footer {
            background-color: #002366; /* Dark blue color (same as header) */
            color: white;
            text-align: center;
            padding: 10px 0;
            font-family: Arial, sans-serif;
            width: 100%;
            margin-top: auto; /* Pushes the footer to the bottom */
            box-sizing: border-box;
        }

        footer p {
            margin: 5px 0;
        }

        footer div a {
            text-decoration: none;
            color: white; /* White text for contrast */
            margin: 0 10px;
        }

        footer div a:hover {
            color: #ADD8E6; /* Light blue on hover */
        }
    </style>
    
    <!-- JavaScript for validation -->
    <script>
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById("phoneNumber").value;
            var phoneNumberPattern = /^\d{10}$/;
            if (!phoneNumberPattern.test(phoneNumber)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }
            return true;
        }

        function validateName() {
            var name = document.getElementById("name").value;
            var namePattern = /^[A-Za-z\s]+$/; // Allows only letters and spaces
            if (!namePattern.test(name)) {
                alert("Name cannot contain any numbers.");
                return false;
            }
            return true;
        }

        function validateAddress() {
            var address = document.getElementById("address").value;
            if (address.length < 5) {
                alert("Address must be at least 5 characters long.");
                return false;
            }
            return true;
        }

        function validateForm() {
            return validateName() && validatePhoneNumber() && validateAddress();
        }

        function showUpdateAlert() {
            alert("Employee updated successfully!");
        }
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
    <div class="form-container">
        <h2>Edit Employee</h2>
        <form action="updateEmployee" method="post" onsubmit="return validateForm() && showUpdateAlert()">
            <input type="hidden" name="id" value="${employee.id}">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${employee.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${employee.email}" required>
            </div>
            <div class="form-group">
                <label for="type">Employee Type:</label>
                <select id="type" name="type" class="form-control" required>
                    <option value="Full-time" ${employee.type == 'Full-time' ? 'selected' : ''}>Full-time</option>
                    <option value="Part-time" ${employee.type == 'Part-time' ? 'selected' : ''}>Part-time</option>
                    <option value="Contract" ${employee.type == 'Contract' ? 'selected' : ''}>Contract</option>
                </select>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select id="department" name="department" class="form-control" required>
                    <option value="IT" ${employee.department == 'IT' ? 'selected' : ''}>IT</option>
                    <option value="HR" ${employee.department == 'HR' ? 'selected' : ''}>HR</option>
                    <option value="Admin" ${employee.department == 'Admin' ? 'selected' : ''}>Admin</option>
                    <option value="Accounting" ${employee.department == 'Accounting' ? 'selected' : ''}>Accounting</option>
                    <option value="Marketing" ${employee.department == 'Marketing' ? 'selected' : ''}>Marketing</option>
                </select>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" value="${employee.phoneNumber}" required >
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" class="form-control" required>${employee.address}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>

        <br>
        <a href="managerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <footer>
        <p>&copy; 2024 ProManage. All Rights Reserved.</p>
        <div>
            <a href="#">Facebook</a> 
            <a href="#">Twitter</a> 
            <a href="#">Instagram</a>
        </div>
    </footer>
</body>
</html>
