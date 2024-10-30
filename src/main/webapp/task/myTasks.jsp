<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="task.model.Task"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Tasks</title>
<style>
/* General styles */
body {
	font-family: Arial, sans-serif;
	background-color: #e6f0ff; /* Light blue background */
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

header {
	background-color: #003366; /* Dark blue header */
	color: white;
	padding: 50px;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	letter-spacing: 1px;
}

nav {
	background-color: #00509e; /* Medium blue for nav */
	padding: 10px;
	text-align: center;
}

nav a {
	color: white;
	text-decoration: none;
	margin: 0 15px;
	font-size: 18px;
	transition: color 0.3s ease;
}

nav a:hover {
	color: #ffcc00;
}

h1 {
	text-align: center;
	color: #003366; /* Dark blue for headings */
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
	background-color: #00509e; /* Medium blue for table header */
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

select, input[type="submit"] {
	padding: 8px 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	background-color: #fff;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

input[type="submit"] {
	background-color: #ff5733; /* Red for button */
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #e64527; /* Darker red on hover */
	transform: translateY(-2px);
}

select:focus, input[type="submit"]:focus {
	border-color: #00264d;
}

.error-message {
	color: red;
	text-align: center;
	font-weight: bold;
	margin: 10px 0;
}

/* Footer styles */
footer {
	background-color: #003366; /* Dark blue footer */
	color: white;
	padding: 10px;
	text-align: center;
	margin-top: auto;
}

.footer-icons {
	margin-top: 10px;
}

/* Footer icon styles */
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
/* Status Buttons Styles */
.status-btn {
    border: none;
    padding: 8px 15px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
    display: inline-flex;
    align-items: center;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.status-btn i {
    margin-right: 5px; /* Space between icon and text */
}

/* Ongoing Button */
.ongoing-btn {
    background-color: #ffc107; /* Yellow background */
    color: white;
}

.ongoing-btn:hover {
    background-color: #e0a800;
}

.ongoing-btn:disabled {
    background-color: #ffd966;
    cursor: not-allowed;
}

/* Finished Button */
.finished-btn {
    background-color: #28a745; /* Green background */
    color: white;
}

.finished-btn:hover {
    background-color: #218838;
}

.finished-btn:disabled {
    background-color: #71d48a;
    cursor: not-allowed;
}

/* Hover Effects */
.status-btn:hover {
    transform: translateY(-2px); /* Slight lift on hover */
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
		<a href="employeeDashboard.jsp"><i class="bi bi-grid"></i>Dashboard</a>
		<a href="logout"><i class="bi bi-box-arrow-right"></i>Logout</a>
	</nav>

	<h1>My Tasks</h1>

	<%
	// Display error message if it exists
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<div class="error-message">
		<strong>Error:</strong>
		<%=errorMessage%>
	</div>
	<%
	}
	%>

	<table>
		<tr>
			<th>Task Name</th>
			<th>Status</th>
			<th>Assigned To</th>
			<th>Description</th>
			<th>Priority</th>
			<th>Deadline</th>
			<th>Action</th>
		</tr>
		<%
		// Retrieve tasks from request attributes
		List<Task> tasks = (List<Task>) request.getAttribute("tasks");
		if (tasks != null && !tasks.isEmpty()) {
			// Iterate over tasks and display them in the table
			for (Task task : tasks) {
		%>
		<tr>
			<td><%=task.getTaskName()%></td>
			<td><%=task.getStatus()%></td>
			<td><%=task.getAssignedTo()%></td>
			<td><%=task.getDescription()%></td>
			<td><%=task.getPriority()%></td>
			<td><%=task.getDeadline()%></td>
			<td>
    <%
    if (task.getStatus() != null && task.getStatus().equals("Finished")) {
    %>
        <span style="color: red; font-weight: bold;">Task is finished</span>
    <%
    } else {
    %>
        <form method="post" action="myTasks">
            <input type="hidden" name="taskId" value="<%=task.getTaskId()%>" />
            <!-- Ongoing Button -->
            <button type="submit" name="status" value="Ongoing" class="status-btn ongoing-btn"
                <%=task.getStatus().equals("Ongoing") ? "disabled" : ""%>>
                <i class="bi bi-hourglass-split"></i> Ongoing
            </button>
            <!-- Finished Button -->
            <button type="submit" name="status" value="Finished" class="status-btn finished-btn"
                <%=task.getStatus().equals("Finished") ? "disabled" : ""%>>
                <i class="bi bi-check-circle"></i> Finished
            </button>
        </form>
    <%
    }
    %>
</td>




		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="7">No tasks available.</td>
		</tr>
		<%
		}
		%>
	</table>

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
