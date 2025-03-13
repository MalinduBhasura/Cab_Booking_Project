<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Guide - Mega City Cab</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff !important;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff !important;
        }
        .navbar-brand:hover {
            opacity: 0.8;
        }
        .nav-link {
            color: #fff !important;
            font-size: 1rem;
            margin: 0 10px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px; /* Space between icon and text */
        }
        .nav-link:hover {
            color: #f8f9fa !important;
            opacity: 0.8;
            transform: translateY(-2px); /* Slight lift on hover */
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 1)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            color: #fff !important;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px; /* Space between icon and text */
        }
        .logout-btn:hover {
            background-color: #c82333;
            transform: translateY(-2px); /* Slight lift on hover */
        }
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .table th {
            background-color: #007bff;
            color: #fff;
        }
        .table td, .table th {
            vertical-align: middle;
        }
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .user-guide-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .user-guide-container h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .user-guide-container h2 {
            color: #333;
            margin-top: 30px;
            margin-bottom: 15px;
            font-weight: bold;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }
        .user-guide-container p {
            color: #555;
            line-height: 1.8;
            margin-bottom: 15px;
        }
        .user-guide-container ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 20px;
        }
        .user-guide-container ul li {
            margin-bottom: 10px;
            color: #555;
        }
        .user-guide-container .faq-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
        }
        .user-guide-container .faq-section h3 {
            color: #007bff;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .user-guide-container .faq-section p {
            color: #555;
            margin-bottom: 15px;
        }
        .user-guide-container .contact-info {
            background: #007bff;
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
            text-align: center;
        }
        .user-guide-container .contact-info h3 {
            margin-bottom: 20px;
            font-weight: bold;
        }
        .user-guide-container .contact-info p {
            color: #fff;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <!-- Brand/Logo -->
            <a class="navbar-brand" href="#">
                <i class="fas fa-car"></i> Car Booking
            </a>

            <!-- Toggle Button for Mobile -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/customerDashboard">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CustomerDashboard/bookingDetails">
                            <i class="fas fa-list"></i> Booking Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CustomerDashboard/returnBooking">
                            <i class="fas fa-undo"></i> Return Booking
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CustomerDashboard/userGuide.jsp">
                            <i class="fas fa-book"></i> User Guide <!-- Updated icon -->
                        </a>
                    </li>
                    <!-- Logout Button -->
                    <li class="nav-item">
                        <a class="nav-link logout-btn" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- User Guide Content -->
    <div class="user-guide-container">
        <h1>
            <i class="fas fa-book"></i> User Guide for Mega City Cab Booking System <!-- Added icon -->
        </h1>

        <!-- Booking a Cab Section -->
        <h2>1. Booking a Cab</h2>
        <p>After logging in, you can book a cab by following these steps:</p>
        <ul>
            <li><strong>View Available Cars:</strong> On the <strong>Customer Dashboard</strong>, you will see a list of available cars. Each car will display details such as <strong>Car Name</strong>, <strong>Number Plate</strong>, <strong>Fare per KM/Day</strong>, and <strong>Status</strong>.</li>
            <li><strong>Select a Car:</strong> Click the <strong>"Book Now"</strong> button next to the car you want to book.</li>
            <li><strong>Fill in the Booking Form:</strong>
                <ul>
                    <li>Select a <strong>Driver</strong> from the dropdown list.</li>
                    <li>Choose the <strong>Start Date</strong> and <strong>End Date</strong> for your booking.</li>
                    <li>Select the <strong>Charge Type</strong> (Per KM or Per Day).</li>
                    <li>Choose the <strong>Car Type</strong> (AC or Non-AC).</li>
                    <li>The system will automatically calculate the <strong>Fare</strong> and <strong>Total Amount</strong> based on your selections.</li>
                </ul>
            </li>
            <li><strong>Submit the Booking:</strong> Click the <strong>"Submit Booking"</strong> button to confirm your booking. You will be redirected to the <strong>Booking Confirmation</strong> page, where you can view the details of your booking.</li>
        </ul>

        <!-- Viewing Booking Details Section -->
        <h2>2. Viewing Booking Details</h2>
        <p>You can view all your bookings at any time:</p>
        <ul>
            <li><strong>Navigate to Booking Details:</strong> Click on the <strong>"Booking Details"</strong> link in the navigation bar.</li>
            <li><strong>View Your Bookings:</strong> You will see a list of all your bookings, including details such as <strong>Booking ID</strong>, <strong>Car ID</strong>, <strong>Driver ID</strong>, <strong>Start Date</strong>, <strong>End Date</strong>, and <strong>Total Amount</strong>.</li>
        </ul>

        <!-- Returning a Cab Section -->
        <h2>3. Returning a Cab</h2>
        <p>After using the cab, you need to return it to complete the booking process:</p>
        <ul>
            <li><strong>Navigate to Return Booking:</strong> Click on the <strong>"Return Booking"</strong> link in the navigation bar.</li>
            <li><strong>Select the Booking to Return:</strong> You will see a list of your active bookings. Click the <strong>"Return"</strong> button next to the booking you want to return.</li>
            <li><strong>Confirm the Return:</strong> The system will calculate any <strong>extra charges</strong> if the car is returned late. You will see a confirmation message with the updated total amount.</li>
        </ul>

        <!-- Logout Section -->
        <h2>4. Logout</h2>
        <p>To securely log out of the system:</p>
        <ul>
            <li><strong>Click on the Logout Button:</strong> Click the <strong>"Logout"</strong> button in the navigation bar. You will be redirected to the login page.</li>
        </ul>

        <!-- Additional Information Section -->
        <h2>5. Additional Information</h2>
        <ul>
            <li><strong>Discounts:</strong> If you have made 3 or more bookings, you are eligible for a <strong>30% discount</strong> on your next booking.</li>
            <li><strong>Extra Charges:</strong> If you return the car late, an extra charge of <strong>20% per day</strong> will be applied.</li>
            <li><strong>Customer Support:</strong> If you encounter any issues, please contact our support team at <strong>support@megacitycab.com</strong>.</li>
        </ul>

        <!-- FAQ Section -->
        <div class="faq-section">
            <h3>Frequently Asked Questions (FAQ)</h3>
            <p><strong>Q: How do I reset my password?</strong></p>
            <p>A: Currently, the system does not support password reset functionality. Please contact support for assistance.</p>
            <p><strong>Q: Can I cancel a booking?</strong></p>
            <p>A: No, the system does not support booking cancellations. Please ensure your booking details are correct before confirming.</p>
            <p><strong>Q: How do I know if I am eligible for a discount?</strong></p>
            <p>A: If you have made 3 or more bookings, the system will automatically apply a 30% discount to your next booking.</p>
        </div>

        <!-- Contact Information Section -->
        <div class="contact-info">
            <h3>Contact Information</h3>
            <p>For any queries or assistance, please contact us at:</p>
            <p><strong>Email:</strong> support@megacitycab.com</p>
            <p><strong>Phone:</strong> +94 123 456 789</p>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>