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
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff !important;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff !important;
        }
        .navbar-brand:hover {
            opacity: 0.8;
        }
        .nav-link {
            color: #fff !important;
            font-size: 1rem;
            margin: 0 10px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px; /* Space between icon and text */
        }
        .nav-link:hover {
            color: #f8f9fa !important;
            opacity: 0.8;
            transform: translateY(-2px); /* Slight lift on hover */
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 1)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            color: #fff !important;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px; /* Space between icon and text */
        }
        .logout-btn:hover {
            background-color: #c82333;
            transform: translateY(-2px); /* Slight lift on hover */
        }
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .table th {
            background-color: #007bff;
            color: #fff;
        }
        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <!-- Brand/Logo -->
            <a class="navbar-brand" href="#">
                <i class="fas fa-car"></i> Car Booking
            </a>

            <!-- Toggle Button for Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/customerDashboard">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails">
                            <i class="fas fa-list"></i> Booking Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CustomerDashboard/returnBooking">
                            <i class="fas fa-undo"></i> Return Booking
                        </a>
                    </li>
                    <!-- Logout Button -->
                    <li class="nav-item">
                        <a class="nav-link logout-btn" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
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

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>