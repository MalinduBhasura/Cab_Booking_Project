package com.cab_booking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cab_booking.model.Booking;
import com.cab_booking.model.BookingBill;
import com.cab_booking.service.BookingService;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        int carId = Integer.parseInt(request.getParameter("car_id"));
        int driverId = Integer.parseInt(request.getParameter("driver_id"));
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String bookingType = request.getParameter("booking_type");
        int estimatedKm = Integer.parseInt(request.getParameter("estimated_km"));
        int totalDays = Integer.parseInt(request.getParameter("total_days"));
        double fare = Double.parseDouble(request.getParameter("fare"));

        Booking booking = new Booking();
        booking.setCustomerId(customerId);
        booking.setCarId(carId);
        booking.setDriverId(driverId);
        booking.setStartDate(startDate);
        booking.setEndDate(endDate);
        booking.setBookingType(bookingType);
        booking.setEstimatedKm(estimatedKm);
        booking.setTotalDays(totalDays);
        booking.setFare(fare);

        BookingBill bill = new BookingBill();
        bill.setCarId(carId);
        bill.setStartDate(startDate);
        bill.setEndDate(endDate);
        bill.setFare(fare);
        bill.setDistanceTravelled(estimatedKm);
        bill.setTotalDays(totalDays);
        bill.setTotalAmount(fare * (bookingType.equals("per_km") ? estimatedKm : totalDays));

        BookingService bookingService = new BookingService();
        bookingService.createBooking(booking, bill);

        response.sendRedirect("bookingDetails.jsp");
    }
}