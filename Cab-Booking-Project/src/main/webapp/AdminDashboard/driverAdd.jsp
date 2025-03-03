<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Driver</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 50px auto;
        }
        .form-container h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-container .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1 class="text-center">Add New Driver</h1>
        <form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="driverName" class="form-label">Driver Name</label>
                <input type="text" class="form-control" id="driverName" name="driverName" required>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="available">Available</option>
                    <option value="booked">Booked</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Driver</button>
            <a href="/Cab-Booking-Project/AdminDashboard/driver" class="btn btn-secondary mt-3 w-100">Back to Driver Management</a>
        </form>
         
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>