<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Car</title>
</head>
<body>
    <h1>Add Car</h1>
    <form action="car" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="add">
        Car Name: <input type="text" name="carName" required><br>
        Number Plate: <input type="text" name="numberPlate" required><br>
        AC Fare Per Km: <input type="number" step="0.01" name="acFarePerKm" required><br>
        Non-AC Fare Per Km: <input type="number" step="0.01" name="nonAcFarePerKm" required><br>
        AC Fare Per Day: <input type="number" step="0.01" name="acFarePerDay" required><br>
        Non-AC Fare Per Day: <input type="number" step="0.01" name="nonAcFarePerDay" required><br>
        Car Photo: <input type="file" name="carPhoto" required><br>
        Status: 
        <select name="status" required>
            <option value="available">Available</option>
            <option value="booked">Booked</option>
        </select><br>
        <button type="submit">Submit</button>
    </form>
    <br>
    <a href="car"><button>Back to Car Management</button></a>
</body>
</html>