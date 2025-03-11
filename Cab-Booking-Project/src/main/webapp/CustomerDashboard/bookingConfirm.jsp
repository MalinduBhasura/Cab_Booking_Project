<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%
    Booking booking = (Booking) request.getAttribute("booking");
    Boolean discountApplied = (Boolean) request.getAttribute("discountApplied");
    if (discountApplied == null) {
        discountApplied = false;
    }

    // Set the booking object in the session
    if (booking != null) {
        session.setAttribute("booking", booking);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .confirmation-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .confirmation-card h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .confirmation-card .alert {
            font-size: 1.1rem;
            padding: 15px;
            border-radius: 5px;
        }
        .confirmation-card .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
        .confirmation-card .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="confirmation-card">
        <h1 class="text-center">Booking Confirmation</h1>
        <% if (discountApplied) { %>
            <div class="alert alert-success" role="alert">
                You received a 30% discount on your booking!
            </div>
        <% } %>
        <% if (booking == null) { %>
            <div class="alert alert-danger" role="alert">
                Booking details not found. Please try again.
            </div>
        <% } else { %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Booking Details</h5>
                    <p class="card-text">
                        <strong>Order Number:</strong> <%= booking.getBookingId() %><br>
                        <strong>Car ID:</strong> <%= booking.getCarId() %><br>
                        <strong>Driver ID:</strong> <%= booking.getDriverId() %><br>
                        <strong>Start Date:</strong> <%= booking.getStartDate() %><br>
                        <strong>End Date:</strong> <%= booking.getEndDate() %><br>
                        <strong>Car Type:</strong> <%= booking.getCarType() %><br>
                        <strong>Fare:</strong> Rs. <%= booking.getFare() %><br>
                        <strong>Booking Type:</strong> <%= booking.getBookingType() %><br>
                        <strong>Estimated KM:</strong> <%= booking.getEstimatedKm() %><br>
                        <strong>Total Days:</strong> <%= booking.getTotalDays() %><br>
                        <strong>Total Amount:</strong> Rs. <%= booking.getTotalAmount() %><br>
                    </p>
                    <!-- Add the Download PDF Button -->
                    <a href="${pageContext.request.contextPath}/downloadInvoice" class="btn btn-primary mt-3">Download PDF</a>
                    <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails" class="btn btn-secondary mt-3">View All Bookings</a>
                </div>
            </div>
        <% } %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>