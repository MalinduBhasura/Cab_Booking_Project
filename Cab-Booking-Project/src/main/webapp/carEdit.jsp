<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Car</title>
</head>
<body>
    <h1>Edit Car</h1>
    <%
        Car car = (Car) request.getAttribute("car");
        if (car != null) {
    %>
    <form action="car" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="carId" value="<%= car.getCarId() %>">
        Car Name: <input type="text" name="carName" value="<%= car.getCarName() %>" required><br>
        Number Plate: <input type="text" name="numberPlate" value="<%= car.getNumberPlate() %>" required><br>
        AC Fare Per Km: <input type="number" step="0.01" name="acFarePerKm" value="<%= car.getAcFarePerKm() %>" required><br>
        Non-AC Fare Per Km: <input type="number" step="0.01" name="nonAcFarePerKm" value="<%= car.getNonAcFarePerKm() %>" required><br>
        AC Fare Per Day: <input type="number" step="0.01" name="acFarePerDay" value="<%= car.getAcFarePerDay() %>" required><br>
        Non-AC Fare Per Day: <input type="number" step="0.01" name="nonAcFarePerDay" value="<%= car.getNonAcFarePerDay() %>" required><br>
        Car Photo: <input type="file" name="carPhoto"><br>
        Status: 
        <select name="status" required>
            <option value="available" <%= car.getStatus().equals("available") ? "selected" : "" %>>Available</option>
            <option value="booked" <%= car.getStatus().equals("booked") ? "selected" : "" %>>Booked</option>
        </select><br>
        <button type="submit">Update</button>
    </form>
    <%
        }
    %>
    <br>
    <a href="car"><button>Back to Car Management</button></a>
</body>
</html>