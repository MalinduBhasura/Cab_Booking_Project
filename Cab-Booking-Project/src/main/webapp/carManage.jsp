<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car, java.util.List" %>
<%
    List<Car> cars = (List<Car>) request.getAttribute("cars");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Car Management</h1>
        <a href="carAdd.jsp" class="btn btn-primary">Add New Car</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Car ID</th>
                    <th>Model Name</th>
                    <th>Car Photo</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (cars != null) { %>
                    <% for (Car car : cars) { %>
                    <tr>
                        <td><%= car.getCarId() %></td>
                        <td><%= car.getModelName() %></td>
                        <td><img src="<%= car.getCarPhoto() %>" width="100"></td>
                        <td><%= car.getStatus() %></td>
                        <td>
                            <a href="car?action=edit&carId=<%= car.getCarId() %>" class="btn btn-warning">Edit</a>
                            <a href="car?action=delete&carId=<%= car.getCarId() %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="5" class="text-center">No cars found.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <a href="adminDashboard.jsp" class="text-decoration-none">Go to Admin Dashboard</a>
    </div>
</body>
</html>