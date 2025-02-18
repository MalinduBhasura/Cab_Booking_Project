package com.cab_booking.service;

import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Driver;
import java.util.List;

public class DriverService {
    private DriverDAO driverDAO;

    public DriverService() {
        driverDAO = new DriverDAO();
    }

    // Add a new driver
    public boolean addDriver(Driver driver) {
        System.out.println("Adding driver: " + driver); // Debug log
        return driverDAO.addDriver(driver);
    }

    // Get all drivers
    public List<Driver> getAllDrivers() {
        return driverDAO.getAllDrivers();
    }

    // Update a driver
    public boolean updateDriver(Driver driver) {
        return driverDAO.updateDriver(driver);
    }

    // Delete a driver
    public boolean deleteDriver(int driverId) {
        return driverDAO.deleteDriver(driverId);
    }

    // Get driver by ID
    public Driver getDriverById(int driverId) {
        return driverDAO.getDriverById(driverId);
    }
}