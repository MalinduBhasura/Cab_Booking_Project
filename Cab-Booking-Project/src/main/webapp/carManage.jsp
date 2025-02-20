<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-action {
            margin: 2px;
        }
        .btn-add-car {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Car Management</h1>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
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
            </thead>
            <tbody>
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
                    <td><img src="<%= car.getCarPhoto() %>" width="100" class="img-thumbnail"></td>
                    <td><span class="badge <%= car.getStatus().equals("available") ? "bg-success" : "bg-danger" %>"><%= car.getStatus() %></span></td>
                    <td>
                        <a href="car?action=edit&carId=<%= car.getCarId() %>" class="btn btn-warning btn-sm btn-action">Edit</a>
                        <form action="car" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="carId" value="<%= car.getCarId() %>">
                            <button type="submit" class="btn btn-danger btn-sm btn-action">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="10" class="text-center">No cars available</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="text-center">
            <a href="carAdd.jsp" class="btn btn-primary btn-add-car">Add Car</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>