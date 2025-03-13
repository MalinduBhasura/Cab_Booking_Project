<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cab_booking.model.Driver" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="com.cab_booking.model.Customer" %>
<%@ page import="com.cab_booking.service.DriverService" %>
<%@ page import="com.cab_booking.service.BookingService" %>

<%
    DriverService driverService = new DriverService();
    List<Driver> drivers = driverService.getAvailableDrivers();
    request.setAttribute("drivers", drivers);

    String carId = request.getParameter("carId");
    String carName = URLDecoder.decode(request.getParameter("carName"), "UTF-8");
    String numberPlate = URLDecoder.decode(request.getParameter("numberPlate"), "UTF-8");
    String carPhoto = request.getParameter("carPhoto");
    double acFarePerKm = Double.parseDouble(request.getParameter("acFarePerKm"));
    double nonAcFarePerKm = Double.parseDouble(request.getParameter("nonAcFarePerKm"));
    double acFarePerDay = Double.parseDouble(request.getParameter("acFarePerDay"));
    double nonAcFarePerDay = Double.parseDouble(request.getParameter("nonAcFarePerDay"));

    // Check if the customer is eligible for a discount
    Integer customerId = (Integer) request.getAttribute("customerId");

    // Get number of bookings for the customer
    int numberOfBookings = (customerId != null) ? new BookingService().getNumberOfBookingsByCustomerId(customerId) : 0;

    // Check discount eligibility
    boolean isEligibleForDiscount = numberOfBookings >= 3;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Form</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Arial', sans-serif;
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
        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 50px auto;
        }
        .form-container h1 {
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-container label {
            font-weight: bold;
            color: #333;
        }
        .form-container .form-control {
            border-radius: 10px;
            border: 1px solid #ddd;
        }
        .form-container .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .form-container .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }
        .form-container .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-container .btn-secondary {
            background-color: #6c757d;
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }
        .form-container .btn-secondary:hover {
            background-color: #5a6268;
        }
        .form-container .form-check-input:checked {
            background-color: #007bff;
            border-color: #007bff;
        }
        .form-container .form-check-label {
            color: #333;
        }
    </style>
    <script>
        function updateFare() {
            const carType = document.querySelector('input[name="car_type"]:checked').value;
            const chargeType = document.querySelector('input[name="booking_type"]:checked').value;
            const acFarePerKm = <%= acFarePerKm %>;
            const nonAcFarePerKm = <%= nonAcFarePerKm %>;
            const acFarePerDay = <%= acFarePerDay %>;
            const nonAcFarePerDay = <%= nonAcFarePerDay %>;

            let fare = 0;
            if (chargeType === "Per KM") {
                fare = carType === "AC" ? acFarePerKm : nonAcFarePerKm;
            } else if (chargeType === "Per Day") {
                fare = carType === "AC" ? acFarePerDay : nonAcFarePerDay;
            }
            document.getElementById("fare").value = fare;
            calculateTotalAmount();
        }

        function calculateTotalAmount() {
            const chargeType = document.querySelector('input[name="booking_type"]:checked').value;
            const fare = parseFloat(document.getElementById("fare").value);
            let totalAmount = 0;

            if (chargeType === "Per KM") {
                const estimatedKm = parseFloat(document.getElementById("estimated_km").value);
                totalAmount = fare * estimatedKm;
            } else if (chargeType === "Per Day") {
                const totalDays = parseFloat(document.getElementById("total_days").value);
                totalAmount = fare * totalDays;
            }

            // Apply 30% discount if eligible
            const isEligibleForDiscount = <%= isEligibleForDiscount %>;
            if (isEligibleForDiscount) {
                totalAmount *= 0.70; // 30% discount
            }

            document.getElementById("total_amount").value = totalAmount.toFixed(2);
        }

        function toggleFields() {
            const chargeType = document.querySelector('input[name="booking_type"]:checked').value;
            if (chargeType === "Per KM") {
                document.getElementById("estimated_km").disabled = false;
                document.getElementById("total_days").disabled = true;
                document.getElementById("total_days").value = 0;
            } else if (chargeType === "Per Day") {
                document.getElementById("estimated_km").disabled = true;
                document.getElementById("estimated_km").value = 0;
                document.getElementById("total_days").disabled = false;
                calculateTotalDays(); // Calculate total days when Per Day is selected
            }
            calculateTotalAmount();
        }

        function calculateTotalDays() {
            const startDate = new Date(document.getElementById("start_date").value);
            const endDate = new Date(document.getElementById("end_date").value);
            const timeDiff = endDate - startDate;
            const totalDays = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)); // Convert milliseconds to days
            document.getElementById("total_days").value = totalDays;
            calculateTotalAmount();
        }
    </script>
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

    <div class="container mt-5">
        <div class="form-container">
            <h1>Booking Form</h1>
            <% if (isEligibleForDiscount) { %>
                <div class="alert alert-success" role="alert">
                    You are eligible for a 30% discount on your booking!
                </div>
            <% } %>
            <form action="${pageContext.request.contextPath}/CustomerDashboard/book" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="car_id" value="<%= carId %>">
                <input type="hidden" name="car_name" value="<%= carName %>">
                <input type="hidden" name="number_plate" value="<%= numberPlate %>">
                <input type="hidden" name="car_photo" value="<%= carPhoto %>">

                <!-- Car Details -->
                <div class="mb-3">
                    <label for="car_name" class="form-label">Car:</label>
                    <input type="text" id="car_name" class="form-control" value="<%= carName %> - <%= numberPlate %>" readonly>
                </div>

                <!-- Driver Selection -->
                <div class="mb-3">
                    <label for="driver_id" class="form-label">Driver:</label>
                    <select id="driver_id" name="driver_id" class="form-control" required>
                        <% for (Driver driver : drivers) { %>
                            <option value="<%= driver.getDriverId() %>"><%= driver.getDriverName() %> - <%= driver.getPhone() %></option>
                        <% } %>
                    </select>
                </div>

                <!-- Start Date and End Date -->
                <div class="mb-3">
                    <label for="start_date" class="form-label">Start Date:</label>
                    <input type="date" id="start_date" name="start_date" class="form-control" required onchange="calculateTotalDays()">
                </div>
                <div class="mb-3">
                    <label for="end_date" class="form-label">End Date:</label>
                    <input type="date" id="end_date" name="end_date" class="form-control" required onchange="calculateTotalDays()">
                </div>

                <!-- Charge Type (Per KM / Per Day) -->
                <div class="mb-3">
                    <label class="form-label">Charge Type:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="booking_type" value="Per KM" onclick="toggleFields(); updateFare();">
                        <label class="form-check-label">Per KM</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="booking_type" value="Per Day" onclick="toggleFields(); updateFare();">
                        <label class="form-check-label">Per Day</label>
                    </div>
                </div>

                <!-- Car Type (AC / Non-AC) -->
                <div class="mb-3">
                    <label class="form-label">Car Type:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="car_type" value="AC" onclick="updateFare()">
                        <label class="form-check-label">AC</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="car_type" value="Non-AC" onclick="updateFare()">
                        <label class="form-check-label">Non-AC</label>
                    </div>
                </div>

                <!-- Fare (Auto-filled based on Car Type and Charge Type) -->
                <div class="mb-3">
                    <label for="fare" class="form-label">Fare:</label>
                    <input type="text" id="fare" name="fare" class="form-control" readonly>
                </div>

                <!-- Estimated KM (Enabled only for Per KM) -->
                <div class="mb-3">
                    <label for="estimated_km" class="form-label">Estimated KM:</label>
                    <input type="number" id="estimated_km" name="estimated_km" class="form-control" disabled oninput="calculateTotalAmount()">
                </div>

                <!-- Total Days (Enabled only for Per Day) -->
                <div class="mb-3">
                    <label for="total_days" class="form-label">Total Days:</label>
                    <input type="number" id="total_days" name="total_days" class="form-control" disabled oninput="calculateTotalAmount()">
                </div>

                <!-- Total Amount (Auto-calculated) -->
                <div class="mb-3">
                    <label for="total_amount" class="form-label">Total Amount:</label>
                    <input type="text" id="total_amount" name="total_amount" class="form-control" readonly>
                </div>

                <!-- Submit and Clear Buttons -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Submit Booking</button>
                    <button type="reset" class="btn btn-secondary">Clear Form</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>