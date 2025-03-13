package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CustomerDashboard/bookingDetails")
public class BookingDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get customerId from session
        int customerId = (int) session.getAttribute("customerId");

        // Get all bookings for the customer (including returned bookings)
        List<Booking> bookings = bookingService.getBookingsByCustomerId(customerId);
        request.setAttribute("bookings", bookings);

        // Forward to booking details page
        request.getRequestDispatcher("/CustomerDashboard/bookingDetails.jsp").forward(request, response);
    }
}