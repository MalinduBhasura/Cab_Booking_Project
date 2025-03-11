package com.cab_booking.controller;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
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

import com.cab_booking.model.Driver;
import com.cab_booking.service.DriverService;

public class DriverControllerTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private RequestDispatcher requestDispatcher;

    @Mock
    private DriverService driverService;

    @Mock
    private HttpSession session;

    @Mock
    private ServletContext servletContext;

    @Mock
    private ServletConfig servletConfig;

    @InjectMocks
    private DriverController driverController;

    @BeforeEach
    public void setUp() throws ServletException {
        MockitoAnnotations.openMocks(this);

        // Mock ServletContext and ServletConfig
        when(servletConfig.getServletContext()).thenReturn(servletContext);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(requestDispatcher);

        // Initialize the servlet
        driverController.init(servletConfig);
    }

    @Test
    public void testDoGetManageDrivers() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("user")).thenReturn("admin");

        // Mock request parameters
        when(request.getParameter("action")).thenReturn(null);

        // Mock driverService
        List<Driver> drivers = new ArrayList<>();
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setDriverName("Test Driver");
        drivers.add(driver);
        when(driverService.getAllDrivers()).thenReturn(drivers);

        // Mock request dispatcher
        when(request.getRequestDispatcher("/AdminDashboard/driverManage.jsp")).thenReturn(requestDispatcher);

        // Call doGet method
        driverController.doGet(request, response);

        // Verify behavior
        verify(request).setAttribute("drivers", drivers);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void testDoGetEditDriver() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("user")).thenReturn("admin");

        // Mock request parameters
        when(request.getParameter("action")).thenReturn("edit");
        when(request.getParameter("driverId")).thenReturn("1");

        // Mock driverService
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setDriverName("Test Driver");
        when(driverService.getDriverById(1)).thenReturn(driver);

        // Mock request dispatcher
        when(request.getRequestDispatcher("/AdminDashboard/editDriver.jsp")).thenReturn(requestDispatcher);

        // Call doGet method
        driverController.doGet(request, response);

        // Verify behavior
        verify(request).setAttribute("driver", driver);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void testDoGetDeleteDriver() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("user")).thenReturn("admin");

        // Mock request parameters
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("driverId")).thenReturn("1");

        // Mock driverService
        when(driverService.deleteDriver(1)).thenReturn(true);

        // Call doGet method
        driverController.doGet(request, response);

        // Verify behavior
        verify(driverService).deleteDriver(1);
        verify(response).sendRedirect(request.getContextPath() + "/AdminDashboard/driver");
    }

    @Test
    public void testDoPostAddDriver() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("user")).thenReturn("admin");

        // Mock request parameters
        when(request.getParameter("action")).thenReturn("add");
        when(request.getParameter("driverName")).thenReturn("Test Driver");
        when(request.getParameter("status")).thenReturn("available");
        when(request.getParameter("phone")).thenReturn("1234567890");
        when(request.getParameter("address")).thenReturn("Test Address");

        // Mock driverService
        when(driverService.addDriver(any(Driver.class))).thenReturn(true);

        // Call doPost method
        driverController.doPost(request, response);

        // Verify behavior
        verify(driverService).addDriver(any(Driver.class));
        verify(response).sendRedirect(request.getContextPath() + "/AdminDashboard/driver");
    }

    @Test
    public void testDoPostUpdateDriver() throws ServletException, IOException {
        // Mock session
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("user")).thenReturn("admin");

        // Mock request parameters
        when(request.getParameter("action")).thenReturn("update");
        when(request.getParameter("driverId")).thenReturn("1");
        when(request.getParameter("driverName")).thenReturn("Updated Driver");
        when(request.getParameter("status")).thenReturn("booked");
        when(request.getParameter("phone")).thenReturn("0987654321");
        when(request.getParameter("address")).thenReturn("Updated Address");

        // Mock driverService
        when(driverService.updateDriver(any(Driver.class))).thenReturn(true);

        // Call doPost method
        driverController.doPost(request, response);

        // Verify behavior
        verify(driverService).updateDriver(any(Driver.class));
        verify(response).sendRedirect(request.getContextPath() + "/AdminDashboard/driver");
    }
}