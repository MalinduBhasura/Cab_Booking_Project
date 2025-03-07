<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%@ page import="java.util.List" %>
<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Return Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Return Booking</h1>

        <!-- Display message -->
        <% if (message != null) { %>
            <div class="alert alert-info">
                <%= message %>
            </div>
        <% } %>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Car ID</th>
                    <th>Driver ID</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Total Amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if (bookings != null && !bookings.isEmpty()) {
                    for (Booking booking : bookings) { %>
                <tr id="row-<%= booking.getBookingId() %>">
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getCarId() %></td>
                    <td><%= booking.getDriverId() %></td>
                    <td><%= booking.getStartDate() %></td>
                    <td><%= booking.getEndDate() %></td>
                    <td><%= booking.getTotalAmount() %></td>
                    <td>
                        <!-- Form for returning a booking -->
                        <form action="${pageContext.request.contextPath}/CustomerDashboard/returnBooking" method="post" style="display: inline;">
                            <input type="hidden" name="booking_id" value="<%= booking.getBookingId() %>">
                            <button type="submit" class="btn btn-danger">Return</button>
                        </form>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="7" class="text-center">No active bookings found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>