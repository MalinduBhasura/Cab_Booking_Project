package com.cab_booking.controller;

import com.cab_booking.service.BookingService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/AdminDashboard/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        bookingService.deleteBooking(bookingId);
        response.sendRedirect("view_booking.jsp");
    }
}