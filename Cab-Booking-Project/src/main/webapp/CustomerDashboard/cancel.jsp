<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment Cancelled</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Payment Cancelled</h1>
        <div class="alert alert-warning" role="alert">
            Your payment was not completed. Please try again.
        </div>
        <a href="${pageContext.request.contextPath}/CustomerDashboard/bookingConfirm.jsp" class="btn btn-primary">Retry Payment</a>
    </div>
</body>
</html>