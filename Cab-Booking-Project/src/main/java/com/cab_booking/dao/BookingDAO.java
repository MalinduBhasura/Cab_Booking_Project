package com.cab_booking.dao;

import com.cab_booking.model.Booking;
import com.cab_booking.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookingDAO {
    private Connection connection;

    public BookingDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

    public void addBooking(Booking booking) {
        String sql = "INSERT INTO booking (car_id, customer_name, address, mobile_number, days, km) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, booking.getCarId());
            statement.setString(2, booking.getCustomerName());
            statement.setString(3, booking.getAddress());
            statement.setString(4, booking.getMobileNumber());
            statement.setInt(5, booking.getDays());
            statement.setInt(6, booking.getKm());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}