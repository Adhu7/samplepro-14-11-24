<%-- <%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ArtDao" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    String artId = request.getParameter("art-id");
    String artPrice = request.getParameter("art-price");

    if (artId != null && artPrice != null) {
        ArtDao artDao = new ArtDao();
        boolean isUpdated = artDao.updateArtPrice(Integer.parseInt(artId), Double.parseDouble(artPrice));

        if (isUpdated) {
            response.sendRedirect("artworkManage.jsp?success=Price updated successfully");
        } else {
            out.println("Error updating price. Please try again.");
        }
    } else {
        out.println("Invalid input.");
    }
%>
 --%>
<%--  <%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%
    // Get the form data
    String artId = request.getParameter("art-id");
    String artTitle = request.getParameter("art-title");
    String artistName = request.getParameter("artist-name");
    String artPrice = request.getParameter("art-price");
    String newImage = request.getParameter("new-image");
out.println(artId+" " +artTitle+ " " +artistName+" "+ artPrice+ " "+newImage);
    /* if (artId == null || artTitle == null || artPrice == null) { --%>
        <!-- out.println("Invalid data.");
        return;
    }

    // Get the current artwork details
    ArtDao artDao = new ArtDao();
    ArtBean artwork = artDao.getArtworkById(Integer.parseInt(artId));

    if (artwork == null) {
        out.println("Artwork not found.");
        return;
    }

    // Process image upload (if any new image is provided)
    String newImagePath = artwork.getUploadImage();  // Use the current image by default
    if (newImage != null && !newImage.isEmpty()) {
        // Logic to save the new image to the server (you may want to implement actual file saving here)
        // Set the new image path as the new image URL
        newImagePath = "path_to_images/" + newImage;
    }

    // Update artwork details
    boolean isUpdated = artDao.updateArtwork(Integer.parseInt(artId), artPrice, newImagePath);

    if (isUpdated) {
        out.println("Artwork updated successfully!");
        response.sendRedirect("artworkManage.jsp");
    } else {
        out.println("Error updating artwork.");
    } */
%> -->
  --%>
  <%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.SQLException" %>
<%
    // Set the path to save the uploaded images
    String imagePath = application.getRealPath("/") + "uploads/";

    // Ensure the upload directory exists
    File uploadDir = new File(imagePath);
    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }

    // Retrieve form data
    String artIdStr = request.getParameter("art-id");
    String artTitle = request.getParameter("art-title");
    String artPriceStr = request.getParameter("art-price");

    Part newImagePart = request.getPart("new-image"); // For file upload
    String newImageName = null;

    // Validate inputs
    if (artIdStr == null || artTitle == null || artPriceStr == null || artIdStr.isEmpty() || artPriceStr.isEmpty()) {
        out.println("<h3>Error: Missing required fields!</h3>");
        return;
    }

    int artId = Integer.parseInt(artIdStr);
    double artPrice = Double.parseDouble(artPriceStr);

    // Check if a new image was uploaded
    if (newImagePart != null && newImagePart.getSize() > 0) {
        newImageName = "artwork_" + artId + "_" + System.currentTimeMillis() + "_" + newImagePart.getSubmittedFileName();
        newImagePart.write(imagePath + newImageName); // Save the file
    }

    // Update artwork details in the database
    ArtDao artDao = new ArtDao();
    boolean isUpdated;

    if (newImageName != null) {
        // Update with a new image
        isUpdated = artDao.updateArtwork(artId, artTitle, artPriceStr, "uploads/" + newImageName);
    } else {
        // Update without changing the image
        isUpdated = artDao.updateArtwork(artId, artTitle, artPriceStr, null);
    }

    if (isUpdated) {
        out.println("<h3>Artwork updated successfully!</h3>");
        out.println("<a href='artworkManage.jsp'>Go back to Artwork Management</a>");
    } else {
        out.println("<h3>Error: Unable to update artwork details.</h3>");
    }
%>
  