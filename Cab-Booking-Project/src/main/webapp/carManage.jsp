<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car, java.util.List" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Management</title>
</head>
<body>
    <h1>Car Management</h1>
    <table border="1">
        <tr>
            <th>Car ID</th>
            <th>Car Name</th>
            <th>Number Plate</th>
            <th>AC Fare Per Km</th>
            <th>Non-AC Fare Per Km</th>
            <th>AC Fare Per Day</th>
            <th>Non-AC Fare Per Day</th>
            <th>Car Photo</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <%
            List<Car> cars = (List<Car>) request.getAttribute("cars");
            if (cars != null) {
                for (Car car : cars) {
        %>
        <tr>
            <td><%= car.getCarId() %></td>
            <td><%= car.getCarName() %></td>
            <td><%= car.getNumberPlate() %></td>
            <td><%= car.getAcFarePerKm() %></td>
            <td><%= car.getNonAcFarePerKm() %></td>
            <td><%= car.getAcFarePerDay() %></td>
            <td><%= car.getNonAcFarePerDay() %></td>
            <td><img src="<%= car.getCarPhoto() %>" width="100"></td>
            <td><%= car.getStatus() %></td>
            <td>
                <a href="car?action=edit&carId=<%= car.getCarId() %>">Edit</a>
                <form action="car" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="carId" value="<%= car.getCarId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <br>
    <a href="carAdd.jsp"><button>Add Car</button></a>
</body>
</html>