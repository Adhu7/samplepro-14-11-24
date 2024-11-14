<%@ page import="dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="bean.UserBean" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.IOException" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Check if the email and password match the admin credentials directly
    if (email != null && password != null && email.equals("admin@artevo.com") && password.equals("Admin@123")) {
        session.setAttribute("email", email); // Set user session attribute for admin
        response.sendRedirect("adminDashboard.jsp"); // Redirect to the admin dashboard
    } 
    // Check if email and password are provided for regular users
    else if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
        UserDao userDao = new UserDao();
        UserBean user = null;

        try {
            user = userDao.getUserByEmailAndPassword(email, password); // Get user from database

            if (user != null) {
                // If user found and password matches
                if (BCrypt.checkpw(password, user.getPassword())) {
                    // Check if the user is active
                    if (user.getIsActive() == 1) {
                        session.setAttribute("email", email); // Set user session attribute
                        response.sendRedirect("home.jsp"); // Redirect to home page
                    } else {
                        out.println("<div class='alert alert-danger'>Your account is inactive. Please contact support.</div>");
                    }
                } else {
                    out.println("<div class='alert alert-danger'>Incorrect password.</div>");
                }
            } else {
                out.println("<div class='alert alert-danger'>User not found. Please register.</div>");
            }
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    } else {
        out.println("<div class='alert alert-danger'>Email and password are required.</div>");
    }
%>
 