package com.cab_booking.dao;

import com.cab_booking.model.Car;
import com.cab_booking.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {
    private Connection connection;

    public CarDAO() {
        connection = DatabaseConnection.getInstance().getConnection();
    }

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO car (car_brand, model_name, car_photo, status, rate_per_km, rate_per_day) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getCar_brand());
            statement.setString(2, car.getModelName());
            statement.setString(3, car.getCarPhoto());
            statement.setString(4, car.getStatus());
            statement.setDouble(5, car.getRatePerKm());
            statement.setDouble(6, car.getRatePerDay());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all cars
    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM car";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Car car = new Car();
                car.setCarId(resultSet.getInt("car_id"));
                car.setCar_brand(resultSet.getString("car_brand"));
                car.setModelName(resultSet.getString("model_name"));
                car.setCarPhoto(resultSet.getString("car_photo"));
                car.setStatus(resultSet.getString("status"));
                car.setRatePerKm(resultSet.getDouble("rate_per_km"));
                car.setRatePerDay(resultSet.getDouble("rate_per_day"));
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    // Update a car
    public boolean updateCar(Car car) {
        String sql = "UPDATE car SET car_brand = ?, model_name = ?, car_photo = ?, status = ?, rate_per_km = ?, rate_per_day = ? WHERE car_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, car.getCar_brand());
            statement.setString(2, car.getModelName());
            statement.setString(3, car.getCarPhoto());
            statement.setString(4, car.getStatus());
            statement.setDouble(5, car.getRatePerKm());
            statement.setDouble(6, car.getRatePerDay());
            statement.setInt(7, car.getCarId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a car
    public boolean deleteCar(int carId) {
        String sql = "DELETE FROM car WHERE car_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, carId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get available cars
    public List<Car> getAvailableCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM car WHERE status = 'available'";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Car car = new Car();
                car.setCarId(resultSet.getInt("car_id"));
                car.setCar_brand(resultSet.getString("car_brand"));
                car.setModelName(resultSet.getString("model_name"));
                car.setCarPhoto(resultSet.getString("car_photo"));
                car.setStatus(resultSet.getString("status"));
                car.setRatePerKm(resultSet.getDouble("rate_per_km"));
                car.setRatePerDay(resultSet.getDouble("rate_per_day"));
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }
}