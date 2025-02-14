<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Driver</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Add Driver</h1>
        <form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post" class="card p-4">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="driverName" class="form-label">Name</label>
                <input type="text" id="driverName" name="driverName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select id="status" name="status" class="form-select" required>
                    <option value="available">Available</option>
                    <option value="booked">Booked</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" id="phone" name="phone" class="form-control">
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" id="address" name="address" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Add Driver</button>
        </form>
        <a href="${pageContext.request.contextPath}/AdminDashboard/driverManage.jsp" class="btn btn-secondary mt-3">Back to Manage</a>
    </div>
</body>
</html>