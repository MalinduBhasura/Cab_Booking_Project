<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Payment Successful!</h1>
        <div class="alert alert-success" role="alert">
            Thank you for your payment. Your booking is confirmed.
        </div>
        <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails" class="btn btn-primary">View All Bookings</a>
    </div>
</body>
</html>