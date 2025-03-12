<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Driver, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Driver Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Mega City Cab</h3>
        <a href="${pageContext.request.contextPath}/adminDashboard.jsp">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/car">
            <i class="fas fa-car"></i> Manage Cars
        </a>
        <a href="${pageContext.request.contextPath}/AdminDashboard/driver">
            <i class="fas fa-users"></i> Manage Drivers
        </a>
        <a href="${pageContext.request.contextPath}/AdminDashboard/view_booking.jsp">
            <i class="fas fa-list"></i> View Bookings
        </a>
        <a href="${pageContext.request.contextPath}/logout">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h3 class="mb-0">Driver Management</h3>
                        </div>
                        <div class="card-body">
                            <!-- Bookings Table -->
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
                                    if (drivers != null && !drivers.isEmpty()) {
                                        for (Driver driver : drivers) {
                                    %>
                                    <tr>
                                        <td><%= driver.getDriverId() %></td>
                                        <td><%= driver.getDriverName() %></td>
                                        <td><%= driver.getPhone() %></td>
                                        <td><%= driver.getAddress() %></td>
                                        <td>
                                            <span class="badge <%= driver.getStatus().equals("available") ? "bg-success" : "bg-danger" %>">
                                                <%= driver.getStatus() %>
                                            </span>
                                        </td>
                                        <td>
                                            <a href="driver?action=edit&driverId=<%= driver.getDriverId() %>" class="btn btn-warning btn-sm btn-action">Edit</a>
                                            <a href="driver?action=delete&driverId=<%= driver.getDriverId() %>" class="btn btn-danger btn-sm btn-action">Delete</a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="6" class="text-center">No drivers found.</td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                            <div class="text-center">
                                <a href="driverAdd.jsp" class="btn btn-primary btn-add-car">Add Driver</a>
                            </div>
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