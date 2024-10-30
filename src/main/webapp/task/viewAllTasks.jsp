<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>View All Tasks</title>
<style>
/* General styles */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

header {
	background-color: #00264d;
	color: white;
	padding: 50px;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	letter-spacing: 1px;
}

nav {
	background-color: #004080;
	padding: 10px;
	text-align: center;
}

nav button {
	background: none;
	border: none;
	color: white;
	font-size: 18px;
	margin: 0 15px;
	cursor: pointer;
	transition: color 0.3s ease;
}

nav button i {
	margin-right: 8px;
}

nav button:hover {
	color: #ffcc00;
}

h1 {
	text-align: center;
	color: #003366;
	margin-top: 30px;
}

table {
	width: 90%;
	margin: 30px auto;
	border-collapse: collapse;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

table th, table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

table th {
	background-color: #004080;
	color: white;
	font-weight: bold;
	font-size: 16px;
}

table td {
	font-size: 14px;
	color: #333;
}

table tr:hover {
	background-color: #f1f1f1;
}

/* Button Styles */
button {
	border: none;
	padding: 8px 12px;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	transition: transform 0.3s ease;
}

button i {
	margin-right: 5px;
}

/* Edit Button */
.btn-edit {
	color: #fff;
	background-color: #28a745; /* Green color for edit */
}

.btn-edit:hover {
	background-color: #218838;
	transform: translateY(-2px);
}

/* Delete Button */
.btn-delete {
	color: #fff;
	background-color: #dc3545; /* Red color for delete */
}

.btn-delete:hover {
	background-color: #c82333;
	transform: translateY(-2px);
}

/* Add New Task button */
.btn-add {
	color: #fff;
	background-color: #004080;
	padding: 10px 15px;
	margin: 20px auto;
	display: block;
}

.btn-add:hover {
	background-color: #003366;
	transform: translateY(-2px);
}

/* Footer styles */
footer {
	background-color: #00264d;
	color: white;
	padding: 10px;
	text-align: center;
	margin-top: auto;
}

.footer-icons {
	margin-top: 10px;
}

.footer-icons a {
	text-decoration: none;
	color: white;
	padding: 5px;
	font-size: 24px;
	margin: 0 10px;
	transition: color 0.3s ease, transform 0.3s ease;
}

.footer-icons a:hover {
	color: #ffcc00;
	transform: scale(1.2);
}
</style>
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
</head>

<body>
	<header> ProManage - Employee Management System </header>

	<nav>
		
		<button onclick="location.href='managerDashboard.jsp'">
			<i class="bi bi-speedometer2"></i>Dashboard
		</button>
		
		<button onclick="location.href='logout'">
			<i class="bi bi-box-arrow-right"></i>Logout
		</button>
	</nav>

	<h1>All Tasks</h1>
	<c:if test="${not empty errorMessage}">
		<div style="color: red;">${errorMessage}</div>
	</c:if>
	<table border="1">
		<tr>
			<th>Task ID</th>
			<th>Task Name</th>
			<th>Assigned To</th>
			<th>Status</th>
			<th>Description</th>
			<th>Priority</th>
			<th>Deadline</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="task" items="${tasks}">
			<tr>
				<td>${task.taskId}</td>
				<td>${task.taskName}</td>
				<td>${task.assignedTo}</td>
				<td>${task.status}</td>
				<td>${task.description}</td>
				<td>${task.priority}</td>
				<td>${task.deadline}</td>
				<td><c:choose>
						<c:when test="${task.status == 'Finished'}">
							<span style="color: red;">This task is already finished.</span>
						</c:when>
						<c:otherwise>
							<button class="btn-edit"
								onclick="location.href='updateTask?taskId=${task.taskId}'">
								<i class="bi bi-pencil-fill"></i>Edit
							</button>
						</c:otherwise>
					</c:choose>
					<form action="deleteTask" method="post" style="display: inline;">
						<input type="hidden" name="taskId" value="${task.taskId}">
						<button type="submit" class="btn-delete"
							onclick="return confirm('Are you sure you want to delete this task?');">
							<i class="bi bi-trash-fill"></i>Delete
						</button>
					</form></td>
			</tr>
		</c:forEach>
	</table>


	<!-- Add New Task button with icon -->
	<button class="btn-add" onclick="location.href='addTask'">
		<i class="bi bi-plus-circle-fill"></i>Add New Task
	</button>

	<footer>
		<p>&copy; 2024 ProManage. All Rights Reserved.</p>
		<div class="footer-icons">
			<a href="#"><i class="bi bi-facebook"></i></a> <a href="#"><i
				class="bi bi-twitter"></i></a> <a href="#"><i
				class="bi bi-instagram"></i></a>
		</div>
	</footer>
</body>
</html>
