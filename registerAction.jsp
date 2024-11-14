<%@ page import="bean.UserBean" %>
<%@ page import="dao.UserDao" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt"   %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
String name = request.getParameter("name");
    String phoneStr = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("pwd");
    
    //out.print(name+phoneStr+email+password);
    
    if (name != null && phoneStr != null && email != null && password != null) {
        UserBean user = new UserBean();
        user.setName(name);
        user.setPhone(phoneStr);
        user.setEmail(email);

        // Hash the password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        user.setPassword(hashedPassword);

        UserDao dao = new UserDao();
        try {
            // Check if email already exists
            if (dao.isEmailExists(email)) {
                //response.sendRedirect("register.jsp");
              //  out.println("<script>alert('Email already exists. Please use a different email or log in.');</script>");
            	 out.println("<script>");
                 out.println("alert('Email already exists. Please use a different email or log in.');");
                 out.println("window.location.href = 'register.jsp';"); // Redirects to register.jsp after clicking "OK"
                 out.println("</script>");
            } else {
                // Insert the user and redirect to login page
                dao.insertUsers(user);
                response.sendRedirect("log.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Database error: " + e.getMessage());
        }
    } else {
        out.print("Failed: Missing required parameters.");
    }
%>
   
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
