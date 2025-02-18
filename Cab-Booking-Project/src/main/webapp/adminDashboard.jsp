<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("user");
    if (admin == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
            width: 250px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px;
            display: block;
            font-size: 18px;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Mega City Cab</h3>
        <a href="#">Dashboard</a>
        <a href="car">Manage Cars</a>
        <a href="/Cab-Booking-Project/AdminDashboard/driver">Manage Drivers</a>
        <a href="logout">Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h3 class="mb-0">Welcome, Admin!</h3>
                        </div>
                        <div class="card-body">
                            <p><strong>Username:</strong> <%= admin.getUsername() %></p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card text-white bg-success shadow">
                        <div class="card-body">
                            <h5 class="card-title">Total Cars</h5>
                            <p class="card-text">Manage all registered cars.</p>
                            <a href="car" class="btn btn-light">View Cars</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-info shadow">
                        <div class="card-body">
                            <h5 class="card-title">Total Drivers</h5>
                            <p class="card-text">Manage all drivers.</p>
                            <a href="/Cab-Booking-Project/AdminDashboard/driver" class="btn btn-light">View Drivers</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-warning shadow">
                        <div class="card-body">
                            <h5 class="card-title">Total Bookings</h5>
                            <p class="card-text">View and manage bookings.</p>
                            <a href="#" class="btn btn-light">View Bookings</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>