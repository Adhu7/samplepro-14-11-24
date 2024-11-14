<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .checkout-form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .checkout-btn {
            background-color: #007bff;
            border: none;
            width: 100%;
            padding: 12px;
            color: white;
        }
        .checkout-btn:hover {
            background-color: #0056b3;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        footer {
            background-color: #f8f9fa;
            padding: 1rem 0;
            text-align: center;
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
                    <a class="nav-link" href="shoppingCart.jsp">Shopping Cart</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Checkout Form Section -->
<div class="container py-5">
    <h2 class="text-center mb-4">Checkout</h2>
    <div class="checkout-form">
        <form action="processCheckout.jsp" method="post">
            <h4>Shipping Information</h4>
            
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="address">Shipping Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
            </div>
            
            <hr>
            
            <!-- <h4>Payment Method</h4>
            <div class="form-group">
                <label for="paymentMethod">Choose Payment Method</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                    <option value="" disabled selected>Select payment method</option>
                    <option value="creditCard">Credit Card</option>
                    <option value="paypal">PayPal</option>
                    <option value="cod">Cash on Delivery</option>
                </select>
            </div>
            
            <hr> -->
            
            <h4>Order Summary</h4>
            <div class="form-group">
                <p><strong>Subtotal:</strong> Rs. ${subtotal}</p>
                <p><strong>Tax (10%):</strong> Rs. ${tax}</p>
                <p><strong>Shipping:</strong> Rs. ${shipping}</p>
                <p><strong>Total:</strong> Rs. ${totalPrice}</p>
            </div>
            
            <button type="submit" class="btn checkout-btn">Complete Purchase</button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="text-center mt-5 py-3">
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>