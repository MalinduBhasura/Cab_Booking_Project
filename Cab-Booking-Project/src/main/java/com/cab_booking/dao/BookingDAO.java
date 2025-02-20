package com.cab_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cab_booking.model.Booking;
import com.cab_booking.util.DatabaseConnection;

public class BookingDAO {
    private Connection connection;

    public BookingDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public void addBooking(Booking booking) throws SQLException {
        String query = "INSERT INTO booking (customer_id, car_id, driver_id, start_date, end_date, car_type, fare, booking_type, estimated_km, total_days, total_amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, booking.getCustomerId());
            stmt.setInt(2, booking.getCarId());
            stmt.setInt(3, booking.getDriverId());
            stmt.setDate(4, new java.sql.Date(booking.getStartDate().getTime()));
            stmt.setDate(5, new java.sql.Date(booking.getEndDate().getTime()));
            stmt.setString(6, booking.getCarType());
            stmt.setDouble(7, booking.getFare());
            stmt.setString(8, booking.getBookingType());
            stmt.setInt(9, booking.getEstimatedKm());
            stmt.setInt(10, booking.getTotalDays());
            stmt.setDouble(11, booking.getTotalAmount());
            stmt.executeUpdate();
        }
    }
    public List<Booking> getBookingsByCustomerId(int customerId) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE customer_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setCarId(rs.getInt("car_id"));
                booking.setDriverId(rs.getInt("driver_id"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setCarType(rs.getString("car_type"));
                booking.setBookingType(rs.getString("booking_type"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                bookings.add(booking);
            }
        }
        return bookings;
    }
}