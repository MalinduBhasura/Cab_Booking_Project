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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }
        .navbar {
            background: #007bff;
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 220px;
            object-fit: cover;
        }
        .card-body {
            background: linear-gradient(135deg, #ffffff, #e3e3e3);
            border-radius: 0 0 15px 15px;
        }
    </style>
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
                        <h5 class="card-title text-primary fw-bold"><%= car.getCarName() %> - <%= car.getNumberPlate() %></h5>
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
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>