<%@page import="bean.ArtistCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ArtistCategoryDAO" %>
<%@ page import="java.sql.*" %>

<%
    /* String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Retrieve form parameters
    String categoryId = request.getParameter("categoryId");
    String categoryName = request.getParameter("artist-category");

    // Validate inputs
    if (categoryId == null ||  categoryName == null ) {
        out.println("<div class='alert alert-danger'>Invalid input. Please try again.</div>");
        return;
    }

    // Update the category using DAO
    ArtistCategoryDAO dao = new ArtistCategoryDAO();
    boolean isUpdated = dao.updateCategory(Integer.parseInt(categoryId));

    if (isUpdated) {
        // Redirect to the category list page upon successful update
        response.sendRedirect("artistCategory.jsp?updateSuccess=true");
    } else {
        // Provide feedback if the update failed
        out.println("<div class='alert alert-danger'>Failed to update category. Please try again.</div>");
    } */
    
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Retrieve form parameters
    String categoryId = request.getParameter("categoryId");
    String categoryName = request.getParameter("artist-category");

    // Validate inputs
    if (categoryId == null || categoryId.isEmpty() || categoryName == null || categoryName.trim().isEmpty()) {
        out.println("<div class='alert alert-danger'>Invalid input. Please try again.</div>");
        return;
    }

    // Create ArtistCategoryBean object and set values
    ArtistCategoryBean category = new ArtistCategoryBean();
    category.setCategoryId(Integer.parseInt(categoryId));
    category.setCategoryName(categoryName.trim());

    // Update the category using DAO
    ArtistCategoryDAO dao = new ArtistCategoryDAO();
    boolean isUpdated = dao.updateCategory(category);

    if (isUpdated) {
        // Redirect to the category list page upon successful update
        response.sendRedirect("artistCategory.jsp?updateSuccess=true");
    } else {
        // Provide feedback if the update failed
        out.println("<div class='alert alert-danger'>Failed to update category. Please try again.</div>");
    }
%>
