package com.cab_booking.service;

import com.cab_booking.dao.CarDAO;
import com.cab_booking.model.Car;
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

class CarServiceTest {

    @Mock
    private CarDAO carDAO;

    @InjectMocks
    private CarService carService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddCar() throws SQLException {
        // Arrange
        Car car = new Car();
        doNothing().when(carDAO).addCar(car);

        // Act
        carService.addCar(car);

        // Assert
        verify(carDAO, times(1)).addCar(car);
    }

    @Test
    void testGetAllCars() throws SQLException {
        // Arrange
        List<Car> cars = new ArrayList<>();
        cars.add(new Car());
        when(carDAO.getAllCars()).thenReturn(cars);

        // Act
        List<Car> result = carService.getAllCars();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(carDAO, times(1)).getAllCars();
    }

    @Test
    void testDeleteCar() throws SQLException {
        // Arrange
        int carId = 1;
        doNothing().when(carDAO).deleteCar(carId);

        // Act
        carService.deleteCar(carId);

        // Assert
        verify(carDAO, times(1)).deleteCar(carId);
    }

    @Test
    void testUpdateCar() throws SQLException {
        // Arrange
        Car car = new Car();
        doNothing().when(carDAO).updateCar(car);

        // Act
        carService.updateCar(car);

        // Assert
        verify(carDAO, times(1)).updateCar(car);
    }

    @Test
    void testGetCarById() throws SQLException {
        // Arrange
        int carId = 1;
        Car car = new Car();
        when(carDAO.getCarById(carId)).thenReturn(car);

        // Act
        Car result = carService.getCarById(carId);

        // Assert
        assertNotNull(result);
        verify(carDAO, times(1)).getCarById(carId);
    }

    @Test
    void testGetAvailableCars() {
        // Arrange
        List<Car> cars = new ArrayList<>();
        cars.add(new Car());
        when(carDAO.getAvailableCars()).thenReturn(cars);

        // Act
        List<Car> result = carService.getAvailableCars();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        verify(carDAO, times(1)).getAvailableCars();
    }

    @Test
    void testUpdateCarStatus() throws SQLException {
        // Arrange
        int carId = 1;
        String status = "available";
        when(carDAO.updateCarStatus(carId, status)).thenReturn(true);

        // Act
        boolean result = carService.updateCarStatus(carId, status);

        // Assert
        assertTrue(result);
        verify(carDAO, times(1)).updateCarStatus(carId, status);
    }
}