<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create Employee</title>
    
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
            width: 100%;
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
            background-color: #002366;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-family: Arial, sans-serif;
            width: 100%;
            box-sizing: border-box;
        }

        /* Nav styling */
        nav {
            background-color: #004080;
            text-align: center;
            padding: 10px 0;
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: white;
            margin: 0 15px;
            font-size: 18px;
            font-family: Arial, sans-serif;
        }

        nav a:hover {
            color: #ADD8E6;
        }

        /* Footer styling */
        footer {
            background-color: #002366;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-family: Arial, sans-serif;
            width: 100%;
            margin-top: auto;
            box-sizing: border-box;
        }

        footer p {
            margin: 5px 0;
        }

        footer div a {
            text-decoration: none;
            color: white;
            margin: 0 10px;
        }

        footer div a:hover {
            color: #ADD8E6;
        }
    </style>

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
        function validateForm() {
            var address = document.getElementById("address").value;
            if (address.length < 5) {
                alert("Address must be at least 5 characters long.");
                return false;
            }
            return validateName() && validatePhoneNumber();
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
        <h2>Create New Employee</h2>

        <!-- Display error message if name already exists -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>

        <form action="<c:url value='/createEmployee' />" method="post" onsubmit="return validatePhoneNumber() && validateForm() && validateName()">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="${param.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="${param.email}" required>
            </div>
            <div class="form-group">
                <label for="type">Employee Type:</label>
                <select id="type" name="type" class="form-control" required>
                    <option disabled ${empty param.type ? 'selected' : ''}>Select Employee Type</option>
                    <option value="Full-time" ${param.type == 'Full-time' ? 'selected' : ''}>Full-time</option>
                    <option value="Part-time" ${param.type == 'Part-time' ? 'selected' : ''}>Part-time</option>
                    <option value="Contract" ${param.type == 'Contract' ? 'selected' : ''}>Contract</option>
                </select>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <select id="department" name="department" class="form-control" required>
                    <option disabled ${empty param.department ? 'selected' : ''}>Select Department</option>
                    <option value="IT" ${param.department == 'IT' ? 'selected' : ''}>IT</option>
                    <option value="HR" ${param.department == 'HR' ? 'selected' : ''}>HR</option>
                    <option value="Admin" ${param.department == 'Admin' ? 'selected' : ''}>Admin</option>
                    <option value="Accounting" ${param.department == 'Accounting' ? 'selected' : ''}>Accounting</option>
                    <option value="Marketing" ${param.department == 'Marketing' ? 'selected' : ''}>Marketing</option>
                </select>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" value="${param.phoneNumber}" required>
            </div>
            <div class="form-group">
    			<label for="address">Address:</label>
    			<textarea id="address" name="address" class="form-control" required>${param.address}</textarea>
   				<small id="addressHelp" class="form-text text-muted">Address must be at least 5 characters long.</small>
			</div>

            <button type="submit" class="btn btn-primary">Create</button>
        </form>

        <br>
        <a href="managerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a><br><br>
    </div>

    <footer>
        <p>&copy; 2024 ProManage. All Rights Reserved.</p>
        <div>
            <a href="#">Facebook</a> 
            <a href="#">Twitter</a> 
            <a href="#">Instagram</a>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
