package com.cab_booking.service;





import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Driver;
import java.util.List;

import java.sql.Connection;
import java.sql.SQLException;


public class DriverService {
    private DriverDAO driverDAO;

    public DriverService(Connection connection) {
        this.driverDAO = new DriverDAO();
    }

    public boolean addDriver(Driver driver) throws SQLException {
        return driverDAO.addDriver(driver);
    }

    public List<Driver> getAllDrivers() throws SQLException {
        return DriverDAO.getAllDrivers();
    }

    public boolean updateDriver(Driver driver) throws SQLException {
        return driverDAO.updateDriver(driver);
    }

    public boolean deleteDriver(int driverId) throws SQLException {
        return driverDAO.deleteDriver(driverId);
    }
}