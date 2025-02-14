package com.cab_booking.controller;





import com.cab_booking.model.Driver;
import com.cab_booking.service.DriverService;
import com.cab_booking.util.DriverFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;



@WebServlet("/AdminDashboard/driver")
public class DriverController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	
	private DriverService driverService;

    @Override
    public void init() {
        // Use the factory to get the DriverService instance
        driverService = DriverFactory.getDriverService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Driver> drivers = driverService.getAllDrivers();
            req.setAttribute("drivers", drivers);
            req.getRequestDispatcher("driverManage.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            Driver driver = new Driver();
            driver.setDriverName(req.getParameter("driverName"));
            driver.setStatus(req.getParameter("status"));
            driver.setPhone(req.getParameter("phone"));
            driver.setAddress(req.getParameter("address"));

            try {
                driverService.addDriver(driver);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if ("edit".equals(action)) {
            // Handle edit logic
        } else if ("delete".equals(action)) {
            int driverId = Integer.parseInt(req.getParameter("driverId"));
            try {
                driverService.deleteDriver(driverId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect("driver");
    }
}
