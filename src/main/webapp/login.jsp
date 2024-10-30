<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <div class="Page">
        <div class="PageProduct">
            <div class="Image"></div> <!-- Side image -->
            <div class="Column">
                <form action="login" method="post"> <!-- Form begins here -->
                    <div class="Body">
                        <div class="Title">Sign in</div>
                        <div class="Text">to access People</div>
                    </div>

                    <!-- Display error message if it exists -->
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div style="color: red; margin-bottom: 10px;">
                        <%= errorMessage %>
                    </div>
                    <%
                        }
                    %>

                    <div class="Fields">
                        <div class="SelectField">
                            <div class="Label">User Name</div>
                            <input type="text" name="username" class="Select" placeholder="Enter your username" required />
                        </div>
                        <div class="SelectField">
                            <div class="Label">Password</div>
                            <input type="password" name="password" class="Select" placeholder="Enter your password" required />
                        </div>
                    </div>
                    <button type="submit" class="Button">Sign in</button> <!-- Change to button element -->
                </form> <!-- Form ends here -->
            </div>
        </div>
    </div>
</body>
</html>
