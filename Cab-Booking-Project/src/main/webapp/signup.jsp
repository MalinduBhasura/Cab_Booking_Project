<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
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
                        <form id="signupForm" action="signup" method="post" autocomplete="off">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" required autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required autocomplete="off">
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="login.jsp" class="text-decoration-none">Already have an account? Login</a>
                        </div>
                        <% if (request.getParameter("error") != null) { %>
                            <div class="alert alert-danger mt-3">
                                Registration failed. Please try again.
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Display success message if redirected from signup servlet
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            alert("Signup successful! Please login.");
        }
    </script>
</body>
</html>