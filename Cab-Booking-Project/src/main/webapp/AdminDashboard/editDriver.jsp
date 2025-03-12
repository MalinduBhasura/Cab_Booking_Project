<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cab_booking.model.Driver" %>

<%
    Driver driver = (Driver) request.getAttribute("driver");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Driver</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
    <div class="form-container">
        <h1 class="text-center">Edit Driver</h1>
        <form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
            <div class="mb-3">
                <label for="driverName" class="form-label">Driver Name</label>
                <input type="text" class="form-control" id="driverName" name="driverName" value="<%= driver.getDriverName() %>" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="available" <%= driver.getStatus().equals("available") ? "selected" : "" %>>Available</option>
                    <option value="booked" <%= driver.getStatus().equals("booked") ? "selected" : "" %>>Booked</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= driver.getPhone() %>" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= driver.getAddress() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update Driver</button>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/AdminDashboard/driver" class="btn btn-secondary">Back to Driver Management</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>