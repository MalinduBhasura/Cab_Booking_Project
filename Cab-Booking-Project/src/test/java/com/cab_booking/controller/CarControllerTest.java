package com.cab_booking.controller;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.cab_booking.model.Car;
import com.cab_booking.service.CarService;

public class CarControllerTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private RequestDispatcher requestDispatcher;

    @Mock
    private CarService carService;

    @Mock
    private Part filePart;

    @Mock
    private ServletContext servletContext;

    @Mock
    private ServletConfig servletConfig;

    @InjectMocks
    private CarController carController;

    @BeforeEach
    public void setUp() throws ServletException {
        MockitoAnnotations.openMocks(this);

        // Mock ServletContext and ServletConfig
        when(servletConfig.getServletContext()).thenReturn(servletContext);
        when(servletContext.getRealPath(anyString())).thenReturn("/tmp/uploads");

        // Initialize the servlet
        carController.init(servletConfig);
    }

    @Test
    public void testDoGetEdit() throws ServletException, IOException, SQLException {
        // Mock request parameters
        when(request.getParameter("action")).thenReturn("edit");
        when(request.getParameter("carId")).thenReturn("1");

        // Mock carService
        Car car = new Car();
        car.setCarId(1);
        car.setCarName("Test Car");
        when(carService.getCarById(1)).thenReturn(car);

        // Mock request dispatcher
        when(request.getRequestDispatcher("carEdit.jsp")).thenReturn(requestDispatcher);

        // Call doGet method
        carController.doGet(request, response);

        // Verify behavior
        verify(request).setAttribute("car", car);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void testDoGetManage() throws ServletException, IOException, SQLException {
        // Mock request parameters
        when(request.getParameter("action")).thenReturn(null);

        // Mock carService
        List<Car> cars = new ArrayList<>();
        Car car = new Car();
        car.setCarId(1);
        car.setCarName("Test Car");
        cars.add(car);
        when(carService.getAllCars()).thenReturn(cars);

        // Mock request dispatcher
        when(request.getRequestDispatcher("carManage.jsp")).thenReturn(requestDispatcher);

        // Call doGet method
        carController.doGet(request, response);

        // Verify behavior
        verify(request).setAttribute("cars", cars);
        verify(requestDispatcher).forward(request, response);
    }

    @Test
    public void testDoPostAdd() throws ServletException, IOException, SQLException {
        // Mock request parameters
        when(request.getParameter("action")).thenReturn("add");
        when(request.getPart("carPhoto")).thenReturn(filePart);
        when(request.getParameter("carName")).thenReturn("Test Car");
        when(request.getParameter("numberPlate")).thenReturn("TEST-1234");
        when(request.getParameter("acFarePerKm")).thenReturn("10.0");
        when(request.getParameter("nonAcFarePerKm")).thenReturn("8.0");
        when(request.getParameter("acFarePerDay")).thenReturn("500.0");
        when(request.getParameter("nonAcFarePerDay")).thenReturn("400.0");
        when(request.getParameter("status")).thenReturn("available");

        // Mock file upload
        when(filePart.getHeader("content-disposition")).thenReturn("filename=test.jpg");
        when(filePart.getSubmittedFileName()).thenReturn("test.jpg");

        // Call doPost method
        carController.doPost(request, response);

        // Verify behavior
        verify(carService).addCar(any(Car.class));
        verify(response).sendRedirect("car");
    }

    @Test
    public void testDoPostDelete() throws ServletException, IOException, SQLException {
        // Mock request parameters
        when(request.getParameter("action")).thenReturn("delete");
        when(request.getParameter("carId")).thenReturn("1");

        // Call doPost method
        carController.doPost(request, response);

        // Verify behavior
        verify(carService).deleteCar(1);
        verify(response).sendRedirect("car");
    }

    @Test
    public void testDoPostUpdate() throws ServletException, IOException, SQLException {
        // Mock request parameters
        when(request.getParameter("action")).thenReturn("update");
        when(request.getPart("carPhoto")).thenReturn(filePart);
        when(request.getParameter("carId")).thenReturn("1");
        when(request.getParameter("carName")).thenReturn("Updated Car");
        when(request.getParameter("numberPlate")).thenReturn("UPD-1234");
        when(request.getParameter("acFarePerKm")).thenReturn("12.0");
        when(request.getParameter("nonAcFarePerKm")).thenReturn("10.0");
        when(request.getParameter("acFarePerDay")).thenReturn("600.0");
        when(request.getParameter("nonAcFarePerDay")).thenReturn("500.0");
        when(request.getParameter("status")).thenReturn("booked");

        // Mock file upload
        when(filePart.getHeader("content-disposition")).thenReturn("filename=updated.jpg");
        when(filePart.getSubmittedFileName()).thenReturn("updated.jpg");

        // Call doPost method
        carController.doPost(request, response);

        // Verify behavior
        verify(carService).updateCar(any(Car.class));
        verify(response).sendRedirect("car");
    }
}