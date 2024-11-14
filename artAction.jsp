<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dao.ArtDao" %>
<%@ page import="bean.ArtBean" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    String artTitle = null;
    String artistName = null;
    String artGenre = null;
    String artPriceStr = null;
    String fileName = null;

    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> formItems = upload.parseRequest(request);

            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    switch (fieldName) {
                        case "art-title": artTitle = fieldValue; break;
                        case "artist-name": artistName = fieldValue; break;
                        case "art-genre": artGenre = fieldValue; break;
                        case "art-price": artPriceStr = fieldValue; break;
                    }
                } else {
                    fileName = item.getName();

                    if (fileName != null && !fileName.isEmpty()) {
                        String uploadPath = getServletContext().getRealPath("/") + "uploads/";
                        File uploadDir = new File(uploadPath);

                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs(); // Create the uploads directory if it doesn't exist
                        }

                        String filePath = uploadPath + fileName;
                        item.write(new File(filePath));
                    }
                }
            }

            out.println("Artwork Title: " + artTitle + "<br>");
            out.println("Artist Name: " + artistName + "<br>");
            out.println("Genre: " + artGenre + "<br>");
            out.println("Price: " + artPriceStr + "<br>");
            out.println("Image: " + fileName + "<br>");

            double artPrice = Double.parseDouble(artPriceStr);
            ArtDao artDao = new ArtDao();
            ArtBean artBean = new ArtBean(artTitle, artistName, artGenre, artPrice, fileName);
            %>
            <%
            boolean isSaved = artDao.addArtwork(artBean);
            if (isSaved) {
        %>
            <script>
                alert("Artwork added successfully!");
                window.location.href = "artworkManage.jsp";
            </script>
        <%
            } else {
        %>
            <script>
                alert("Failed to add artwork.");
                window.location.href = "addArt.jsp"; // Redirect back to add artwork page if needed
            </script>
        <%
            }
        %>

<% 
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error: " + ex.getMessage());
        }
    } else {
        out.println("The form is not multipart. Please check the form enctype.");
    }
%>
