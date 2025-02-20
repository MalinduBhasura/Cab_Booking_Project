package com.cab_booking.controller;

import com.cab_booking.model.Car;
import com.cab_booking.service.CarService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//@WebServlet("/customerDashboard")
public class CustomerDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch available cars
        List<Car> availableCars = carService.getAvailableCars();
        System.out.println("Available Cars: " + availableCars); // Debug log

        // Set the cars list as a request attribute
        request.setAttribute("cars", availableCars);

        // Forward to the customer dashboard JSP
        request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
    }
    
}