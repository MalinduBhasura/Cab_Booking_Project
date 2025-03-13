<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%@ page import="com.cab_booking.model.Customer" %>
<%@ page import="java.util.List" %>
<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>
<html>
<head>
    <title>View Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">All Bookings</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    
                    <th>Customer Name</th>
                    <th>Pickup Location</th>
                    <th>Billing Type</th>
                    <th>Total Cost</th>
                </tr>
            </thead>
            <tbody>
           <% for (Booking booking : bookings) { %>
    <tr>
        <td><%= booking.getBookingId() %></td>
        <td><%= booking.getCustomer().getCustomerId() %></td>
        <td><%= booking.getCustomer().getName() %></td>
        <td><%= booking.getPickupLocation() %></td>
        <td><%= booking.getBillingType() %></td>
        <td>Rs. <%= booking.getTotalCost() %></td>
    </tr>
<% } %>
            </tbody>
        </table>
    </div>
</body>
</html>