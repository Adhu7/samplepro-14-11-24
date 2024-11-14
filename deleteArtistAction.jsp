<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.ArtistDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>

<%
    // Retrieve the artistId from the form data
    int artistId = Integer.parseInt(request.getParameter("artistId"));
    String message = "";
   ArtistDao artistDao=new ArtistDao();
    try {
        // Call the DAO method to delete the artist
        artistDao.deleteUsers(artistId);
        message = "Artist deleted successfully!";
    } catch (SQLException e) {
        message = "Error deleting artist: " + e.getMessage();
        e.printStackTrace();
    }

    // Redirect to the main artist management page or display a message
    response.sendRedirect("artistManage.jsp");
%>
