package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.cab_booking.service.BookingService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static org.mockito.Mockito.*;

class BookingDetailsControllerTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private RequestDispatcher requestDispatcher;

    @Mock
    private BookingService bookingService;

    @InjectMocks
    private BookingDetailsController bookingDetailsController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testDoGetWithValidSession() throws ServletException, IOException {
        // Arrange
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("customerId")).thenReturn(1);

        List<Booking> bookings = Arrays.asList(new Booking(), new Booking());
        when(bookingService.getBookingsByCustomerId(1)).thenReturn(bookings);

        when(request.getRequestDispatcher("/CustomerDashboard/bookingDetails.jsp")).thenReturn(requestDispatcher);

        // Act
        bookingDetailsController.doGet(request, response);

        // Assert
        verify(request).setAttribute("bookings", bookings);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    void testDoGetWithInvalidSession() throws ServletException, IOException {
        // Arrange
        when(request.getSession(false)).thenReturn(null);

        // Act
        bookingDetailsController.doGet(request, response);

        // Assert
        verify(response).sendRedirect("login.jsp");
    }
}