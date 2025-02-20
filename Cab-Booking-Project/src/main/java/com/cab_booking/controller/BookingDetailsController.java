package com.cab_booking.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;

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

        // Get bookings for the customer
        List<Booking> bookings = bookingService.getBookingsByCustomerId(customerId);
        request.setAttribute("bookings", bookings);

        // Forward to booking details page
        request.getRequestDispatcher("/CustomerDashboard/bookingDetails.jsp").forward(request, response);
    }
}