<%-- <%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Get the art ID from the request parameter
    String artId = request.getParameter("artId");
    if (artId == null || artId.isEmpty()) {
        out.println("Invalid artwork ID.");
        return;
    }

    ArtDao artDao = new ArtDao();
    ArtBean artwork = artDao.getArtworkById(Integer.parseInt(artId));

    if (artwork == null) {
        out.println("Artwork not found.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Artwork Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            display: flex;
        }
        .sidebar {
            background-color: #0056b3;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
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
            flex-grow: 1;
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <h5>Edit Artwork</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-wrapper">
        <h2>Edit Artwork Details</h2>
        <p>You can only update the price..</p>

        <!-- Edit Form -->
        <form action="editArtAction.jsp" method="post">
            <!-- Hidden field for artwork ID -->
            <input type="hidden" name="art-id" value="<%=artwork.getArtId()%>">

            <!-- Artwork Title -->
            <div class="mb-3">
                <label for="art-title" class="form-label">Artwork Title</label>
                <input type="text" class="form-control" id="art-title" name="art-title" value="<%= artwork.getArtTitle() %>" readonly>
            </div>

            <!-- Artist Name -->
            <div class="mb-3">
                <label for="artist-name" class="form-label">Artist Name</label>
                <input type="text" class="form-control" id="artist-name" name="artist-name" value="<%= artwork.getArtistName() %>" readonly>
            </div>

            <!-- Genre -->
            <div class="mb-3">
                <label for="artist-genre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="artist-genre" name="artist-genre" value="<%= artwork.getArtGenre() %>" readonly>
            </div>

            <!-- Current Price -->
            <div class="mb-3">
                <label for="art-price" class="form-label">Price (Rs.)</label>
                <input type="text" class="form-control" id="art-price" name="art-price" value="<%= artwork.getArtPrice() %>" >
            </div>
<!-- Current Image -->
    <div class="mb-3">
        <label for="current-image" class="form-label">Current Image</label>
        <div>
            <img src="<%= artwork.getUploadImage() %>" alt="Artwork Image" style="max-width: 200px;">
        </div>
    </div>

    <!-- Upload New Image -->
    <div class="mb-3">
        <label for="new-image" class="form-label">Upload New Image</label>
        <input type="file" class="form-control" id="new-image" name="new-image">
    </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>
<div style="height: 900px"></div>
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>
 <%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Get the art ID from the request parameter
    String artId = request.getParameter("artId");
    if (artId == null || artId.isEmpty()) {
        out.println("Invalid artwork ID.");
        return;
    }

    ArtDao artDao = new ArtDao();
    ArtBean artwork = artDao.getArtworkById(Integer.parseInt(artId));

    if (artwork == null) {
        out.println("Artwork not found.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Artwork Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            display: flex;
        }
        .sidebar {
            background-color: #0056b3;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
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
            flex-grow: 1;
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <h5>Edit Artwork</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-wrapper">
        <h2>Edit Artwork Details</h2>
        <p>You can update the title, price, and image of the artwork.</p>

        <!-- Edit Form -->
        <form action="editArtAction.jsp" method="post" enctype="multipart/form-data">
            <!-- Hidden field for artwork ID -->
            <input type="hidden" name="art-id" value="<%=artwork.getArtId()%>">

            <!-- Artwork Title -->
            <div class="mb-3">
                <label for="art-title" class="form-label">Artwork Title</label>
                <input type="text" class="form-control" id="art-title" name="art-title" value="<%= artwork.getArtTitle() %>" required>
            </div>

            <!-- Artist Name -->
            <div class="mb-3">
                <label for="artist-name" class="form-label">Artist Name</label>
                <input type="text" class="form-control" id="artist-name" name="artist-name" value="<%= artwork.getArtistName() %>" readonly>
            </div>

            <!-- Genre -->
            <div class="mb-3">
                <label for="artist-genre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="artist-genre" name="artist-genre" value="<%= artwork.getArtGenre() %>" readonly>
            </div>

            <!-- Current Price -->
            <div class="mb-3">
                <label for="art-price" class="form-label">Price (Rs.)</label>
                <input type="text" class="form-control" id="art-price" name="art-price" value="<%= artwork.getArtPrice() %>" required>
            </div>

            <!-- Current Image -->
            <div class="mb-3">
                <label for="current-image" class="form-label">Current Image</label>
                <div>
                    <img src="<%= artwork.getUploadImage() %>" alt="Artwork Image" style="max-width: 200px;">
                </div>
            </div>

            <!-- Upload New Image -->
            <div class="mb-3">
                <label for="new-image" class="form-label">Upload New Image</label>
                <input type="file" class="form-control" id="new-image" name="new-image">
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>
<div style="height: 900px"></div>
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 