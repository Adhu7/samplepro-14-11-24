<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.UserBean"%>
<%@ page import="dao.UserDao"%>
<%
String email = (String) session.getAttribute("email");

if (email == null) {
	response.sendRedirect("log.jsp");
	return;
}

// Fetch user data using UserDao
UserDao userDao = new UserDao();
List<UserBean> users = userDao.getAllUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Management</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f6f9;
}

.sidebar {
	background-color: #0056b3;
	color: white;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	width: 250px;
}

.sidebar a {
	color: white;
	padding: 15px;
	text-decoration: none;
	display: block;
	font-size: 16px;
}

.sidebar a:hover {
	background-color: #004085;
}

.main-content {
	margin-left: 260px;
	padding: 20px;
}

footer {
	background-color: #0056b3;
	color: white;
	padding: 10px;
	text-align: center;
	position: fixed;
	bottom: 0;
	width: 100%;
}

footer a {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h2 class="text-center py-4">Artevo Admin</h2>
		<a href="adminDashboard.jsp">Dashboard</a> <a
			href="artistCategory.jsp">Artist Category</a> <a
			href="artistManage.jsp">Artist Management</a> <a
			href="artworkManage.jsp">Artwork Management</a> <a
			href="userManage.jsp">User Management</a> <a href="orderManage.jsp">Order
			Management</a> <a href="logout.jsp">Logout</a>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<!-- Top Navbar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Admin Dashboard</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item">
							<h5>User Management</h5>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- Page Title -->
		<h2 class="mt-4">User Management</h2>
		<p>Registered users and their status.</p>

		<!-- User Table -->
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>User ID</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (users != null && !users.isEmpty()) {
					for (UserBean user : users) {
				%>
				<tr>
					<td><%=user.getUserId()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getPhone()%></td>
					<td><%=user.getEmail()%></td>
					<td>
						<form action="toggleUserStatus.jsp" method="post"
							style="display: inline;">
							<input type="hidden" name="userId"
								value="<%=user.getUserId()%>">

							<!-- Button for Active/Inactive Status -->
							<button type="submit" name="status"
								value="<%=user.getIsActive() == 1 ? "0" : "1"%>"
								class="btn btn-sm <%=user.getIsActive() == 1 ? "btn-success" : "btn-secondary"%>">
								<%=user.getIsActive() == 1 ? "Active" : "Inactive"%>
							</button>
						</form>

					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5" class="text-center">No users found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 Artevo. All Rights Reserved.</p>
		<p>
			<a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy
				Policy</a>
		</p>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
