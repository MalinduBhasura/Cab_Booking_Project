<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title text-center">Sign Up</h3>
                    </div>
                    <div class="card-body">
                        <form id="signupForm" action="signup" method="post" onsubmit="return validateForm()">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                                <div id="nameError" class="error-message"></div>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                                <div id="emailError" class="error-message"></div>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                                <div id="addressError" class="error-message"></div>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" required>
                                <div id="phoneError" class="error-message"></div>
                            </div>
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                                <div id="usernameError" class="error-message"></div>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                                <div id="passwordError" class="error-message"></div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                                <button type="button" class="btn btn-secondary" onclick="clearForm()">Clear</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="login.jsp" class="text-decoration-none">Already have an account? Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to validate the form
        function validateForm() {
            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const address = document.getElementById("address").value.trim();
            const phone = document.getElementById("phone").value.trim();
            const username = document.getElementById("username").value.trim();
            const password = document.getElementById("password").value.trim();
            let isValid = true;

            // Clear previous error messages
            document.getElementById("nameError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("addressError").textContent = "";
            document.getElementById("phoneError").textContent = "";
            document.getElementById("usernameError").textContent = "";
            document.getElementById("passwordError").textContent = "";

            // Validate name
            if (name === "") {
                document.getElementById("nameError").textContent = "Name is required.";
                isValid = false;
            }

            // Validate email
            if (email === "") {
                document.getElementById("emailError").textContent = "Email is required.";
                isValid = false;
            }

            // Validate address
            if (address === "") {
                document.getElementById("addressError").textContent = "Address is required.";
                isValid = false;
            }

            // Validate phone
            if (phone === "") {
                document.getElementById("phoneError").textContent = "Phone is required.";
                isValid = false;
            }

            // Validate username
            if (username === "") {
                document.getElementById("usernameError").textContent = "Username is required.";
                isValid = false;
            }

            // Validate password
            if (password === "") {
                document.getElementById("passwordError").textContent = "Password is required.";
                isValid = false;
            }

            return isValid;
        }

        // Function to clear the form fields
        function clearForm() {
            document.getElementById("signupForm").reset();
            document.getElementById("nameError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("addressError").textContent = "";
            document.getElementById("phoneError").textContent = "";
            document.getElementById("usernameError").textContent = "";
            document.getElementById("passwordError").textContent = "";
        }
    </script>
</body>
</html>