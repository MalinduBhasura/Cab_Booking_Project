<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Customer Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Available Cars</h1>
        <%
            List<Car> cars = (List<Car>) request.getAttribute("cars");
            System.out.println("Cars in JSP: " + cars); // Debug log

            if (cars != null && !cars.isEmpty()) {
                for (Car car : cars) {
                    System.out.println("Car: " + car.getModelName()); // Debug log
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="<%= car.getCarPhoto() %>" class="card-img-top" alt="Car Photo">
                <div class="card-body">
                    <h5 class="card-title"><%= car.getModelName() %></h5>
                    <p class="card-text">Status: <%= car.getStatus() %></p>
                    <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingForm.jsp?carId=<%= car.getCarId() %>" class="btn btn-primary">Book Now</a>
                </div>
            </div>
        </div>
        <%
                }
            } else {
                System.out.println("No cars available"); // Debug log
        %>
        <div class="alert alert-warning" role="alert">
            No cars available at the moment. Please check back later.
        </div>
        <%
            }
        %>
    </div>
</body>
</html>