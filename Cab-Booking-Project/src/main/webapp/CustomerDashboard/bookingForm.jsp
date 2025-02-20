<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="com.cab_booking.model.Driver" %>
<%@ page import="com.cab_booking.dao.CarDAO" %>
<%@ page import="com.cab_booking.dao.DriverDAO" %>
<%
    CarDAO carDAO = new CarDAO();
    List<Car> cars = carDAO.getAllCars();

    DriverDAO driverDAO = new DriverDAO();
    List<Driver> drivers = driverDAO.getAllDrivers();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Form</title>
</head>
<body>
    <h1>Booking Form</h1>
    <form action="booking" method="post">
        Customer ID: <input type="text" name="customer_id" required><br>
        Car: 
        <select name="car_id" required>
            <% for (Car car : cars) { %>
                <option value="<%= car.getCarId() %>"><%= car.getCarName() %> - <%= car.getNumberPlate() %></option>
            <% } %>
        </select><br>
        Driver: 
        <select name="driver_id" required>
            <% for (Driver driver : drivers) { %>
                <option value="<%= driver.getDriverId() %>"><%= driver.getDriverName() %></option>
            <% } %>
        </select><br>
        Start Date: <input type="date" name="start_date" required><br>
        End Date: <input type="date" name="end_date" required><br>
        Booking Type: 
        <select name="booking_type" required>
            <option value="per_km">Per KM</option>
            <option value="per_day">Per Day</option>
        </select><br>
        Estimated KM: <input type="text" name="estimated_km"><br>
        Total Days: <input type="text" name="total_days"><br>
        Fare: <input type="text" name="fare" required><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>