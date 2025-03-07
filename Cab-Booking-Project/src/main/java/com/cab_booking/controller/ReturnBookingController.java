package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;
import com.cab_booking.service.CarService;
import com.cab_booking.service.DriverService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@WebServlet("/CustomerDashboard/returnBooking")
public class ReturnBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService = new BookingService();
    private CarService carService = new CarService();
    private DriverService driverService = new DriverService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Get the customer ID from the session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int customerId = (Integer) session.getAttribute("customerId");

        // Fetch active bookings for the customer
        List<Booking> bookings = bookingService.getActiveBookingsByCustomerId(customerId);
        request.setAttribute("bookings", bookings);

        // Forward to the returnBooking.jsp page
        request.getRequestDispatcher("/CustomerDashboard/returnBooking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the booking ID from the request
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        System.out.println("Returning booking with ID: " + bookingId); // Debug log

        // Fetch the booking details
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
            System.out.println("Booking not found for ID: " + bookingId); // Debug log
            response.sendRedirect(request.getContextPath() + "/CustomerDashboard/returnBooking");
            return;
        }

        // Get today's date
        Date returnDate = new Date(System.currentTimeMillis());

        // Calculate extra charges and update the total amount
        double updatedTotalAmount = bookingService.calculateExtraCharges(bookingId, returnDate);

        // Calculate the difference between return date and end date
        long diffInMillies = returnDate.getTime() - booking.getEndDate().getTime();
        long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

        // Prepare a message for the customer
        String message;
        if (diffInDays > 0) {
            message = "You returned the car " + diffInDays + " days late. An extra charge of 20% per day has been applied. Your updated total amount is $" + updatedTotalAmount + ".";
        } else {
            message = "Thank you for returning the car on time! Your total amount is $" + booking.getTotalAmount() + ".";
        }

        // Mark the booking as returned
        boolean isBookingMarkedAsReturned = bookingService.markBookingAsReturned(bookingId);
        if (!isBookingMarkedAsReturned) {
            System.out.println("Failed to mark booking as returned."); // Debug log
            response.sendRedirect(request.getContextPath() + "/CustomerDashboard/returnBooking");
            return;
        }

        // Update car and driver status to "Available"
        boolean isCarUpdated = carService.updateCarStatus(booking.getCarId(), "Available");
        boolean isDriverUpdated = driverService.updateDriverStatus(booking.getDriverId(), "Available");

        if (!isCarUpdated || !isDriverUpdated) {
            System.out.println("Failed to update car or driver status."); // Debug log
            response.sendRedirect(request.getContextPath() + "/CustomerDashboard/returnBooking");
            return;
        }

        // Set the message in the session
        HttpSession session = request.getSession();
        session.setAttribute("returnMessage", message);

        // Redirect to the return confirmation page
        response.sendRedirect(request.getContextPath() + "/CustomerDashboard/returnConfirmation.jsp");
    }

}