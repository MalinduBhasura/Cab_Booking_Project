<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%
    if (session == null || session.getAttribute("user") == null || !"customer".equals(session.getAttribute("userType"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Car> cars = (List<Car>) request.getAttribute("cars");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: #007bff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
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
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
            border: none;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 220px;
            object-fit: cover;
        }
        .card-body {
            background: #fff;
            border-radius: 0 0 15px 15px;
        }
        .card-title {
            color: #007bff;
            font-weight: bold;
        }
        .btn-success {
            background-color: #28a745;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .alert-warning {
            background-color: #fff3cd;
            border-color: #ffeeba;
            color: #856404;
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
        <h1 class="text-center mb-4">Available Cars</h1>
        <div class="row">
            <% if (cars != null && !cars.isEmpty()) {
                for (Car car : cars) {
                    String carPhotoEncoded = URLEncoder.encode(car.getCarPhoto(), "UTF-8");
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<%= car.getCarPhoto() %>" class="card-img-top" alt="Car Photo">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%= car.getCarName() %> - <%= car.getNumberPlate() %></h5>
                        <p class="card-text text-muted">
                            AC Fare (Per Km): <strong><%= car.getAcFarePerKm() %></strong><br>
                            Non-AC Fare (Per Km): <strong><%= car.getNonAcFarePerKm() %></strong><br>
                            AC Fare (Per Day): <strong><%= car.getAcFarePerDay() %></strong><br>
                            Non-AC Fare (Per Day): <strong><%= car.getNonAcFarePerDay() %></strong><br>
                            Status: <strong><%= car.getStatus() %></strong>
                        </p>
                        <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingForm.jsp?carId=<%= car.getCarId() %>&carName=<%= URLEncoder.encode(car.getCarName(), "UTF-8") %>&numberPlate=<%= URLEncoder.encode(car.getNumberPlate(), "UTF-8") %>&carPhoto=<%= carPhotoEncoded %>&acFarePerKm=<%= car.getAcFarePerKm() %>&nonAcFarePerKm=<%= car.getNonAcFarePerKm() %>&acFarePerDay=<%= car.getAcFarePerDay() %>&nonAcFarePerDay=<%= car.getNonAcFarePerDay() %>" class="btn btn-success">Book Now</a>
                    </div>
                </div>
            </div>
            <%  }} else { %>
            <div class="col-12">
                <div class="alert alert-warning text-center" role="alert">
                    No cars available at the moment. Please check back later.
                </div>
            </div>
            <% } %>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails" class="btn btn-secondary">Back to Admin Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>