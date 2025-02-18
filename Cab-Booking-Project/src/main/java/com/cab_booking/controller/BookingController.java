package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get booking details from the form
        int carId = Integer.parseInt(request.getParameter("carId"));
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String mobileNumber = request.getParameter("mobileNumber");
        int days = Integer.parseInt(request.getParameter("days"));
        int km = Integer.parseInt(request.getParameter("km"));

        // Create a Booking object
        Booking booking = new Booking();
        booking.setCarId(carId);
        booking.setCustomerName(customerName);
        booking.setAddress(address);
        booking.setMobileNumber(mobileNumber);
        booking.setDays(days);
        booking.setKm(km);

        // Save the booking
        bookingService.addBooking(booking);

        // Redirect to a confirmation page or back to the dashboard
        response.sendRedirect(request.getContextPath() + "/CustomerDashboard/bookingConfirmation.jsp");
    }
}