package com.cab_booking.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Booking;
import com.cab_booking.model.Driver;
import com.cab_booking.service.BookingService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/CustomerDashboard/book")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            // Redirect to login page if user is not authenticated
            response.sendRedirect("login.jsp");
            return;
        }

        Connection connection = (Connection) getServletContext().getAttribute("DatabaseConnection");
        if (connection == null) {
            request.setAttribute("errorMessage", "Database connection not available.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        DriverDAO driverDAO = new DriverDAO();
        List<Driver> availableDrivers = driverDAO.getAvailableDrivers();
        request.setAttribute("drivers", availableDrivers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            // Redirect to login page if user is not authenticated
            resp.sendRedirect("login.jsp");
            return;
        }

        // Get customerId from session
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // Get form data
        int carId = Integer.parseInt(req.getParameter("car_id"));
        int driverId = Integer.parseInt(req.getParameter("driver_id"));
        Date startDate = Date.valueOf(req.getParameter("start_date"));
        Date endDate = Date.valueOf(req.getParameter("end_date"));
        String carType = req.getParameter("car_type");
        double fare = Double.parseDouble(req.getParameter("fare"));
        String bookingType = req.getParameter("booking_type");

        // Handle null values for estimated_km and total_days
        int estimatedKm = 0;
        int totalDays = 0;

        if (bookingType.equals("Per KM")) {
            String estimatedKmStr = req.getParameter("estimated_km");
            if (estimatedKmStr != null && !estimatedKmStr.isEmpty()) {
                estimatedKm = Integer.parseInt(estimatedKmStr);
            }
        } else if (bookingType.equals("Per Day")) {
            String totalDaysStr = req.getParameter("total_days");
            if (totalDaysStr != null && !totalDaysStr.isEmpty()) {
                totalDays = Integer.parseInt(totalDaysStr);
            }
        }

        double totalAmount = Double.parseDouble(req.getParameter("total_amount"));

        // Create booking object
        Booking booking = new Booking();
        booking.setCustomerId(customerId);
        booking.setCarId(carId);
        booking.setDriverId(driverId);
        booking.setStartDate(startDate);
        booking.setEndDate(endDate);
        booking.setCarType(carType);
        booking.setFare(fare);
        booking.setBookingType(bookingType);
        booking.setEstimatedKm(estimatedKm);
        booking.setTotalDays(totalDays);
        booking.setTotalAmount(totalAmount);

        // Save booking to database
        bookingService.createBooking(booking);

        // Redirect to booking details page
        resp.sendRedirect("/Cab-Booking-Project/CustomerDashboard/bookingDetails.jsp");
    }
}