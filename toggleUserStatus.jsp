<%@ page import="dao.UserDao" %>
<%@ page import="bean.UserBean" %>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<%
    // Get the userId and the selected status from the form submission
    String userIdStr = request.getParameter("userId");
    String statusStr = request.getParameter("status");  // Status (1 for active, 0 for inactive)
    
    if (userIdStr != null && statusStr != null) {
        int userId = Integer.parseInt(userIdStr);
        int status = Integer.parseInt(statusStr);  // Convert status to int (1 or 0)
        
        // Create UserDao instance to call the method for updating the user's status
        UserDao userDao = new UserDao();
        userDao.updateUserStatus(userId, status);  // Update the status in the database
    }

    // Redirect back to user management page to show updated status
    response.sendRedirect("userManage.jsp");
%>
