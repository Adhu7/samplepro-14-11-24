<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/boot/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <meta charset="ISO-8859-1">
    <title>Forgot Password</title>
    <script type="text/javascript">
        function validateEmail() {
            var email = document.getElementById("email").value;
            var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
            if (email === '') {
                alert("Please enter your email");`
                document.getElementById("email").focus();
                return false;
            }
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email");
                document.getElementById("email").focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="bg-light py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-12 col-md-8 col-lg-6">
        <div class="bg-white p-4 p-md-5 rounded shadow-sm">
          <h3>Forgot Password</h3>
          <p class="mb-4">Enter your email address to receive a password reset link.</p>
          <form action="#!" method="" onsubmit="return validateEmail()">
            <div class="mb-3">
              <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
              <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
            </div>
            <div class="d-grid">
              <button class="btn btn-lg btn-primary" type="submit">Send Reset Link</button>
            </div>
          </form>
          <hr class="my-4">
          <div class="d-flex gap-2 flex-column flex-md-row justify-content-md-end">
            <a href="log.jsp" class="link-secondary text-decoration-none">Back to Login</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="./boot/js/bootstrap.bundle.min.js"></script>
</body>
</html>
