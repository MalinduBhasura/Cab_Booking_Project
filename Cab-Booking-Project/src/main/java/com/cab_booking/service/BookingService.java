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

    public int createBooking(Booking booking) {
        try {
            return bookingDAO.addBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Return -1 to indicate an error
        }
    }

    public void returnBooking(int bookingId) {
        try {
            bookingDAO.returnBooking(bookingId);
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
    

    public int getNumberOfBookingsByCustomerId(int customerId) {
        try {
            return bookingDAO.getNumberOfBookingsByCustomerId(customerId);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Return 0 to indicate no bookings or an error
        }
    }

    public void updateBooking(Booking booking) {
        try {
            bookingDAO.updateBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Booking getBookingById(int bookingId) {
        try {
            return bookingDAO.getBookingById(bookingId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Return null if an error occurs
        }
    }
    
 // Mark a booking as returned
    public boolean markBookingAsReturned(int bookingId) {
        try {
            return bookingDAO.markBookingAsReturned(bookingId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
 // Get active bookings for a customer
    public List<Booking> getActiveBookingsByCustomerId(int customerId) {
        try {
            return bookingDAO.getActiveBookingsByCustomerId(customerId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}