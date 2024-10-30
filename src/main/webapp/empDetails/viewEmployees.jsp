<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Employees</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            display: flex; /* Enable flexbox layout */
            flex-direction: column; /* Arrange items vertically */
            min-height: 100vh; /* Ensure full height of the viewport */
            margin: 0; /* Remove default margin */
        }

        main {
            flex: 1; /* Allow main content to grow and fill the space */
        }

        table {
            width: 100%; /* Full width for responsiveness */
            margin: 0 auto; /* Center the table */
            font-size: 0.9rem; /* Slightly smaller font size */
        }

        th, td {
            padding: 8px; /* Reduce padding inside table cells */
            text-align: center; /* Center text in table cells */
        }

        .btn-edit {
            background-color: #007bff; /* Blue color */
            color: white;
            border: none;
        }

        .btn-delete {
            background-color: red;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1; /* Row hover effect */
        }
        
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
    <!-- JavaScript for Delete Confirmation -->
    <script>
        function confirmDelete(employeeId) {
            if (confirm("Are you sure you want to delete this employee?")) {
                window.location.href = "deleteEmployee?id=" + employeeId;
            }
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

    <main class="container mt-4">
        <h2 class="mb-4">Employee List</h2>
        <div class="table-responsive"> <!-- Make table responsive -->
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Type</th> 
                        <th>Department</th> 
                        <th>Phone Number</th> 
                        <th>Address</th> 
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.name}</td>
                            <td>${employee.email}</td>
                            <td>${employee.type}</td> 
                            <td>${employee.department}</td> 
                            <td>${employee.phoneNumber}</td>
                            <td>${employee.address}</td> 
                            <td>
                                <a href="updateEmployee?id=${employee.id}" class="btn btn-edit btn-sm">Edit</a>
                                <button onclick="confirmDelete(${employee.id})" class="btn btn-delete btn-sm">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="managerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </main>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
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
