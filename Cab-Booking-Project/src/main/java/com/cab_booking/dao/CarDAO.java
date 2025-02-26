package com.cab_booking.dao;

//CarDAO.java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cab_booking.model.Car;
import com.cab_booking.util.DatabaseConnection;

public class CarDAO {
 private Connection connection;

 public CarDAO() {
     this.connection = DatabaseConnection.getInstance().getConnection();
 }

 // Add a new car
 public void addCar(Car car) throws SQLException {
     String query = "INSERT INTO car (car_name, number_plate, ac_fare_per_km, non_ac_fare_per_km, ac_fare_per_day, non_ac_fare_per_day, car_photo, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
     try (PreparedStatement stmt = connection.prepareStatement(query)) {
         stmt.setString(1, car.getCarName());
         stmt.setString(2, car.getNumberPlate());
         stmt.setDouble(3, car.getAcFarePerKm());
         stmt.setDouble(4, car.getNonAcFarePerKm());
         stmt.setDouble(5, car.getAcFarePerDay());
         stmt.setDouble(6, car.getNonAcFarePerDay());
         stmt.setString(7, car.getCarPhoto());
         stmt.setString(8, car.getStatus());
         stmt.executeUpdate();
     }
 }

 // Get all cars
 public List<Car> getAllCars() throws SQLException {
     List<Car> cars = new ArrayList<>();
     String query = "SELECT * FROM car";
     try (PreparedStatement stmt = connection.prepareStatement(query);
          ResultSet rs = stmt.executeQuery()) {
         while (rs.next()) {
             Car car = new Car();
             car.setCarId(rs.getInt("car_id"));
             car.setCarName(rs.getString("car_name"));
             car.setNumberPlate(rs.getString("number_plate"));
             car.setAcFarePerKm(rs.getDouble("ac_fare_per_km"));
             car.setNonAcFarePerKm(rs.getDouble("non_ac_fare_per_km"));
             car.setAcFarePerDay(rs.getDouble("ac_fare_per_day"));
             car.setNonAcFarePerDay(rs.getDouble("non_ac_fare_per_day"));
             car.setCarPhoto(rs.getString("car_photo"));
             car.setStatus(rs.getString("status"));
             cars.add(car);
         }
     }
     return cars;
 }

 // Delete a car
 public void deleteCar(int carId) throws SQLException {
     String query = "DELETE FROM car WHERE car_id = ?";
     try (PreparedStatement stmt = connection.prepareStatement(query)) {
         stmt.setInt(1, carId);
         stmt.executeUpdate();
     }
 }

 // Update a car
 public void updateCar(Car car) throws SQLException {
     String query = "UPDATE car SET car_name = ?, number_plate = ?, ac_fare_per_km = ?, non_ac_fare_per_km = ?, ac_fare_per_day = ?, non_ac_fare_per_day = ?, car_photo = ?, status = ? WHERE car_id = ?";
     try (PreparedStatement stmt = connection.prepareStatement(query)) {
         stmt.setString(1, car.getCarName());
         stmt.setString(2, car.getNumberPlate());
         stmt.setDouble(3, car.getAcFarePerKm());
         stmt.setDouble(4, car.getNonAcFarePerKm());
         stmt.setDouble(5, car.getAcFarePerDay());
         stmt.setDouble(6, car.getNonAcFarePerDay());
         stmt.setString(7, car.getCarPhoto());
         stmt.setString(8, car.getStatus());
         stmt.setInt(9, car.getCarId());
         stmt.executeUpdate();
     }
 }

 // Get a car by ID
 public Car getCarById(int carId) throws SQLException {
     String query = "SELECT * FROM car WHERE car_id = ?";
     try (PreparedStatement stmt = connection.prepareStatement(query)) {
         stmt.setInt(1, carId);
         ResultSet rs = stmt.executeQuery();
         if (rs.next()) {
             Car car = new Car();
             car.setCarId(rs.getInt("car_id"));
             car.setCarName(rs.getString("car_name"));
             car.setNumberPlate(rs.getString("number_plate"));
             car.setAcFarePerKm(rs.getDouble("ac_fare_per_km"));
             car.setNonAcFarePerKm(rs.getDouble("non_ac_fare_per_km"));
             car.setAcFarePerDay(rs.getDouble("ac_fare_per_day"));
             car.setNonAcFarePerDay(rs.getDouble("non_ac_fare_per_day"));
             car.setCarPhoto(rs.getString("car_photo"));
             car.setStatus(rs.getString("status"));
             return car;
         }
     }
     return null;
 }
//Get available cars
public List<Car> getAvailableCars() {
  List<Car> cars = new ArrayList<>();
  String sql = "SELECT * FROM car WHERE status = 'available'";
  try (Statement statement = connection.createStatement();
       ResultSet resultSet = statement.executeQuery(sql)) {
      while (resultSet.next()) {
          Car car = new Car();
          car.setCarId(resultSet.getInt("car_id"));
          car.setCarName(resultSet.getString("car_name")); // Assuming car_name is the field for car brand
          car.setNumberPlate(resultSet.getString("number_plate")); // Assuming number_plate is the field for model name
          car.setAcFarePerKm(resultSet.getDouble("ac_fare_per_km")); // Assuming ac_fare_per_km is the field for rate per km
          car.setNonAcFarePerKm(resultSet.getDouble("non_ac_fare_per_km")); // Assuming non_ac_fare_per_km is the field for rate per km (non-AC)
          car.setAcFarePerDay(resultSet.getDouble("ac_fare_per_day")); // Assuming ac_fare_per_day is the field for rate per day
          car.setNonAcFarePerDay(resultSet.getDouble("non_ac_fare_per_day")); // Assuming non_ac_fare_per_day is the field for rate per day (non-AC)
          car.setCarPhoto(resultSet.getString("car_photo"));
          car.setStatus(resultSet.getString("status"));
          cars.add(car);
      }
  } catch (SQLException e) {
      e.printStackTrace();
  }
  return cars;
}
// Method to update car status
public boolean updateCarStatus(int carId, String status) throws SQLException {
    String query = "UPDATE car SET status = ? WHERE car_id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setString(1, status);
        stmt.setInt(2, carId);
        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0; // Return true if at least one row was updated
    }
}
}