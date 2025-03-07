package com.cab_booking.service;

import com.cab_booking.dao.BookingDAO;
import com.cab_booking.dao.DaoFactory;
import com.cab_booking.model.Booking;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingService {
    private BookingDAO bookingDAO;

    public BookingService() {
        this.bookingDAO = DaoFactory.getBookingDao();
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

    public List<Booking> getAllBookings() {
        try {
            return bookingDAO.getAllBookings();
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public void deleteBooking(int bookingId) {
        try {
            bookingDAO.deleteBooking(bookingId);
        } catch (SQLException e) {
            e.printStackTrace();
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

    public boolean markBookingAsReturned(int bookingId) {
        try {
            return bookingDAO.markBookingAsReturned(bookingId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getActiveBookingsByCustomerId(int customerId) {
        try {
            return bookingDAO.getActiveBookingsByCustomerId(customerId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Calculates extra charges for a booking based on the return date and updates the total amount in the database.
     *
     * @param bookingId  The ID of the booking.
     * @param returnDate The date the car was returned.
     * @return The updated total amount including extra charges.
     */
    public double calculateExtraCharges(int bookingId, Date returnDate) {
        try {
            return bookingDAO.calculateExtraCharges(bookingId, returnDate);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0; // Return 0 if an error occurs
        }
    }

}