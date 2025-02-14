<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cab_booking.model.Driver" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Driver Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Driver Management</h1>
        <a href="${pageContext.request.contextPath}/AdminDashboard/driverAdd.jsp" class="btn btn-primary mb-3">Add Driver</a>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");
                    if (drivers != null) {
                        for (Driver driver : drivers) {
                %>
                <tr>
                    <td><%= driver.getDriverId() %></td>
                    <td><%= driver.getDriverName() %></td>
                    <td><%= driver.getStatus() %></td>
                    <td><%= driver.getPhone() %></td>
                    <td><%= driver.getAddress() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/AdminDashboard/editDriver.jsp?id=<%= driver.getDriverId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>