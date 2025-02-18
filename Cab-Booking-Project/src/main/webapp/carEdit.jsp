<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car" %>
<%
    Car car = (Car) request.getAttribute("car");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Edit Car</h1>
        <form action="car" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="carId" value="<%= car.getCarId() %>">
            <input type="hidden" name="existingPhoto" value="<%= car.getCarPhoto() %>">
            <div class="mb-3">
                <label for="car_brand" class="form-label">Car Brand</label>
                <input type="text" class="form-control" id="car_brand" name="car_brand" value="<%= car.getCar_brand() %>" required>
            </div>
            <div class="mb-3">
                <label for="modelName" class="form-label">Model Name</label>
                <input type="text" class="form-control" id="modelName" name="modelName" value="<%= car.getModelName() %>" required>
            </div>
            <div class="mb-3">
                <label for="carPhoto" class="form-label">Car Photo</label>
                <input type="file" class="form-control" id="carPhoto" name="carPhoto" accept="image/*">
                <img src="<%= car.getCarPhoto() %>" width="100" class="mt-2">
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="available" <%= car.getStatus().equals("available") ? "selected" : "" %>>Available</option>
                    <option value="booked" <%= car.getStatus().equals("booked") ? "selected" : "" %>>Booked</option>
                </select>
            </div>
            <div class="mb-3">
    <label for="ratePerKm" class="form-label">Rate Per KM</label>
    <input type="number" class="form-control" id="ratePerKm" name="ratePerKm" value="<%= car.getRatePerKm() %>" step="0.01" required>
</div>
<div class="mb-3">
    <label for="ratePerDay" class="form-label">Rate Per Day</label>
    <input type="number" class="form-control" id="ratePerDay" name="ratePerDay" value="<%= car.getRatePerDay() %>" step="0.01" required>
</div>
            <button type="submit" class="btn btn-primary">Update Car</button>
        </form>
    </div>
</body>
</html>