<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Car, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .sidebar {
            height: 100vh;
            background: #343a40;
            color: white;
            padding-top: 20px;
            position: fixed;
            width: 250px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h3 {
            font-size: 1.5rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background: #495057;
            transform: translateX(5px);
        }

        .sidebar a i {
            font-size: 18px;
        }

        .content {
            margin-left: 260px;
            padding: 20px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background: #007bff;
            color: white;
            border-radius: 15px 15px 0 0;
        }

        .btn-light {
            background-color: #f8f9fa;
            border: none;
        }

        .btn-light:hover {
            background-color: #e2e6ea;
        }

        .search-form {
            margin-bottom: 20px;
        }

        .search-form input {
            width: 200px;
            display: inline-block;
        }

        .search-form button {
            display: inline-block;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Mega City Cab</h3>
        <a href="${pageContext.request.contextPath}/adminDashboard.jsp">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/car">
            <i class="fas fa-car"></i> Manage Cars
        </a>
        <a href="${pageContext.request.contextPath}/AdminDashboard/driver">
            <i class="fas fa-users"></i> Manage Drivers
        </a>
        <a href="${pageContext.request.contextPath}/AdminDashboard/view_booking.jsp">
            <i class="fas fa-list"></i> View Bookings
        </a>
        <a href="${pageContext.request.contextPath}/logout">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h3 class="mb-0">Car Management</h3>
                        </div>
                        <div class="card-body">
                            <!-- Bookings Table -->
                            <table class="table table-striped">
                                <thead>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>