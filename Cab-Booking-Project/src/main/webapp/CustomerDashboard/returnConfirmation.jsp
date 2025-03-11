<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = (String) session.getAttribute("returnMessage");
    session.removeAttribute("returnMessage"); // Clear the message after displaying
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Return Confirmation</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for additional styling -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .confirmation-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .confirmation-card h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .confirmation-card .alert {
            font-size: 1.1rem;
            padding: 15px;
            border-radius: 5px;
        }
        .confirmation-card .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
        .confirmation-card .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="confirmation-card">
        <h1 class="text-center">Return Confirmation</h1>

        <!-- Display message -->
        <% if (message != null) { %>
            <div class="alert alert-info text-center">
                <%= message %>
            </div>
        <% } %>

        <!-- Back button -->
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/CustomerDashboard/returnBooking" class="btn btn-primary">
                Back to Return Booking
            </a>
        </div>
    </div>

    <!-- Bootstrap 5 JS (Optional, for interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>