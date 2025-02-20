package com.cab_booking.service;

import com.cab_booking.dao.CarDAO;
import com.cab_booking.model.Car;
import java.util.List;

import java.sql.SQLException;


public class CarService {
    private CarDAO carDAO;

    public CarService() {
        this.carDAO = new CarDAO();
    }

    public void addCar(Car car) throws SQLException {
        carDAO.addCar(car);
    }

    public List<Car> getAllCars() throws SQLException {
        return carDAO.getAllCars();
    }

    public void deleteCar(int carId) throws SQLException {
        carDAO.deleteCar(carId);
    }

    public void updateCar(Car car) throws SQLException {
        carDAO.updateCar(car);
    }

    public Car getCarById(int carId) throws SQLException {
        return carDAO.getCarById(carId);
    }
 // Get available cars
    public List<Car> getAvailableCars() {
        return carDAO.getAvailableCars();
    }
}