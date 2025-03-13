package com.cab_booking.service;

import com.cab_booking.dao.DriverDAO;
import com.cab_booking.model.Driver;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class DriverServiceTest {

    @Mock
    private DriverDAO driverDAO;

    @InjectMocks
    private DriverService driverService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddDriver() {
        // Arrange
        Driver driver = new Driver();
        when(driverDAO.addDriver(driver)).thenReturn(true);

        // Act
        boolean result = driverService.addDriver(driver);

        // Assert
        assertTrue(result);
        verify(driverDAO, times(1)).addDriver(driver);
    }

    @Test
    void testGetAllDrivers() {
        // Arrange
        List<Driver> drivers = new ArrayList<>();
        drivers.add(new Driver());
        when(driverDAO.getAllDrivers()).thenReturn(drivers);

        // Act
        List<Driver> result = driverService.getAllDrivers();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(driverDAO, times(1)).getAllDrivers();
    }

    @Test
    void testGetAvailableDrivers() {
        // Arrange
        List<Driver> drivers = new ArrayList<>();
        drivers.add(new Driver());
        when(driverDAO.getAvailableDrivers()).thenReturn(drivers);

        // Act
        List<Driver> result = driverService.getAvailableDrivers();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(driverDAO, times(1)).getAvailableDrivers();
    }

    @Test
    void testUpdateDriver() {
        // Arrange
        Driver driver = new Driver();
        when(driverDAO.updateDriver(driver)).thenReturn(true);

        // Act
        boolean result = driverService.updateDriver(driver);

        // Assert
        assertTrue(result);
        verify(driverDAO, times(1)).updateDriver(driver);
    }

    @Test
    void testDeleteDriver() {
        // Arrange
        int driverId = 1;
        when(driverDAO.deleteDriver(driverId)).thenReturn(true);

        // Act
        boolean result = driverService.deleteDriver(driverId);

        // Assert
        assertTrue(result);
        verify(driverDAO, times(1)).deleteDriver(driverId);
    }

    @Test
    void testGetDriverById() {
        // Arrange
        int driverId = 1;
        Driver driver = new Driver();
        when(driverDAO.getDriverById(driverId)).thenReturn(driver);

        // Act
        Driver result = driverService.getDriverById(driverId);

        // Assert
        assertNotNull(result);
        verify(driverDAO, times(1)).getDriverById(driverId);
    }

    @Test
    void testUpdateDriverStatus() throws SQLException {
        // Arrange
        int driverId = 1;
        String status = "available";
        when(driverDAO.updateDriverStatus(driverId, status)).thenReturn(true);

        // Act
        boolean result = driverService.updateDriverStatus(driverId, status);

        // Assert
        assertTrue(result);
        verify(driverDAO, times(1)).updateDriverStatus(driverId, status);
    }
}