package com.cab_booking.service;

import com.cab_booking.dao.DaoFactory;
import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Driver;
import java.sql.SQLException;
import java.util.List;

public class DriverService {
    private DriverDAO driverDAO;

    public DriverService() {
        this.driverDAO = DaoFactory.getDriverDao();
    }

    // Add a new driver
    public boolean addDriver(Driver driver) {
        return driverDAO.addDriver(driver);
    }

    // Get all drivers
    public List<Driver> getAllDrivers() {
        return driverDAO.getAllDrivers();
    }

    // Get available drivers
    public List<Driver> getAvailableDrivers() {
        return driverDAO.getAvailableDrivers();
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

    // Method to update driver status
    public boolean updateDriverStatus(int driverId, String status) {
        try {
            return driverDAO.updateDriverStatus(driverId, status);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}