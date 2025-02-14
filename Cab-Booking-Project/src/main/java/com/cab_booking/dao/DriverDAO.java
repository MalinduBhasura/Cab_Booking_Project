package com.cab_booking.dao;



import com.cab_booking.model.Driver;
import com.cab_booking.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private static Connection connection;

    public DriverDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

    // Add a new driver
    public boolean addDriver(Driver driver) throws SQLException {
        String query = "INSERT INTO driver (driver_name, status, phone, address) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getDriverName());
            ps.setString(2, driver.getStatus());
            ps.setString(3, driver.getPhone());
            ps.setString(4, driver.getAddress());
            return ps.executeUpdate() > 0;
        }
    }

    // Get all drivers
    public static List<Driver> getAllDrivers() throws SQLException {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM driver";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setDriverName(rs.getString("driver_name"));
                driver.setStatus(rs.getString("status"));
                driver.setPhone(rs.getString("phone"));
                driver.setAddress(rs.getString("address"));
                drivers.add(driver);
            }
        }
        return drivers;
    }

    // Update a driver
    public boolean updateDriver(Driver driver) throws SQLException {
        String query = "UPDATE driver SET driver_name=?, status=?, phone=?, address=? WHERE driver_id=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, driver.getDriverName());
            ps.setString(2, driver.getStatus());
            ps.setString(3, driver.getPhone());
            ps.setString(4, driver.getAddress());
            ps.setInt(5, driver.getDriverId());
            return ps.executeUpdate() > 0;
        }
    }

    // Delete a driver
    public boolean deleteDriver(int driverId) throws SQLException {
        String query = "DELETE FROM driver WHERE driver_id=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, driverId);
            return ps.executeUpdate() > 0;
        }
    }
}
