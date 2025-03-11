package com.cab_booking.controller;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.cab_booking.model.Booking;
import com.cab_booking.model.Driver;
import com.cab_booking.service.BookingService;
import com.cab_booking.service.CarService;
import com.cab_booking.service.DriverService;

public class BookingControllerTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private RequestDispatcher requestDispatcher;

    @Mock
    private BookingService bookingService;

    @Mock
    private CarService carService;

    @Mock
    private DriverService driverService;

    @Mock
    private HttpSession session;

    @Mock
    private ServletContext servletContext;

    @Mock
    private ServletConfig servletConfig;

    @InjectMocks
    private BookingController bookingController;

    @BeforeEach
    public void setUp() throws ServletException {
        MockitoAnnotations.openMocks(this);

        // Mock ServletContext and ServletConfig
        when(servletConfig.getServletContext()).thenReturn(servletContext);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(requestDispatcher);

        // Initialize the servlet
        bookingController.init(servletConfig);
    }

    @Test
    public void testDoGet() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("customerId")).thenReturn(1);

        // Mock bookingService
        when(bookingService.getNumberOfBookingsByCustomerId(1)).thenReturn(2);

        // Mock driverService
        List<Driver> availableDrivers = new ArrayList<>();
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setDriverName("Test Driver");
        availableDrivers.add(driver);
        when(driverService.getAvailableDrivers()).thenReturn(availableDrivers);

        // Mock request dispatcher
        when(request.getRequestDispatcher("booking.jsp")).thenReturn(requestDispatcher);

        // Call doGet method
        bookingController.doGet(request, response);

        // Verify behavior
        verify(request).setAttribute("numberOfBookings", 2);
        verify(request).setAttribute("drivers", availableDrivers);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void testDoPost() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("customerId")).thenReturn(1);

        // Mock request parameters
        when(request.getParameter("car_id")).thenReturn("1");
        when(request.getParameter("driver_id")).thenReturn("1");
        when(request.getParameter("start_date")).thenReturn("2023-10-01");
        when(request.getParameter("end_date")).thenReturn("2023-10-05");
        when(request.getParameter("car_type")).thenReturn("SUV");
        when(request.getParameter("fare")).thenReturn("100.0");
        when(request.getParameter("booking_type")).thenReturn("Per Day");
        when(request.getParameter("total_days")).thenReturn("5");

        // Mock bookingService
        when(bookingService.getNumberOfBookingsByCustomerId(eq(1))).thenReturn(3);
        when(bookingService.createBooking(any(Booking.class))).thenReturn(1);

        // Mock carService and driverService
        when(carService.updateCarStatus(eq(1), eq("Booked"))).thenReturn(true);
        when(driverService.updateDriverStatus(eq(1), eq("Booked"))).thenReturn(true);

        // Mock request dispatcher
        when(request.getRequestDispatcher(eq("/CustomerDashboard/bookingConfirm.jsp"))).thenReturn(requestDispatcher);

        // Call doPost method
        bookingController.doPost(request, response);

        // Verify behavior
        verify(bookingService).createBooking(any(Booking.class));
        verify(carService).updateCarStatus(eq(1), eq("Booked"));
        verify(driverService).updateDriverStatus(eq(1), eq("Booked"));
        verify(request).setAttribute(eq("booking"), any(Booking.class));
        verify(request).setAttribute(eq("discountApplied"), eq(true));
        verify(requestDispatcher).forward(request, response);
    }
}
