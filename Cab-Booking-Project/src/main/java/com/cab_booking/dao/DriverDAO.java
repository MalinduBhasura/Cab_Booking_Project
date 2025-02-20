package com.cab_booking.dao;

import com.cab_booking.model.Driver;
import com.cab_booking.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private Connection connection;

    public DriverDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

 // Add a new driver
    public boolean addDriver(Driver driver) {
        String sql = "INSERT INTO driver (driver_name, status, phone, address) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, driver.getDriverName());
            statement.setString(2, driver.getStatus());
            statement.setString(3, driver.getPhone());
            statement.setString(4, driver.getAddress());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM driver";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Driver driver = new Driver();
                driver.setDriverId(resultSet.getInt("driver_id"));
                driver.setDriverName(resultSet.getString("driver_name"));
                driver.setStatus(resultSet.getString("status"));
                driver.setPhone(resultSet.getString("phone"));
                driver.setAddress(resultSet.getString("address"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // Get driver by ID
    public Driver getDriverById(int driverId) {
        String sql = "SELECT * FROM driver WHERE driver_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, driverId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Driver driver = new Driver();
                driver.setDriverId(resultSet.getInt("driver_id"));
                driver.setDriverName(resultSet.getString("driver_name"));
                driver.setStatus(resultSet.getString("status"));
                driver.setPhone(resultSet.getString("phone"));
                driver.setAddress(resultSet.getString("address"));
                return driver;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update driver
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE driver SET driver_name = ?, status = ?, phone = ?, address = ? WHERE driver_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, driver.getDriverName());
            statement.setString(2, driver.getStatus());
            statement.setString(3, driver.getPhone());
            statement.setString(4, driver.getAddress());
            statement.setInt(5, driver.getDriverId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete driver
    public boolean deleteDriver(int driverId) {
        String sql = "DELETE FROM driver WHERE driver_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, driverId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Driver> getAvailableDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM driver WHERE status = 'available'";  // Ensure status matches your database
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Driver driver = new Driver();
                driver.setDriverId(resultSet.getInt("driver_id"));
                driver.setDriverName(resultSet.getString("driver_name"));
                driver.setStatus(resultSet.getString("status"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }
}
