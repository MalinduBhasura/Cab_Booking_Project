package com.cab_booking.dao;

import com.cab_booking.model.Driver;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class DriverDAOTest {

    @Mock
    private Connection connection;

    @Mock
    private PreparedStatement preparedStatement;

    @Mock
    private ResultSet resultSet;

    private DriverDAO driverDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        driverDAO = new DriverDAO(connection);
    }

    @Test
    void testAddDriver() throws SQLException {
        // Arrange
        Driver driver = new Driver();
        driver.setDriverName("John Doe");
        driver.setStatus("available");
        driver.setPhone("1234567890");
        driver.setAddress("123 Main St");

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        doNothing().when(preparedStatement).setString(anyInt(), anyString());
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.addDriver(driver);

        // Assert
        assertTrue(result);
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testGetAllDrivers() throws SQLException {
        // Arrange
        when(connection.createStatement()).thenReturn((Statement) preparedStatement);
        when(preparedStatement.executeQuery(anyString())).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true, true, false); // Simulate 2 rows in the result set
        when(resultSet.getInt("driver_id")).thenReturn(1, 2);
        when(resultSet.getString("driver_name")).thenReturn("John Doe", "Jane Doe");
        when(resultSet.getString("status")).thenReturn("available", "booked");
        when(resultSet.getString("phone")).thenReturn("1234567890", "0987654321");
        when(resultSet.getString("address")).thenReturn("123 Main St", "456 Elm St");

        // Act
        List<Driver> drivers = driverDAO.getAllDrivers();

        // Assert
        assertEquals(2, drivers.size());
        assertEquals("John Doe", drivers.get(0).getDriverName());
        assertEquals("Jane Doe", drivers.get(1).getDriverName());
    }

    @Test
    void testGetDriverById() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true);
        when(resultSet.getInt("driver_id")).thenReturn(1);
        when(resultSet.getString("driver_name")).thenReturn("John Doe");
        when(resultSet.getString("status")).thenReturn("available");
        when(resultSet.getString("phone")).thenReturn("1234567890");
        when(resultSet.getString("address")).thenReturn("123 Main St");

        // Act
        Driver driver = driverDAO.getDriverById(1);

        // Assert
        assertNotNull(driver);
        assertEquals("John Doe", driver.getDriverName());
        assertEquals("available", driver.getStatus());
    }

    @Test
    void testUpdateDriver() throws SQLException {
        // Arrange
        Driver driver = new Driver();
        driver.setDriverId(1);
        driver.setDriverName("John Doe");
        driver.setStatus("available");
        driver.setPhone("1234567890");
        driver.setAddress("123 Main St");

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.updateDriver(driver);

        // Assert
        assertTrue(result);
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testDeleteDriver() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.deleteDriver(1);

        // Assert
        assertTrue(result);
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testGetAvailableDrivers() throws SQLException {
        // Arrange
        when(connection.createStatement()).thenReturn((Statement) preparedStatement);
        when(preparedStatement.executeQuery(anyString())).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true, true, false); // Simulate 2 rows in the result set
        when(resultSet.getInt("driver_id")).thenReturn(1, 2);
        when(resultSet.getString("driver_name")).thenReturn("John Doe", "Jane Doe");
        when(resultSet.getString("status")).thenReturn("available", "available");
        when(resultSet.getString("phone")).thenReturn("1234567890", "0987654321");

        // Act
        List<Driver> drivers = driverDAO.getAvailableDrivers();

        // Assert
        assertEquals(2, drivers.size());
        assertEquals("John Doe", drivers.get(0).getDriverName());
        assertEquals("Jane Doe", drivers.get(1).getDriverName());
    }

    @Test
    void testUpdateDriverStatus() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        boolean result = driverDAO.updateDriverStatus(1, "booked");

        // Assert
        assertTrue(result);
        verify(preparedStatement, times(1)).executeUpdate();
    }
}