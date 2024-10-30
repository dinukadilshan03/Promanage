<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Request Updated</title>
    

<style>
@charset "UTF-8";

/* Base Styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f4f7fc;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: #333;
}

.container {
	background-color: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 600px;
	text-align: center;
}

h2 {
	color: #007bff;
	margin-bottom: 20px;
}

/* Custom Styles for Messages */
.success-message {
	font-size: 18px;
	color: #28a745;
	margin-bottom: 20px;
}

.status-message {
	font-size: 16px;
	color: #ff9800;
	margin-bottom: 40px;
}

a.back-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

a.back-link:hover {
	background-color: #0056b3;
}

/* Optional Review Section */
.review-section {
	margin-top: 40px;
}

</style>

</head>
<body>

<div class="container">
    <h2 class="form-title">Leave Request Updated</h2>
    <p class="success-message">Your leave request has been submitted successfully!</p>
  
    <a href="<c:url value='/leaveForm' />">Leave Details</a>

</div>

</body>
</html>
