<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="empDetails.model.Employee"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employee Profile</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Internal CSS -->
    <style>
        html, body {
            height: 100%; /* Ensures body takes up full height */
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column; /* Makes the body a column layout */
            background-color: #f1f1f1; /* Light background */
        }

        header, footer {
            flex-shrink: 0; /* Prevents the header and footer from shrinking */
        }

        main {
            flex-grow: 1; /* Main section grows to take up remaining space */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .profile-container {
    width: 50%; /* Widened to 90% of the page width */
    margin: auto;
    padding: 30px;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
    background-color: #ffffff;
}


        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .profile-detail {
            margin-bottom: 15px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .back-btn {
            margin-top: 20px;
            text-align: center;
        }

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

        footer {
            background-color: #002366;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-family: Arial, sans-serif;
            width: 100%;
            box-sizing: border-box;
            margin-top: auto; /* Pushes the footer to the bottom */
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
</head>
<body>

    <header>
        ProManage - Employee Management System
    </header>

    <nav>
        <a href="employeeDashboard.jsp">Dashboard</a> 
        <a href="logout">Logout</a>
    </nav>

    <main>
        <div class="profile-container">
            <c:choose>
                <c:when test="${not empty employee}">
                    <h1>Employee Profile</h1>
                    <div class="profile-detail">
                        <strong>Name:</strong> ${employee.name}
                    </div>
                    <div class="profile-detail">
                        <strong>Email:</strong> ${employee.email}
                    </div>
                    <div class="profile-detail">
                        <strong>Employee Type:</strong> ${employee.type}
                    </div>
                    <div class="profile-detail">
                        <strong>Department:</strong> ${employee.department}
                    </div>
                    <div class="profile-detail">
                        <strong>Phone Number:</strong> ${employee.phoneNumber}
                    </div>
                    <div class="profile-detail">
                        <strong>Address:</strong> ${employee.address}
                    </div>
                    <div class="back-btn">
                        <a href="employeeDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-danger text-center">No employee details available. Please log in again.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

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
