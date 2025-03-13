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
<head>
    <meta charset="UTF-8">
    <title>Car Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
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
                                        <th>Order Number</th>
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