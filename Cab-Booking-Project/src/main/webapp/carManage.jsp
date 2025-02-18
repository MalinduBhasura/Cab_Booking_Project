<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car, java.util.List" %>

<%
    List<Car> cars = (List<Car>) request.getAttribute("cars");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Car Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h3 class="mb-0">Car Management</h3>
                <a href="carAdd.jsp" class="btn btn-light btn-sm">Add Car</a>
            </div>
            <div class="card-body">
                <table class="table table-hover table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Car ID</th>
                            <th> Car Brand</th>
                            <th>Car Model</th>
                            <th>Car Photo</th>
                            <th>Status</th>
                            <th>Rate Per KM</th>
                            <th>Rate Per Day</th>
                            <th>Actions</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% if (cars != null && !cars.isEmpty()) { %>
                            <% for (Car car : cars) { %>
                            <tr>
                                <td><%= car.getCarId() %></td>
                                <td><%= car.getCar_brand() %></td>
                                <td><%= car.getModelName() %></td>
                                <td><img src="<%= car.getCarPhoto() %>" class="img-thumbnail" width="100"></td>
                                <td><%= car.getStatus() %></td>
                                <td><%= car.getRatePerKm() %></td>
                                <td><%= car.getRatePerDay() %></td>
                                <td>
                                    <a href="car?action=edit&carId=<%= car.getCarId() %>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="car?action=delete&carId=<%= car.getCarId() %>" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="5" class="text-center">No cars available.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <a href="adminDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>
</body>
</html>
