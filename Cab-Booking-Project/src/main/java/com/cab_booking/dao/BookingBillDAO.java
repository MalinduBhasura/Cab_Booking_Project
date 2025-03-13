package com.cab_booking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cab_booking.model.BookingBill;
import com.cab_booking.util.DatabaseConnection;

public class BookingBillDAO {
    private Connection connection;

    public BookingBillDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

    public void createBookingBill(BookingBill bill) {
        String query = "INSERT INTO booking_bill (booking_id, car_id, start_date, end_date, fare, distance_travelled, total_days, total_amount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, bill.getBookingId());
            pst.setInt(2, bill.getCarId());
            pst.setString(3, bill.getStartDate());
            pst.setString(4, bill.getEndDate());
            pst.setDouble(5, bill.getFare());
            pst.setInt(6, bill.getDistanceTravelled());
            pst.setInt(7, bill.getTotalDays());
            pst.setDouble(8, bill.getTotalAmount());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
