<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
<%@ page import="task.model.User"%>
<%@ page import="task.dao.UserDAO"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assign Task</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Reset default margin and padding */
body, h1, p, a, form {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

/* Body styling */
body {
	background-color: #e8f4fa;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* Header styling */
header {
	background-color: #003f7f;
	color: white;
	padding: 50px;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
}

/* Navigation bar styling */
nav {
	background-color: #0056a3;
	padding: 15px;
	text-align: center;
}

nav a {
	color: white;
	text-decoration: none;
	margin: 0 15px;
	font-size: 18px;
	transition: color 0.3s;
}

nav a:hover {
	color: #cce4ff;
}

/* Main heading styling */
h1 {
	text-align: center;
	color: #003366;
	margin-top: 30px;
}

.container {
	margin: 20px auto;
	width: 90%;
	max-width: 800px;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

/* Form elements styling */
.form-group {
	margin-bottom: 25px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-size: 18px;
	color: #0056a3;
}

.form-control {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	transition: border-color 0.3s;
}

.form-control:focus {
	border-color: #0056a3;
	outline: none;
}

.btn-custom {
	background-color: #0056a3;
	color: white;
	border: none;
	padding: 15px 25px;
	font-size: 18px;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.btn-custom:hover {
	background-color: #003f7f;
}

/* Footer styling */
footer {
	background-color: #003f7f;
	color: white;
	padding: 15px;
	text-align: center;
	margin-top: auto;
}

.footer-icons a {
	text-decoration: none;
	color: white;
	padding: 5px;
	transition: transform 0.2s;
}

.footer-icons a:hover {
	color: #cce4ff;
	transform: scale(1.1);
}

.footer-icons i {
	font-size: 20px;
	margin: 0 10px;
}
</style>
<script>
	function validateForm() {
		const taskName = document.forms["taskForm"]["taskName"].value;
		const description = document.forms["taskForm"]["description"].value;
		const deadlineStr = document.forms["taskForm"]["deadline"].value;
		const currentDate = new Date();

		// Task name validation
		if (taskName.length < 3) {
			alert("Task Name must be at least 3 characters long.");
			return false;
		}

		// Description validation
		if (description.length < 10) {
			alert("Description must be at least 10 characters long.");
			return false;
		}

		// Parsing the deadline from the string input to a Date object
		const deadline = new Date(deadlineStr);

		// Checking if the deadline is in the future
		if (deadline <= currentDate) {
			alert("Deadline must be in the future.");
			return false;
		}

		return true;
	}
</script>
</head>

<body>
	<header> ProManage - Employee Management System </header>

	<nav>
		<a href="../managerDashboard.jsp"><i class="bi bi-grid"></i>Dashboard</a>
		<a href="../logout"><i class="bi bi-box-arrow-right"></i>Logout</a>
	</nav>

	<h1>Assign Task</h1>
	<div class="container">
		<form name="taskForm" action="addTask" method="post"
			onsubmit="return validateForm();">
			<!-- Task Name Field -->
			<div class="form-group">
				<label for="taskName">Task Name:</label> <input type="text"
					class="form-control" name="taskName" required>
			</div>

				
			<div class="form-group">
				<label for="assignedTo">Assigned To:</label>  <select class="form-control" name="assignedTo" required>
            <option value="">Select Employee</option>
            <c:forEach var="employee" items="${employees}">
                <option value="${employee.userId}">${employee.username}</option>
            </c:forEach>
        </select>
			</div>


			<!-- Description Field -->
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea class="form-control" name="description" rows="4" required></textarea>
			</div>

			<!-- Priority Field -->
			<div class="form-group">
				<label for="priority">Priority:</label> <select class="form-control"
					name="priority" required>
					<option value="">Select Priority</option>
					<option value="High">High</option>
					<option value="Medium">Medium</option>
					<option value="Low">Low</option>
				</select>
			</div>

			<!-- Deadline Field -->
			<div class="form-group">
				<label for="deadline">Deadline:</label> <input type="datetime-local"
					class="form-control" name="deadline" required>
			</div>

			<!-- Hidden Status Field -->
			<input type="hidden" name="status" value="Assigned">

			<!-- Submit Button -->
			<button type="submit" class="btn-custom">
				<i class="fas fa-plus"></i> Add Task
			</button>
		</form>
	</div>

	<footer>
		<p>&copy; 2024 ProManage. All Rights Reserved.</p>
		<div class="footer-icons">
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fab fa-instagram"></i></a>
		</div>
	</footer>
</body>
</html>
