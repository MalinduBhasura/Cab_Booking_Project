package com.cab_booking.service;

import com.cab_booking.dao.BookingDAO;
import com.cab_booking.model.Booking;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class BookingServiceTest {

    @Mock
    private BookingDAO bookingDAO;

    @InjectMocks
    private BookingService bookingService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCreateBooking() throws SQLException {
        // Arrange
        Booking booking = new Booking();
        when(bookingDAO.addBooking(booking)).thenReturn(1);

        // Act
        int result = bookingService.createBooking(booking);

        // Assert
        assertEquals(1, result);
        verify(bookingDAO, times(1)).addBooking(booking);
    }

    @Test
    void testReturnBooking() throws SQLException {
        // Arrange
        int bookingId = 1;
        doNothing().when(bookingDAO).returnBooking(bookingId);

        // Act
        bookingService.returnBooking(bookingId);

        // Assert
        verify(bookingDAO, times(1)).returnBooking(bookingId);
    }

    @Test
    void testGetBookingsByCustomerId() throws SQLException {
        // Arrange
        int customerId = 1;
        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking());
        when(bookingDAO.getBookingsByCustomerId(customerId)).thenReturn(bookings);

        // Act
        List<Booking> result = bookingService.getBookingsByCustomerId(customerId);

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(bookingDAO, times(1)).getBookingsByCustomerId(customerId);
    }

    @Test
    void testGetAllBookings() throws SQLException {
        // Arrange
        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking());
        when(bookingDAO.getAllBookings()).thenReturn(bookings);

        // Act
        List<Booking> result = bookingService.getAllBookings();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(bookingDAO, times(1)).getAllBookings();
    }

    @Test
    void testDeleteBooking() throws SQLException {
        // Arrange
        int bookingId = 1;
        doNothing().when(bookingDAO).deleteBooking(bookingId);

        // Act
        bookingService.deleteBooking(bookingId);

        // Assert
        verify(bookingDAO, times(1)).deleteBooking(bookingId);
    }

    @Test
    void testGetNumberOfBookingsByCustomerId() throws SQLException {
        // Arrange
        int customerId = 1;
        when(bookingDAO.getNumberOfBookingsByCustomerId(customerId)).thenReturn(2);

        // Act
        int result = bookingService.getNumberOfBookingsByCustomerId(customerId);

        // Assert
        assertEquals(2, result);
        verify(bookingDAO, times(1)).getNumberOfBookingsByCustomerId(customerId);
    }

    @Test
    void testUpdateBooking() throws SQLException {
        // Arrange
        Booking booking = new Booking();
        doNothing().when(bookingDAO).updateBooking(booking);

        // Act
        bookingService.updateBooking(booking);

        // Assert
        verify(bookingDAO, times(1)).updateBooking(booking);
    }

    @Test
    void testGetBookingById() throws SQLException {
        // Arrange
        int bookingId = 1;
        Booking booking = new Booking();
        when(bookingDAO.getBookingById(bookingId)).thenReturn(booking);

        // Act
        Booking result = bookingService.getBookingById(bookingId);

        // Assert
        assertNotNull(result);
        verify(bookingDAO, times(1)).getBookingById(bookingId);
    }

    @Test
    void testMarkBookingAsReturned() throws SQLException {
        // Arrange
        int bookingId = 1;
        when(bookingDAO.markBookingAsReturned(bookingId)).thenReturn(true);

        // Act
        boolean result = bookingService.markBookingAsReturned(bookingId);

        // Assert
        assertTrue(result);
        verify(bookingDAO, times(1)).markBookingAsReturned(bookingId);
    }

    @Test
    void testGetActiveBookingsByCustomerId() throws SQLException {
        // Arrange
        int customerId = 1;
        List<Booking> bookings = new ArrayList<>();
        bookings.add(new Booking());
        when(bookingDAO.getActiveBookingsByCustomerId(customerId)).thenReturn(bookings);

        // Act
        List<Booking> result = bookingService.getActiveBookingsByCustomerId(customerId);

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(bookingDAO, times(1)).getActiveBookingsByCustomerId(customerId);
    }

    @Test
    void testCalculateExtraCharges() throws SQLException {
        // Arrange
        int bookingId = 1;
        Date returnDate = Date.valueOf("2023-10-01");
        when(bookingDAO.calculateExtraCharges(bookingId, returnDate)).thenReturn(50.0);

        // Act
        double result = bookingService.calculateExtraCharges(bookingId, returnDate);

        // Assert
        assertEquals(50.0, result);
        verify(bookingDAO, times(1)).calculateExtraCharges(bookingId, returnDate);
    }
}