<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bean.ArtistBean" %>
<%@ page import="dao.ArtistDao" %>
 <%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%> 
<%
    // Get form parameters
    String name = request.getParameter("artist-name");
    String genre = request.getParameter("artist-genre");
    String emails = request.getParameter("artist-email");
    String phn = request.getParameter("artist-phone");


    ArtistBean artist = new ArtistBean();
    artist.setName(name);
    artist.setGenre(genre);
    artist.setEmail(emails);
    artist.setPhn(phn);

    // Create ArtistDao instance and save artist
    ArtistDao artistDao = new ArtistDao();
    String message = "";
    try {
        artistDao.insertUsers(artist);  // Save the artist to the database
        message = "Artist created successfully!";
        response.sendRedirect("artistManage.jsp?message=" + java.net.URLEncoder.encode(message, "UTF-8"));
    } catch (SQLException e) {
        message = "Error creating artist: " + e.getMessage();
        out.print("<p style='color: red;'>" + message + "</p>");
        e.printStackTrace();
    }
%>
