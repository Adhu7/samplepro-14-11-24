<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="ISO-8859-1">
    <title>Register</title>
    <script type="text/javascript">
        function registerValidation() {
            var name = document.getElementById("name").value;
            var phone = document.getElementById("phone").value;
            var email = document.getElementById("email").value;
            var pwd = document.getElementById("pwd").value;
            var rpwd = document.getElementById("rpwd").value;
            var nameRegex = /^[A-Za-z\s]+$/;
            var phoneRegex = /^(\\+91|91)?[6-9][0-9]{9}$/;
            var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;
            
            if (name == '') {
                alert("Please enter your name");
                document.getElementById("name").focus();
                return false;
            }
            if (!nameRegex.test(name)) {
                alert("Please enter a valid name");
                document.getElementById("name").focus();
                return false;
            }
            if (phone == '') {
                alert("Please enter your phone number");
                document.getElementById("phone").focus();
                return false;
            }
            if (!phoneRegex.test(phone)) {
                alert("Please enter a valid number");
                document.getElementById("phone").focus();
                return false;
            }
            if (email == '') {
                alert("Please enter your email");
                document.getElementById("email").focus();
                return false;
            }
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email");
                document.getElementById("email").focus();
                return false;
            }
            if (pwd == '') {
                alert("Please enter your password");
                document.getElementById("pwd").focus();
                return false;
            }
            if (!passwordRegex.test(pwd)) {
                alert("Password should contain at least 1 uppercase, lowercase, special character, and be 8-12 characters long");
                document.getElementById("pwd").focus();
                return false;
            }
            if (rpwd == '') {
                alert("Please re-enter your password");
                document.getElementById("rpwd").focus();
                return false;
            }
            if (pwd != rpwd) {
                alert("Password doesn't match");
                document.getElementById("rpwd").focus();
                return false;
            }
            return true;
        }
        
        function togglePassword(id) {
            const passwordField = document.getElementById(id);
            const icon = document.getElementById(id + '-toggle');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>
    <style type="text/css">
        .password-container {
            position: relative;
            width: 100%;
        }
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #444444;
        }
    </style>
</head>
<body>
<div class="bg-light py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
        <div class="bg-white p-4 p-md-5 rounded shadow-sm">
          <div class="row">
            <div class="col-12">
              <div class="mb-5">
                <h3>Registration</h3>
              </div>
            </div>
          </div>
          <form action="registerAction.jsp" method="post" onsubmit="return registerValidation()">
            <div class="row gy-3 gy-md-4 overflow-hidden">
              <div class="col-12">
                <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="name" id="name">
              </div>
              <div class="col-12">
                <label for="phone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                <input type="tel" class="form-control" name="phone" id="phone">
              </div>
              <div class="col-12">
                <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
              </div>
              <div class="col-12">
                <label for="pwd" class="form-label">Password <span class="text-danger">*</span></label>
                <div class="password-container">
                  <input type="password" class="form-control" name="pwd" id="pwd">
                  <i id="pwd-toggle" class="fas fa-eye password-toggle" onclick="togglePassword('pwd')"></i>
                </div>
              </div>
              <div class="col-12">
                <label for="rpwd" class="form-label">Re-enter Password <span class="text-danger">*</span></label>
                <div class="password-container">
                  <input type="password" class="form-control" name="rpwd" id="rpwd">
                  <i id="rpwd-toggle" class="fas fa-eye password-toggle" onclick="togglePassword('rpwd')"></i>
                </div>
              </div>
              <div class="col-12">
                <div class="d-grid">
                  <button class="btn btn-lg btn-primary" type="submit">Register</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
