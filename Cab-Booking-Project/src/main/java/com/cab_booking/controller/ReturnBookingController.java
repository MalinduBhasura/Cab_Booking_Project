package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;
import com.cab_booking.service.CarService;
import com.cab_booking.service.DriverService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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

        System.out.println("Booking returned successfully."); // Debug log
        response.sendRedirect(request.getContextPath() + "/CustomerDashboard/returnBooking");
    }
}