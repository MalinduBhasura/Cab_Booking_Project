<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Driver, java.util.List" %>

<%
    List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Driver Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-action {
            margin: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow-lg">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h3 class="mb-0">Driver Management</h3>
                <a href="driverAdd.jsp" class="btn btn-light btn-sm">Add Driver</a>
            </div>
            <div class="card-body">
                <table class="table table-hover table-striped">
                    <thead class="table-dark">
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
                        <% if (drivers != null && !drivers.isEmpty()) { %>
                            <% for (Driver driver : drivers) { %>
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
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="6" class="text-center">No drivers found.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/adminDashboard.jsp" class="btn btn-secondary">Back to Admin Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>