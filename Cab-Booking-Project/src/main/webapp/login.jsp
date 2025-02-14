<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
                        <h3 class="card-title text-center">Login</h3>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" action="login" method="post" onsubmit="return validateForm()">
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
                                <button type="submit" class="btn btn-primary">Login</button>
                                <button type="button" class="btn btn-secondary" onclick="clearForm()">Clear</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="signup.jsp" class="text-decoration-none">Don't have an account? Sign Up</a>
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
            const username = document.getElementById("username").value.trim();
            const password = document.getElementById("password").value.trim();
            let isValid = true;

            // Clear previous error messages
            document.getElementById("usernameError").textContent = "";
            document.getElementById("passwordError").textContent = "";

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
            document.getElementById("loginForm").reset();
            document.getElementById("usernameError").textContent = "";
            document.getElementById("passwordError").textContent = "";
        }
    </script>
</body>
</html>