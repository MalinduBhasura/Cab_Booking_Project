package com.cab_booking.dao;

import com.cab_booking.model.Car;
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

class CarDAOTest {

    @Mock
    private Connection connection;

    @Mock
    private PreparedStatement preparedStatement;

    @Mock
    private ResultSet resultSet;

    private CarDAO carDAO;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        carDAO = new CarDAO(connection);
    }

    @Test
    void testAddCar() throws SQLException {
        // Arrange
        Car car = new Car();
        car.setCarName("Toyota Corolla");
        car.setNumberPlate("ABC-1234");
        car.setAcFarePerKm(10.0);
        car.setNonAcFarePerKm(8.0);
        car.setAcFarePerDay(100.0);
        car.setNonAcFarePerDay(80.0);
        car.setCarPhoto("car.jpg");
        car.setStatus("available");

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        doNothing().when(preparedStatement).setString(anyInt(), anyString());
        doNothing().when(preparedStatement).setDouble(anyInt(), anyDouble());
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        carDAO.addCar(car);

        // Assert
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testGetAllCars() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true, true, false); // Simulate 2 rows in the result set
        when(resultSet.getInt("car_id")).thenReturn(1, 2);
        when(resultSet.getString("car_name")).thenReturn("Toyota Corolla", "Honda Civic");
        when(resultSet.getString("number_plate")).thenReturn("ABC-1234", "XYZ-5678");
        when(resultSet.getDouble("ac_fare_per_km")).thenReturn(10.0, 12.0);
        when(resultSet.getDouble("non_ac_fare_per_km")).thenReturn(8.0, 10.0);
        when(resultSet.getDouble("ac_fare_per_day")).thenReturn(100.0, 120.0);
        when(resultSet.getDouble("non_ac_fare_per_day")).thenReturn(80.0, 100.0);
        when(resultSet.getString("car_photo")).thenReturn("car1.jpg", "car2.jpg");
        when(resultSet.getString("status")).thenReturn("available", "booked");

        // Act
        List<Car> cars = carDAO.getAllCars();

        // Assert
        assertEquals(2, cars.size());
        assertEquals("Toyota Corolla", cars.get(0).getCarName());
        assertEquals("Honda Civic", cars.get(1).getCarName());
    }

    @Test
    void testDeleteCar() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        carDAO.deleteCar(1);

        // Assert
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testUpdateCar() throws SQLException {
        // Arrange
        Car car = new Car();
        car.setCarId(1);
        car.setCarName("Toyota Corolla");
        car.setNumberPlate("ABC-1234");
        car.setAcFarePerKm(10.0);
        car.setNonAcFarePerKm(8.0);
        car.setAcFarePerDay(100.0);
        car.setNonAcFarePerDay(80.0);
        car.setCarPhoto("car.jpg");
        car.setStatus("available");

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        carDAO.updateCar(car);

        // Assert
        verify(preparedStatement, times(1)).executeUpdate();
    }

    @Test
    void testGetCarById() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true);
        when(resultSet.getInt("car_id")).thenReturn(1);
        when(resultSet.getString("car_name")).thenReturn("Toyota Corolla");
        when(resultSet.getString("number_plate")).thenReturn("ABC-1234");
        when(resultSet.getDouble("ac_fare_per_km")).thenReturn(10.0);
        when(resultSet.getDouble("non_ac_fare_per_km")).thenReturn(8.0);
        when(resultSet.getDouble("ac_fare_per_day")).thenReturn(100.0);
        when(resultSet.getDouble("non_ac_fare_per_day")).thenReturn(80.0);
        when(resultSet.getString("car_photo")).thenReturn("car.jpg");
        when(resultSet.getString("status")).thenReturn("available");

        // Act
        Car car = carDAO.getCarById(1);

        // Assert
        assertNotNull(car);
        assertEquals("Toyota Corolla", car.getCarName());
        assertEquals("ABC-1234", car.getNumberPlate());
    }

    @Test
    void testGetAvailableCars() throws SQLException {
        // Arrange
        when(connection.createStatement()).thenReturn((Statement) preparedStatement);
        when(preparedStatement.executeQuery(anyString())).thenReturn(resultSet);

        when(resultSet.next()).thenReturn(true, true, false); // Simulate 2 rows in the result set
        when(resultSet.getInt("car_id")).thenReturn(1, 2);
        when(resultSet.getString("car_name")).thenReturn("Toyota Corolla", "Honda Civic");
        when(resultSet.getString("number_plate")).thenReturn("ABC-1234", "XYZ-5678");
        when(resultSet.getDouble("ac_fare_per_km")).thenReturn(10.0, 12.0);
        when(resultSet.getDouble("non_ac_fare_per_km")).thenReturn(8.0, 10.0);
        when(resultSet.getDouble("ac_fare_per_day")).thenReturn(100.0, 120.0);
        when(resultSet.getDouble("non_ac_fare_per_day")).thenReturn(80.0, 100.0);
        when(resultSet.getString("car_photo")).thenReturn("car1.jpg", "car2.jpg");
        when(resultSet.getString("status")).thenReturn("available", "available");

        // Act
        List<Car> cars = carDAO.getAvailableCars();

        // Assert
        assertEquals(2, cars.size());
        assertEquals("Toyota Corolla", cars.get(0).getCarName());
        assertEquals("Honda Civic", cars.get(1).getCarName());
    }

    @Test
    void testUpdateCarStatus() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1);

        // Act
        boolean result = carDAO.updateCarStatus(1, "booked");

        // Assert
        assertTrue(result);
        verify(preparedStatement, times(1)).executeUpdate();
    }
}