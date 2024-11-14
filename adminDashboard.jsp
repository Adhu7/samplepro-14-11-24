<%@page import="dao.ArtDao"%>
<%@page import="dao.ArtistDao"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
//httpsession.setAttribute("user", user);
String email = (String) session.getAttribute("email");
int totalUsers=0;
int totalArtist=0;
int totalArt=0;

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");
}
else{
	UserDao dao=new UserDao();
	ArtistDao artistDao=new ArtistDao();
	ArtDao artDao=new ArtDao();
	
	totalUsers=dao.getCountUser();
	totalArtist=artistDao.getCountArtist();
	totalArt=artDao.getCountArtwork();

	out.print(totalUsers);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<!-- Link Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background-color: #f4f6f9;
    margin: 0;
    padding: 0;
    height: 100%;
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
    height: 100vh;
    overflow-y: auto; /* Prevents scroll overflow */
}

.card-title {
    font-size: 18px;
    font-weight: bold;
}

.card-body {
    font-size: 16px;
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

canvas {
    max-height: 300px; /* Limit chart height */
    width: 100% !important; /* Ensure the chart fills the container */
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                            <h5>Dashboard</h5>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Dashboard Overview -->
        <h2>Welcome, <%=email%></h2>
        <p>Manage users, artists, artworks, and orders from here.</p>

        <!-- Counts Overview Section -->
        <div class="row mt-5">
            <!-- User Count -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Users</h5>
                        <p class="card-text" id="user-count"><%=totalUsers %></p>
                    </div>
                </div> 
            </div>
            <!-- Artist Count -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Artists</h5>
                        <p class="card-text" id="artist-count"><%=totalArtist %></p>
                    </div>
                </div>
            </div>
            <!-- Artwork Count -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Artworks</h5>
                        <p class="card-text" id="artwork-count"><%=totalArt %></p>
                    </div>
                </div>
            </div>
            <!-- Order Count -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Orders</h5>
                        <p class="card-text" id="order-count">75</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sales Overview Section with Chart -->
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Sales Overview (Graph)</h5>
                    </div>
                    <div class="card-body">
                        <!-- Chart Container -->
                <canvas id="salesChart" style="width: 50%; height: 250px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    // Get the context of the canvas element we want to render the chart on
    var ctx = document.getElementById('salesChart').getContext('2d');

    // Create the chart
    var salesChart = new Chart(ctx, {
        type: 'bar',  // Bar chart type
        data: {
            labels: ['Users', 'Artists', 'Artworks', 'Orders'], // X-axis labels
            datasets: [{
                label: 'Total Count',
				data : [
<%= totalUsers %>, <%= totalArtist %>, <%= totalArt %>, 7], // Dynamic data from JSP
                backgroundColor: [
                    'rgba(0, 0, 0, 0.8)',  // Darker blue for users
                    'rgba(255, 99, 132, 0.8)',  // Darker red for artists
                    'rgba(255, 159, 64, 0.8)',  // Darker orange for artworks
                    'rgba(6, 208, 1, 1)'        // Darker green for orders
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',    // Darker blue border for users
                    'rgba(255, 99, 132, 1)',    // Darker red border for artists
                    'rgba(255, 159, 64, 1)',    // Darker orange border for artworks
                    'rgba(75, 192, 192, 1)'     // Darker green border for orders
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true, // Ensures the chart resizes according to screen size
            scales: {
                y: {
                    beginAtZero: true // Ensure the Y-axis starts at 0
                },
                x: {
                    barThickness: 10, // Adjust this value to reduce the width of the bars
                    maxBarThickness: 10, // Optionally set a maximum thickness
                }
            }
        }
    });
</script>


<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p>
        <a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a>
    </p>
</footer>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
