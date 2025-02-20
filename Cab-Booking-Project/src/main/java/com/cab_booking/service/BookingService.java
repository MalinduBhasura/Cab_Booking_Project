package com.cab_booking.service;

import com.cab_booking.dao.BookingDAO;
import com.cab_booking.model.Booking;

import java.sql.SQLException;
import java.util.List;

public class BookingService {
    private BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    public void createBooking(Booking booking) {
        try {
            bookingDAO.addBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Booking> getBookingsByCustomerId(int customerId) {
        try {
            return bookingDAO.getBookingsByCustomerId(customerId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}