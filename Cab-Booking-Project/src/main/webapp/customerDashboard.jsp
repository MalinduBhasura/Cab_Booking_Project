<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%
    // Validate the session
 
 if (session == null || session.getAttribute("user") == null || !"customer".equals(session.getAttribute("userType"))) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
    
    
List<Car> cars = (List<Car>) request.getAttribute("cars");
%>
<html>
<head>
    <title>Customer Dashboard</title>
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
        <h1 class="text-center mb-4">Available Cars</h1>
        <div class="row">
            <%
                if (cars != null && !cars.isEmpty()) {
                    for (Car car : cars) {
                        String carPhotoEncoded = URLEncoder.encode(car.getCarPhoto(), "UTF-8");
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<%= car.getCarPhoto() %>" class="card-img-top" alt="Car Photo">
                    <div class="card-body">
                        <h5 class="card-title"><%= car.getModelName() %></h5>
                        <p class="card-text">Status: <%= car.getStatus() %></p>
                        <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingForm.jsp?carId=<%= car.getCarId() %>&modelName=<%= car.getModelName() %>&carPhoto=<%= carPhotoEncoded %>" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12">
                <div class="alert alert-warning" role="alert">
                    No cars available at the moment. Please check back later.
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>