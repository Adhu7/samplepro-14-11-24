
  
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="bean.ArtistBean" %>
<%@ page import="dao.ArtistDao" %>
<%@ page import="java.sql.SQLException" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
    response.sendRedirect("log.jsp");
}

ArtistDao artistDao = new ArtistDao();
List<ArtistBean> artists = null;

try {
    artists = artistDao.getAllUsers(); // Fetch all artists from the database
} catch (SQLException e) {
    e.printStackTrace();
    out.print("<p style='color: red;'>Error fetching artists: " + e.getMessage() + "</p>");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artist Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; }
        .sidebar { background-color: #0056b3; color: white; height: 100vh; position: fixed; top: 0; left: 0; width: 250px; }
        .sidebar a { color: white; padding: 15px; text-decoration: none; display: block; font-size: 16px; }
        .sidebar a:hover { background-color: #004085; }
        .main-content { margin-left: 260px; padding: 20px; }
        footer { background-color: #0056b3; color: white; padding: 10px; text-align: center; position: fixed; bottom: 0; width: 100%; }
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
                            <h5>Artist Management</h5>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Artist Management Section -->
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <h2>Manage Artists</h2>
                    <p>Review artist profiles, approve new artists, and edit existing profiles.</p>

                    <button class="btn btn-primary mb-3" onclick="window.location.href='createArtist.jsp'">Create Artist</button>

                    <!-- Artist Table -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Artist Name</th>
                                <th>Genre</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="artist-list">
                            <% if (artists != null && !artists.isEmpty()) {
                                for (ArtistBean artist : artists) { %>
                                    <tr>
                                        <td><%= artist.getArtistId() %></td>
                                        <td><%= artist.getName() %></td>
                                        <td><%= artist.getGenre() %></td>
                                        <td><%= artist.getEmail() %></td>
                                        <td><%= artist.getPhn() %></td>
                                        <td>
                                            <!-- Edit Button -->
                                            <button class="btn btn-info btn-sm" onclick="window.location.href='editArtist.jsp?id=<%= artist.getArtistId() %>'">Edit</button>

                                            <!-- Delete Button (Form with hidden input) -->
                                            <form action="deleteArtistAction.jsp" method="post" style="display:inline;">
                                                <input type="hidden" name="artistId" value="<%= artist.getArtistId() %>">
                                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this artist?')">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                            <%  } 
                            } else { %>
                                <tr>
                                    <td colspan="6" class="text-center">No artists found.</td>
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
  