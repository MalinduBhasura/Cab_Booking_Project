<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Booking" %>
<%@ page import="com.cab_booking.service.BookingService" %>
<%@ page import="java.util.List" %>
<%
    // Check if the admin is logged in
  

    // Fetch all bookings
    BookingService bookingService = new BookingService();
    List<Booking> bookings = bookingService.getAllBookings();

    // Get the customerId filter (if any)
    String customerIdFilter = request.getParameter("customerId");
    if (customerIdFilter != null && !customerIdFilter.isEmpty()) {
        int customerId = Integer.parseInt(customerIdFilter);
        bookings = bookingService.getBookingsByCustomerId(customerId);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px;
            display: block;
            font-size: 18px;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #495057;
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
        <a href="#">Dashboard</a>
        <a href="car">Manage Cars</a>
        <a href="/Cab-Booking-Project/AdminDashboard/driver">Manage Drivers</a>
        <a href="logout">Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h3 class="mb-0">View Bookings</h3>
                        </div>
                        <div class="card-body">
                            <!-- Search Form -->
                            <form class="search-form" method="GET" action="view_booking.jsp">
                                <input type="text" name="customerId" class="form-control" placeholder="Search by Customer ID">
                                <button type="submit" class="btn btn-primary">Search</button>
                                <a href="view_booking.jsp" class="btn btn-secondary">Clear</a>
                            </form>

                            <!-- Bookings Table -->
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Booking ID</th>
                                        <th>Customer ID</th>
                                        <th>Car ID</th>
                                        <th>Driver ID</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Car Type</th>
                                        <th>Fare</th>
                                        <th>Booking Type</th>
                                        <th>Estimated KM</th>
                                        <th>Total Days</th>
                                        <th>Total Amount</th>
                                        <th>Status</th> <!-- Add Status column -->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Booking booking : bookings) { %>
                                        <tr>
                                            <td><%= booking.getBookingId() %></td>
                                            <td><%= booking.getCustomerId() %></td>
                                            <td><%= booking.getCarId() %></td>
                                            <td><%= booking.getDriverId() %></td>
                                            <td><%= booking.getStartDate() %></td>
                                            <td><%= booking.getEndDate() %></td>
                                            <td><%= booking.getCarType() %></td>
                                            <td>Rs. <%= booking.getFare() %></td>
                                            <td><%= booking.getBookingType() %></td>
                                            <td><%= booking.getEstimatedKm() %></td>
                                            <td><%= booking.getTotalDays() %></td>
                                            <td>Rs. <%= booking.getTotalAmount() %></td>
                                             <td><%= booking.getStatus() %></td> <!-- Display Status -->
                                            <td>
                                                <form method="POST" action="deleteBooking">
                                                    <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>