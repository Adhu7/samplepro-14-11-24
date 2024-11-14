<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        footer {
            background-color: #f8f9fa;
            padding: 1rem 0;
            text-align: center;
        }
        .navbar .nav-item {
            padding-right: 20px;
        }
        .orders-table td, .orders-table th {
            vertical-align: middle;
        }
        .order-details-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
        }
        .order-details-btn:hover {
            background-color: #0056b3;
        }
        .orders-summary {
            border-left: 2px solid #f1f1f1;
            padding-left: 20px;
        }
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .summary-item h5 {
            margin-bottom: 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <h3>Artevo</h3>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
                <!-- User Dropdown -->
                <!-- <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        User
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                        <li><a class="dropdown-item" href="orders.jsp">Orders</a></li>
                       
                    </ul>
                </li> -->
            </ul>
        </div>
    </div>
</nav>

<!-- Orders Section -->
<div class="container py-5">
    <h2 class="text-center mb-4">Your Orders</h2>
    
    <!-- Orders Table -->
    <table class="table table-bordered orders-table">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Date</th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the user's orders -->
            <c:forEach var="order" items="${userOrders}">
                <tr>
                    <td>${order.productName}</td> <!-- Replaced Order ID with Product Name -->
                    <td>${order.date}</td>
                    <td>Rs. ${order.totalPrice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Summary Section (Optional for user to view their total spending or any other important information) -->
    <%-- <div class="orders-summary">
        <h4>Summary</h4>
        <div class="summary-item">
            <h5>Total Orders</h5>
            <span>${totalOrders}</span>
        </div>
        <div class="summary-item">
            <h5>Total Spend</h5>
            <span>Rs. ${totalSpend}</span>
        </div>
    </div> --%>
</div>
<div style="height: 400px"></div>
<!-- Footer -->
<footer class="text-center mt-5 py-3">
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
