<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Driver, java.util.List" %>

<%
    List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Driver Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
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
    <td><%= driver.getStatus() %></td>
                                <td>
                                    <a href="driver?action=edit&driverId=<%= driver.getDriverId() %>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="driver?action=delete&driverId=<%= driver.getDriverId() %>" class="btn btn-danger btn-sm">Delete</a>
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
       <a href="${pageContext.request.contextPath}/adminDashboard.jsp" class="btn btn-secondary mt-3">Back to Admin Dashboard</a>

    </div>
</body>
</html>
