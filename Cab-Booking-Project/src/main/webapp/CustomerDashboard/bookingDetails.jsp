<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="com.cab_booking.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
if (session == null || session.getAttribute("user") == null || !"customer".equals(session.getAttribute("userType"))) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
int customerId = (int) session.getAttribute("customerId");
List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg">
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
        <h1 class="text-center mb-4">Booking Details</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Customer</th>
                    <th>Car</th>
                    <th>Driver</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Car Type</th>
                    <th>Booking Type</th>
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
                            <td><%= booking.getBookingType() %></td>
                            <td><%= booking.getTotalAmount() %></td>
                        </tr>
                <%  } 
                } else { %>
                    <tr>
                        <td colspan="9" class="text-center">No bookings available</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>