package com.cab_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cab_booking.model.Booking;
import com.cab_booking.util.DatabaseConnection;

public class BookingDAO {
    private Connection connection;

    public BookingDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

    public int createBooking(Booking booking) {
        String query = "INSERT INTO booking (customer_id, car_id, driver_id, start_date, end_date, booking_type, estimated_km, total_days, fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            pst.setInt(1, booking.getCustomerId());
            pst.setInt(2, booking.getCarId());
            pst.setInt(3, booking.getDriverId());
            pst.setString(4, booking.getStartDate());
            pst.setString(5, booking.getEndDate());
            pst.setString(6, booking.getBookingType());
            pst.setInt(7, booking.getEstimatedKm());
            pst.setInt(8, booking.getTotalDays());
            pst.setDouble(9, booking.getFare());
            pst.executeUpdate();

            ResultSet rs = pst.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return generated booking_id
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}