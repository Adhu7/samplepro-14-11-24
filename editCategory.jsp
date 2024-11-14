<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ArtistCategoryDAO" %>
<%@ page import="bean.ArtistCategoryBean" %>
<%@ page import="java.sql.*" %>

<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }
    
   // String categoryId = request.getParameter("categoryId");
    
    /* if (categoryId == null) {
        out.println("Invalid category ID.");
        return;
    } */
    // Get category ID from request
    
  //  ArtistCategoryDAO dao = new ArtistCategoryDAO();
    
   /*  ArtistCategoryBean category = dao.getCategoryById(Integer.parseInt(categoryId)); */
   /*  ArtistCategoryBean category = null;
   try{
	   category = dao.getCategoryById(Integer.parseInt(categoryId));
   } catch (Exception e) {
	   out.println("error: " + e.getMessage());
   } */
   
   // Get category ID from the request parameter "id"
   String categoryId = request.getParameter("id");
   if (categoryId == null) {
       out.println("Invalid category ID.");
       return;
   }

   ArtistCategoryDAO dao = new ArtistCategoryDAO();
   ArtistCategoryBean category = dao.getCategoryById(Integer.parseInt(categoryId));

   // Check if category is found
   if (category == null) {
       out.println("Category not found.");
       return;
   }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Artist Category</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Edit Artist Category</h2>
    <form action="editCategoryAction.jsp" method="POST">
        <input type="hidden" id="categoryId" name="categoryId" value="<%= category.getCategoryId() %>">
        <div class="mb-3">
            <label for="artist-category" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="artist-category" name="artist-category" value="<%= category.getCategoryName() %>">
        </div>
        <button type="submit" class="btn btn-primary">Update Category</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
