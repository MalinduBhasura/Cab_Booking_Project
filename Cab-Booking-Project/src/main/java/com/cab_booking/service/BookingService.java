package com.cab_booking.service;

import com.cab_booking.dao.BookingBillDAO;
import com.cab_booking.dao.BookingDAO;
import com.cab_booking.dao.CarDAO;
import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Booking;
import com.cab_booking.model.BookingBill;
import com.cab_booking.model.Car;

public class BookingService {
    private BookingDAO bookingDAO = new BookingDAO();
    private BookingBillDAO bookingBillDAO = new BookingBillDAO();

    public void createBooking(Booking booking, BookingBill bill) {
        int bookingId = bookingDAO.createBooking(booking);
        if (bookingId != -1) {
            bill.setBookingId(bookingId);
            bookingBillDAO.createBookingBill(bill);
        }
    }
}