<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
Integer customerId = (Integer) session.getAttribute("customerId");
if (customerId == null) {
    response.sendRedirect("login.jsp");
    return;
}
System.out.println("Customer ID from session in JSP: " + customerId);

List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-container {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table-container h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Cab Booking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Bookings</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="table-container">
            <h1 class="text-center">Booking Details</h1>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Order Number</th>
                        <th>Customer</th>
                        <th>Car</th>
                        <th>Driver</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Car Type</th>
                        <th>Fare</th>
                        <th>Booking Type</th>
                        <th>Estimated KM</th>
                        <th>Total Days</th>
                        <th>Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (bookings != null && !bookings.isEmpty()) { 
                        for (Booking booking : bookings) { %>
                            <tr>
                                <td><%= booking.getBookingId() %></td>
                                <td><%= booking.getCustomerId() %></td>
                                <td><%= booking.getCarId() %></td>
                                <td><%= booking.getDriverId() %></td>
                                <td><%= booking.getStartDate() %></td>
                                <td><%= booking.getEndDate() %></td>
                                <td><%= booking.getCarType() %></td>
                                <td><%= booking.getFare() %></td>
                                <td><%= booking.getBookingType() %></td>
                                <td><%= booking.getEstimatedKm() == 0 ? "-" : booking.getEstimatedKm() %></td>
                                <td><%= booking.getTotalDays() == 0 ? "-" : booking.getTotalDays() %></td>
                                <td><%= booking.getTotalAmount() %></td>
                            </tr>
                    <%  } 
                    } else { %>
                        <tr>
                            <td colspan="12" class="text-center">No bookings available</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>