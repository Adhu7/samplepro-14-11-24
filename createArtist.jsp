<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>

<%@ page import="java.util.List" %>
<%@ page import="dao.ArtistCategoryDAO" %>
<%@ page import="bean.ArtistCategoryBean" %>
<%
    // Instantiate the DAO and retrieve all categories
    ArtistCategoryDAO artistCategoryDAO = new ArtistCategoryDAO();
    List<ArtistCategoryBean> categories = artistCategoryDAO.getAllCategories();
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Artist</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2 class="text-center py-4">Artevo Admin</h2>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="artistManage.jsp">Artist Management</a>
    <a href="artworkManage.jsp">Artwork Management</a>
    <a href="userManage.jsp">User Management</a>
    <a href="orderManage.jsp">Order Management</a>
    <a href="logout.jsp">Logout</a>
</div>

<!-- Main Content -->
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
                        <h5>Create Artist</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container mt-4">
    <h2>Create New Artist</h2>
    <p>Fill out the form below to add a new artist to the system.</p>

    <!-- Create Artist Form -->
    <form action="createArtistAction.jsp" method="post">
        <!-- Artist Name -->
        <div class="mb-3">
            <label for="artist-name" class="form-label">Artist Name</label>
            <input type="text" class="form-control" id="artist-name" name="artist-name" required>
        </div>

        <!-- Genre -->
     
               <div class="mb-3">
    <label for="artist-genre" class="form-label">Genre</label>
    <select class="form-control" id="artist-genre" name="artist-genre" required>
        <option value="">Select Genre</option>
        <% for (ArtistCategoryBean category : categories) { %>
            <option value="<%= category.getCategoryName() %>"><%= category.getCategoryName() %></option>
        <% } %>
    </select>
</div>

        <!-- Contact Email -->
        <div class="mb-3">
            <label for="artist-email" class="form-label">Contact Email</label>
            <input type="email" class="form-control" id="artist-email" name="artist-email" required>
        </div>

        <!-- Contact Phone -->
        <div class="mb-3">
            <label for="artist-phone" class="form-label">Contact Phone</label>
            <input type="tel" class="form-control" id="artist-phone" name="artist-phone" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Create Artist</button>
    </form>
</div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
