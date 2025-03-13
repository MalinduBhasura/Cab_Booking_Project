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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Mega City Cab</h3>
        <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="car"><i class="fas fa-car"></i> Manage Cars</a>
        <a href="/Cab-Booking-Project/AdminDashboard/driver"><i class="fas fa-users"></i> Manage Drivers</a>
        <a href="/Cab-Booking-Project/AdminDashboard/view_booking.jsp"><i class="fas fa-list"></i> View Bookings</a>
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Welcome Banner -->
        <div class="welcome-banner">
            <h1>Welcome, Admin!</h1>
            <p>Manage your fleet and bookings efficiently with Mega City Cab.</p>
        </div>

        <!-- Cards Section -->
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-gradient-success">
                    <div class="card-body">
                        <h4><i class="fas fa-car"></i> Manage Cars</h4>
                        <p>View and manage all registered cars.</p>
                        <a href="car" class="btn btn-light">View Cars</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-gradient-info">
                    <div class="card-body">
                        <h4><i class="fas fa-users"></i> Manage Drivers</h4>
                        <p>View and manage all registered drivers.</p>
                        <a href="/Cab-Booking-Project/AdminDashboard/driver" class="btn btn-light">View Drivers</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-gradient-warning">
                    <div class="card-body">
                        <h4><i class="fas fa-list"></i> View Bookings</h4>
                        <p>View and manage all bookings.</p>
                        <a href="/Cab-Booking-Project/AdminDashboard/view_booking.jsp" class="btn btn-light">View Bookings</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>