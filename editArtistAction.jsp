<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bean.ArtistBean" %>
<%@ page import="dao.ArtistDao" %>
<%
    // Retrieve the updated form data
    String artistName = request.getParameter("artist-name");
    String artistGenre = request.getParameter("artist-genre");
    String artistEmail = request.getParameter("artist-email");
    String artistPhone = request.getParameter("artist-phone");

    // Retrieve artistId (could be passed as a hidden field or in the URL)
    String artistIdParam = request.getParameter("id");
    int artistId = Integer.parseInt(artistIdParam);  // Convert to integer

    // Create a new ArtistBean object with the updated data
    ArtistBean artist = new ArtistBean(artistId, artistName, artistGenre, artistEmail, artistPhone);

    // Call your DAO method to update the artist details in the database
    ArtistDao artistDao = new ArtistDao();
    boolean isUpdated = artistDao.updateArtist(artist); // Assuming updateArtist is a method in your DAO

    if (isUpdated) {
        // Redirect to a success page or show a success message
        response.sendRedirect("artistManage.jsp?success=true");
    } else {
        // Handle error, maybe show a failure message
        out.println("Failed to update artist information.");
    }
%>
