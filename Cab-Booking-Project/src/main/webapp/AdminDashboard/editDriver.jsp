<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Driver" %>
<html>
<head>
    <title>Edit Driver</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit Driver</h1>
        <%
            Driver driver = (Driver) request.getAttribute("driver");
            if (driver != null) {
        %>
        <form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post" class="card p-4">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
            <div class="mb-3">
                <label for="driverName" class="form-label">Name</label>
                <input type="text" id="driverName" name="driverName" value="<%= driver.getDriverName() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select id="status" name="status" class="form-select" required>
                    <option value="available" <%= "available".equals(driver.getStatus()) ? "selected" : "" %>>Available</option>
                    <option value="booked" <%= "booked".equals(driver.getStatus()) ? "selected" : "" %>>Booked</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= driver.getPhone() %>" class="form-control">
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" id="address" name="address" value="<%= driver.getAddress() %>" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Update Driver</button>
        </form>
        <%
            }
        %>
        <a href="${pageContext.request.contextPath}/AdminDashboard/driverManage.jsp" class="btn btn-secondary mt-3">Back to Manage</a>
    </div>
</body>
</html>