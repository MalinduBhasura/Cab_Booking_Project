package com.cab_booking.service;

import com.cab_booking.dao.CarDAO;
import com.cab_booking.dao.DaoFactory;
import com.cab_booking.model.Car;
import java.sql.SQLException;
import java.util.List;

public class CarService {
    private CarDAO carDAO;

    public CarService() {
        this.carDAO = DaoFactory.getCarDao();
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

    public List<Car> getAvailableCars() {
        return carDAO.getAvailableCars();
    }

    public boolean updateCarStatus(int carId, String status) {
        try {
            return carDAO.updateCarStatus(carId, status);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}