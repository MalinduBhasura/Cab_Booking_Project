<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.cab_booking.model.Customer" %>
<%
    // Validate the session
    if (session == null || session.getAttribute("user") == null || !"customer".equals(session.getAttribute("userType"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return; // Stop further execution of the JSP
    }

    // Get car details from the request parameters
    String carId = request.getParameter("carId");
    String modelName = request.getParameter("modelName");
    String carPhoto = request.getParameter("carPhoto");

    // Debug logs to verify parameters
    System.out.println("Car ID: " + carId);
    System.out.println("Model Name: " + modelName);
    System.out.println("Car Photo: " + carPhoto);
%>
<html>
<head>
    <title>Booking Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Booking Form</h1>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <!-- Display the car photo -->
                    <img src="<%= carPhoto %>" class="card-img-top" alt="Car Photo">
                    <div class="card-body">
                        <!-- Display the car model name -->
                        <h5 class="card-title"><%= modelName %></h5>
                        <form action="booking" method="post">
                            <input type="hidden" name="carId" value="<%= carId %>">
                            <input type="hidden" name="modelName" value="<%= modelName %>">
                            <input type="hidden" name="carPhoto" value="<%= carPhoto %>">
                            <div class="mb-3">
                                <label for="customerName" class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" required>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                            <div class="mb-3">
                                <label for="mobileNumber" class="form-label">Mobile Number</label>
                                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" required>
                            </div>
                            <div class="mb-3">
                                <label for="days" class="form-label">Number of Days</label>
                                <input type="number" class="form-control" id="days" name="days" required>
                            </div>
                            <div class="mb-3">
                                <label for="km" class="form-label">Total Kilometers</label>
                                <input type="number" class="form-control" id="km" name="km" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>