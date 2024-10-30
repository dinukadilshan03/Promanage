<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Task</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body, h1, p, a, form {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

body {
	background-color: #e8f4fa;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

header {
	background-color: #003f7f;
	color: white;
	padding: 50px;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
}

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

h1 {
	text-align: center;
	color: #003366;
	margin: 30px 0;
}

.container {
	margin: 30px auto;
	width: 90%;
	max-width: 800px;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 40px;
}

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
	margin-top: 20px;
}

.btn-custom:hover {
	background-color: #003f7f;
}

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
		const taskName = document.querySelector('input[name="taskName"]').value;
		const assignedTo = document.querySelector('select[name="assignedTo"]').value;
		const description = document
				.querySelector('textarea[name="description"]').value;
		const priority = document.querySelector('select[name="priority"]').value;
		const deadline = document.querySelector('input[name="deadline"]').value;
		const status = document.querySelector('select[name="status"]').value;
		const today = new Date().toISOString().split('T')[0];

		if (taskName.trim() === "") {
			alert("Task Name cannot be empty.");
			return false;
		} else if (taskName.length > 100) {
			alert("Task Name should not exceed 100 characters.");
			return false;
		}

		if (assignedTo === "") {
			alert("Please select an employee for the task.");
			return false;
		}

		if (description.trim() === "") {
			alert("Description cannot be empty.");
			return false;
		} else if (description.length < 10) {
			alert("Description must be at least 10 characters long.");
			return false;
		}

		if (priority === "") {
			alert("Please select a priority.");
			return false;
		}

		if (deadline < today) {
			alert("Deadline cannot be in the past.");
			return false;
		}

		if (status === "") {
			alert("Please select a status.");
			return false;
		}

		return true;
	}
</script>
</head>

<body>

	<header>ProManage - Employee Management System</header>

	<nav>
		<a href="employeeDashboard.jsp"><i class="bi bi-grid"></i>Dashboard</a>
		<a href="../logout"><i class="bi bi-box-arrow-right"></i>Logout</a>
	</nav>

	<h1>Edit Task</h1>

	<div class="container">
		<form action="" method="post" onsubmit="return validateForm()">
			<input type="hidden" name="taskId" value="${task.taskId}">
			<div class="form-group">
				<label for="taskName">Task Name:</label> <input type="text"
					class="form-control" name="taskName" value="${task.taskName}"
					required maxlength="100">
			</div>


			<div class="form-group">
				<label for="assignedTo">Assigned To: <span
					style="font-weight: normal; color: #666;">(Currently
						assigned to ${username})</span>
				</label> <select class="form-control" name="assignedTo" required>
					<c:forEach var="user" items="${users}">
						<option value="${user.userId}"
							${user.username == task.assignedTo ? 'selected' : ''}>
							${user.username}</option>
					</c:forEach>
				</select>
			</div>


			<div class="form-group">
				<label for="description">Description:</label>
				<textarea class="form-control" name="description" rows="4" required>${task.description}</textarea>
			</div>

			<div class="form-group">
				<label for="priority">Priority:</label> <select class="form-control"
					name="priority" required>
					<option value="High" ${task.priority == 'High' ? 'selected' : ''}>High</option>
					<option value="Medium"
						${task.priority == 'Medium' ? 'selected' : ''}>Medium</option>
					<option value="Low" ${task.priority == 'Low' ? 'selected' : ''}>Low</option>
				</select>
			</div>

			<div class="form-group">
				<label for="deadline">Deadline:</label> <input type="date"
					class="form-control" name="deadline"
					value="${fn:substring(task.deadline, 0, 10)}" required>
			</div>

			<div class="form-group">
				<label for="status">Status:</label> <input type="text"
					class="form-control" name="status" value="${task.status}" readonly>
				<small style="color: red; font-weight: bold;">Manager cannot
					change the status.</small>
			</div>



			<div class="form-group">
				<button type="submit" class="btn-custom">
					<i class="fas fa-save"></i> Update Task
				</button>
			</div>
		</form>
	</div>

	<footer>
		<div class="footer-icons">
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fab fa-linkedin"></i></a>
		</div>
		<p>&copy; 2024 ProManage. All Rights Reserved.</p>
	</footer>

</body>
</html>
