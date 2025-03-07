package com.cab_booking.controller;

import com.cab_booking.model.Driver;
import com.cab_booking.service.DriverService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDashboard/driver")
public class DriverController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService;

    public DriverController() {
        this.driverService = new DriverService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Disable caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies

        // Check if the user is logged in (session check)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if (action == null) {
            // Fetch all drivers from the database
            List<Driver> drivers = driverService.getAllDrivers();
            System.out.println("Drivers fetched: " + drivers); // Debug log
            request.setAttribute("drivers", drivers);
            request.getRequestDispatcher("/AdminDashboard/driverManage.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Edit driver: Fetch driver by ID and forward to edit page
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            Driver driver = driverService.getDriverById(driverId);
            request.setAttribute("driver", driver);
            request.getRequestDispatcher("/AdminDashboard/editDriver.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Delete driver: Delete driver by ID and redirect to driver management page
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            driverService.deleteDriver(driverId);
            response.sendRedirect(request.getContextPath() + "/AdminDashboard/driver");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            // Add new driver
            Driver driver = new Driver();
            driver.setDriverName(request.getParameter("driverName"));
            driver.setStatus(request.getParameter("status"));
            driver.setPhone(request.getParameter("phone"));
            driver.setAddress(request.getParameter("address"));
            System.out.println("Driver to add: " + driver); // Debug log
            boolean isAdded = driverService.addDriver(driver);
            System.out.println("Driver added: " + isAdded); // Debug log
        } else if (action.equals("update")) {
            // Update driver
            Driver driver = new Driver();
            driver.setDriverId(Integer.parseInt(request.getParameter("driverId")));
            driver.setDriverName(request.getParameter("driverName"));
            driver.setStatus(request.getParameter("status"));
            driver.setPhone(request.getParameter("phone"));
            driver.setAddress(request.getParameter("address"));
            System.out.println("Driver to update: " + driver); // Debug log
            boolean isUpdated = driverService.updateDriver(driver);
            System.out.println("Driver updated: " + isUpdated); // Debug log
        }

        // Redirect to driver management page after adding/updating
        response.sendRedirect(request.getContextPath() + "/AdminDashboard/driver");
    }
}