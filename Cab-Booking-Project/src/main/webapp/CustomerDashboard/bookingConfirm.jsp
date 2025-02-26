<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Booking" %>
<%
    Booking booking = (Booking) request.getAttribute("booking");
    if (booking == null) {
        response.sendRedirect(request.getContextPath() + "/CustomerDashboard");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Confirmation</title>
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
        <h1 class="text-center mb-4">Booking Confirmation</h1>
        <div class="alert alert-success text-center" role="alert">
            Booking Successfully Confirmed!
        </div>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Booking Details</h5>
                <p class="card-text">
                    <strong>Order Number:</strong> <%= booking.getBookingId() %><br>
                    <strong>Customer ID:</strong> <%= booking.getCustomerId() %><br>
                    <strong>Car ID:</strong> <%= booking.getCarId() %><br>
                    <strong>Driver ID:</strong> <%= booking.getDriverId() %><br>
                    <strong>Start Date:</strong> <%= booking.getStartDate() %><br>
                    <strong>End Date:</strong> <%= booking.getEndDate() %><br>
                    <strong>Car Type:</strong> <%= booking.getCarType() %><br>
                    <strong>Fare:</strong> <%= booking.getFare() %><br>
                    <strong>Booking Type:</strong> <%= booking.getBookingType() %><br>
                    <strong>Estimated KM:</strong> <%= booking.getEstimatedKm() == 0 ? "-" : booking.getEstimatedKm() %><br>
                    <strong>Total Days:</strong> <%= booking.getTotalDays() == 0 ? "-" : booking.getTotalDays() %><br>
                    <strong>Total Amount:</strong> <%= booking.getTotalAmount() %><br>
                </p>
                <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails" class="btn btn-primary">View All Bookings</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>