<%@page import="java.util.List"%>
<%@page import="dao.ArtistCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="bean.ArtistCategoryBean" %>
<%@ page import="dao.ArtistCategoryDAO" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
ArtistCategoryDAO artistCategoryDAO=new ArtistCategoryDAO();
List<ArtistCategoryBean> categories= artistCategoryDAO.getAllCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artwork Submission</title>
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
        <a href="adminDashboard.jsp">Dashboard</a>
        <a href="artistCategory.jsp">Artist Category</a>
        <a href="artistManage.jsp">Artist Management</a>
        <a href="artworkManage.jsp">Artwork Management</a>
        <a href="userManage.jsp">User Management</a>
        <a href="orderManage.jsp">Order Management</a>
        <a href="logout.jsp">Logout</a>
    </div>
    
    <div class="main-content">
        <!-- Top Navbar -->
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Admin Dashboard</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <h5>Artist Category</h5>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	<!-- Form Container -->
	<div class="container mt-5">
		<h2 class="mb-4">Artist Category</h2>

		<!-- Artwork Form -->
		<form action="artistCategoryAction.jsp" method="POST" onsubmit="return validateCategory()">

			<!-- Artist Name -->
			<div class="mb-3">
				<label for="artist-category" class="form-label">Artist
					Category</label> 
					<input type="text" class="form-control"
					id="artist-category" name="artist-category">
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
<!-- Display the Artist Category Table -->
 <div class="container mt-5">
        <!-- Display the Artist Category Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Actions</th> <!-- Added column for Edit/Delete buttons -->
                </tr>
            </thead>
             <tbody>
                <% 
                    // Loop through the list of categories and display each one in the table
                    for (ArtistCategoryBean category : categories) {
                %>
                <tr>
                    <td><%= category.getCategoryId() %></td>
                    <td><%= category.getCategoryName() %></td>
                    <td>
                        <!-- Buttons for Edit and Delete -->
                        <a href="editCategory.jsp?id=<%= category.getCategoryId() %>" class="btn btn-primary btn-sm">Edit</a>
                        <a href="deleteCategory.jsp?id=<%= category.getCategoryId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this category?');">Delete</a>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody> 
        </table>
</div>
	<!-- Bootstrap JS & Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
