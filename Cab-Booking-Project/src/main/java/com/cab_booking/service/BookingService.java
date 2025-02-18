package com.cab_booking.service;

import com.cab_booking.dao.BookingDAO;
import com.cab_booking.model.Booking;

public class BookingService {
    private BookingDAO bookingDAO = new BookingDAO();

    public void addBooking(Booking booking) {
        bookingDAO.addBooking(booking);
    }
}