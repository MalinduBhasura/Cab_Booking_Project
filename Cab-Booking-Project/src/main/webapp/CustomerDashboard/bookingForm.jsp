<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cab_booking.model.Driver" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="com.cab_booking.model.Customer" %>
<%@ page import="com.cab_booking.service.DriverService" %>
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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Booking Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff; /* White background */
            font-family: 'Arial', sans-serif;
        }
        .form-container {
            background: #ffffff; /* White background for the form */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 50px auto;
        }
        .form-container h1 {
            color: #007bff; /* Blue header */
            margin-bottom: 20px;
            text-align: center;
        }
        .form-container label {
            font-weight: bold;
            color: #333; /* Dark gray text */
        }
        .form-container .form-control {
            border-radius: 10px;
            border: 1px solid #ddd; /* Light gray border */
        }
        .form-container .form-control:focus {
            border-color: #007bff; /* Blue border on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .form-container .btn-primary {
            background-color: #007bff; /* Blue button */
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }
        .form-container .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .form-container .form-check-input:checked {
            background-color: #007bff; /* Blue for checked radio buttons */
            border-color: #007bff;
        }
        .form-container .form-check-label {
            color: #333; /* Dark gray text */
        }
        .navbar {
            background-color: #007bff; /* Blue navbar */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand, .nav-link {
            color: #fff !important; /* White text */
        }
        .navbar-brand:hover, .nav-link:hover {
            opacity: 0.8; /* Slight fade on hover */
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
            document.getElementById("total_amount").value = totalAmount;
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
            }
            calculateTotalAmount();
        }
    </script>
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
        <div class="form-container">
            <h1>Booking Form</h1>
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
                    <input type="date" id="start_date" name="start_date" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="end_date" class="form-label">End Date:</label>
                    <input type="date" id="end_date" name="end_date" class="form-control" required>
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

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Submit Booking</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>