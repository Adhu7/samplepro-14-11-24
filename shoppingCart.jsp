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
    <title>Shopping Cart</title>
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
        .cart-table td, .cart-table th {
            vertical-align: middle;
        }
        .cart-table .product-img {
            width: 120px; /* Adjusted to a medium size */
            height: auto;
        }
        .cart-summary {
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
        .checkout-btn {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            width: 100%;
            padding: 12px;
            color: #0a0a0a;
        }
        .checkout-btn:hover {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        .cart-total {
            font-weight: bold;
            font-size: 18px;
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
                    <a class="nav-link active" href="cart.jsp">Shopping Cart</a>
                </li>
                
            </ul>
        </div>
    </div>
</nav>

<!-- Shopping Cart Section -->
<div class="container py-5">
    <h2 class="text-center mb-4">Your Shopping Cart</h2>

    <form action="payment.jsp" method="post">
        <div class="row">
            <!-- Cart Items Section -->
            <div class="col-md-8">
                <table class="table table-bordered cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through cart items -->
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>
                                    <div class="d-flex">
                                        <!-- Display medium-sized image -->
                                        <img src="${item.imageUrl}" alt="${item.name}" class="product-img me-3">
                                        <div>
                                            <h5>${item.name}</h5>
                                            <p class="text-muted">${item.artist}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>Rs. ${item.price}</td>
                                
                                
                                <td>
                                    <button type="submit" name="remove_${item.id}" class="btn btn-danger">Remove</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Cart Summary Section -->
            <div class="col-md-4 cart-summary">
                <h4>Cart Summary</h4>
                <div class="summary-item">
                    <h5>Subtotal</h5>
                    <span class="cart-total">Rs. ${subtotal}</span>
                </div>
                <div class="summary-item">
                    <h5>Tax (10%)</h5>
                    <span>Rs. ${tax}</span>
                </div>
                <div class="summary-item">
                    <h5>Shipping</h5>
                    <span>Rs. ${shipping}</span>
                </div>
                <hr>
                <div class="summary-item">
                    <h5>Total</h5>
                    <span class="cart-total">Rs. ${totalPrice}</span>
                </div>

                <!-- Checkout Button -->
                <div class="mt-4">
                    <button type="submit" class="btn checkout-btn">Proceed to Checkout</button>
                </div>
            </div>
        </div>
    </form>
</div>
<div style="height: 400px"></div>
<!-- Footer -->
<footer class="text-center mt-5 py-3">
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 