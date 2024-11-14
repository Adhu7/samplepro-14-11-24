<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

//HttpSession httpsession = request.getSession();
//httpsession.setAttribute("user", user);
String email=(String)session.getAttribute("email");

out.print(email);

session.invalidate();
response.sendRedirect("log.jsp");


%>

</body>
</html>