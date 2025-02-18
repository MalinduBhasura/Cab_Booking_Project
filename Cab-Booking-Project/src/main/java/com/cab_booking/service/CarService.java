package com.cab_booking.service;

import com.cab_booking.dao.CarDAO;
import com.cab_booking.model.Car;
import java.util.List;

public class CarService {
    private CarDAO carDAO = new CarDAO();

    public boolean addCar(Car car) {
        return carDAO.addCar(car);
    }

    public List<Car> getAllCars() {
        return carDAO.getAllCars();
    }

    public boolean updateCar(Car car) {
        return carDAO.updateCar(car);
    }

    public boolean deleteCar(int carId) {
        return carDAO.deleteCar(carId);
    }

    public List<Car> getAvailableCars() {
        return carDAO.getAvailableCars();
    }

    public Car getCarById(int carId) {
        return carDAO.getAllCars().stream()
                .filter(c -> c.getCarId() == carId)
                .findFirst()
                .orElse(null);
    }
}