<%@ page import="java.util.List" %>
<%@ page import="bean.ArtBean" %>
<%@ page import="dao.ArtDao" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    ArtDao artDao = new ArtDao();
    List<ArtBean> artworks = artDao.getAllArtworks(); // Fetch artworks from DB
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artwork Management</title>
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
    <a href="artistCategory.jsp">Artist Category</a>
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
                        <h5>Artwork Management</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Artwork Management Section -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Manage Artworks</h2>
                <p>Manage all artworks, including adding, editing, and removing them. Categorize artworks by type, price, or artist.</p>

                <!-- Add Artwork Button -->
                <button class="btn btn-primary mb-3" onclick="window.location.href='addArt.jsp'">Add New Artwork</button>

                <!-- Artwork Table -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Artwork Title</th>
                            <th>Artist</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Image </th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ArtBean artwork : artworks) { %>
                        <tr>
                            <td><%= artwork.getArtId() %></td>
                            <td><%= artwork.getArtTitle() %></td>
                            <td><%= artwork.getArtistName() %></td>
                            <td><%= artwork.getArtPrice() %></td>
                            <td><%= artwork.getArtGenre() %></td>
                            
            <td>
                <img src="<%= artwork.getUploadImage() %>" alt="<%= artwork.getArtTitle() %>" 
                     style="width: 100px; height: auto;">
            </td>
                            <td>
                                 <button class="btn btn-info btn-sm" onclick="window.location.href='editArt.jsp?artId=<%= artwork.getArtId() %>'">Edit</button>

                                <form action="deleteArtAction.jsp" method="post" style="display:inline;">
                                                <input type="hidden" name="artId" value="<%= artwork.getArtId() %>">
                                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this artist?')">Delete</button>
                                            </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
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
