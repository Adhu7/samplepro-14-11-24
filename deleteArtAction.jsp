<%@ page import="java.sql.*"%>
<%@ page import="dao.ArtDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>

<%
// Retrieve the artistId from the form data
String artId = request.getParameter("artId");


String message = "";
ArtDao artDao = new ArtDao();
try {
	// Call the DAO method to delete the artist
	artDao.deleteArtwork(Integer.parseInt(artId));
	message = "Artwork deleted successfully!";
} catch (Exception e) {
	message = "Error deleting artist: " + e.getMessage();
	e.printStackTrace();
}

// Redirect to the main artist management page or display a message
response.sendRedirect("artworkManage.jsp");
%>
