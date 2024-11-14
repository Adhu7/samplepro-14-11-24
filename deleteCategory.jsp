<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.ArtistCategoryDAO" %>
<%@ page import="java.io.*" %>

<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("log.jsp");
        return;
    }

    // Get category ID from request
    int categoryId = Integer.parseInt(request.getParameter("id"));
    ArtistCategoryDAO dao = new ArtistCategoryDAO();

    // Delete the category
    boolean success = dao.deleteCategory(categoryId);

    if (success) {
        response.sendRedirect("artistCategory.jsp");
    } else {
        out.println("Error deleting category");
    }
%>
