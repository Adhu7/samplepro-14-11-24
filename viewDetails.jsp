<%-- <%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    String artIdParam = request.getParameter("artId");  // Get the artId from URL
    int artId = -1;
    try {
        artId = Integer.parseInt(artIdParam);  // Parse it as integer
    } catch (NumberFormatException e) {
        e.printStackTrace();  // Handle invalid artId
    }
    
    if (artId > 0) {
        ArtDao artDao = new ArtDao();
        ArtBean artwork = artDao.getArtworkById(artId);  // Fetch artwork by ID from DB

        if (artwork == null) {
            out.print("Artwork not found.");
        }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artwork Details</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Artwork Details</h2>

    <div class="card">
        <div class="card-body">
            <h3 class="card-title"><%= artwork.getArtTitle() %></h3>
            <p><strong>Artist: </strong><%= artwork.getArtistName() %></p>
            <p><strong>Price: </strong>$<%= artwork.getArtPrice() %></p>
            <p><strong>Category: </strong><%= artwork.getArtGenre() %></p>
            <img src="<%= artwork.getUploadImage() %>" class="img-fluid" alt="<%= artwork.getArtTitle() %>" style="width: 300px; height: auto;"/>
        </div>
    </div>

    <hr>
    <button class="btn btn-primary" onclick="window.history.back()">Go Back</button>
</div>

</body>
</html>

<%
    } else {
        out.print("Invalid Artwork ID.");
    }
%>
 --%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ArtDao,bean.ArtBean, java.util.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Fetch artworks from the database
    List<ArtBean> artworks = new ArrayList<>();
    ArtDao artDao = new ArtDao();

    try {
        artworks = artDao.getAllArtworks(); // Call the method to get artworks from DB
        request.setAttribute("artworks", artworks);  // Set the artworks list as a request attribute
    } catch (SQLException e) {
        out.println("Error fetching artworks: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artwork View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .artwork-card {
            margin: 20px;
        }
        .artwork-card img {
            height: 200px;
            object-fit: cover;
        }
        .artwork-card .card-body {
            text-align: center;
        }
        .artwork-card .card-title {
            font-size: 1.2rem;
        }
        .artwork-card .card-price {
            font-size: 1.1rem;
            color: #28a745;
        }
    </style>
</head>
<body>
  <!-- Artworks Section -->
  <div class="container my-5">
      <h2 class="text-center text-danger mb-4">Popular Artworks</h2>
      <div class="row">
          <!-- Loop through the artworks and display each one -->
          <c:forEach var="art" items="${artwork}">
              <div class="col-md-4 mb-4">
                  <div class="card artwork-card">
                      <!-- Display artwork image -->
                      <img src="uploads/${art.getUploadImage()}" class="card-img-top" alt="${art.getArtTitle()}">
                      <div class="card-body text-center">
                          <!-- Display artwork title -->
                          <h5 class="card-title">${art.getArtTitle()}</h5>
                          <!-- Display artist name -->
                          <p class="card-text"><strong>Artist:</strong> ${art.getArtistName()}</p>
                          <!-- Display price -->
                          <p class="card-price">$${art.getArtPrice()}</p>
                          <!-- Link to view artwork details -->
                          <a href="viewArtDetails.jsp?artId=${art.getArtId()}" class="btn btn-danger">View Details</a>
                      </div>
                  </div>
              </div>
          </c:forEach>
      </div>
  </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 