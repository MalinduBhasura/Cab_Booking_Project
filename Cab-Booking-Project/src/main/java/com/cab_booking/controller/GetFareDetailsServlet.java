package com.cab_booking.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cab_booking.util.DatabaseConnection;

public class GetFareDetailsServlet {
    public static double calculateFare(int carId, String carType, String chargeType, int estimatedKm, int totalDays) {
        double fare = 0;
        double totalAmount = 0;

        try (Connection conn = DatabaseConnection.getInstance().getConnection()) {
            String query = "SELECT ac_fare_per_km, non_ac_fare_per_km, ac_fare_per_day, non_ac_fare_per_day FROM car WHERE car_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, carId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                if (chargeType.equals("Per KM")) {
                    fare = carType.equals("AC") ? rs.getDouble("ac_fare_per_km") : rs.getDouble("non_ac_fare_per_km");
                    totalAmount = fare * estimatedKm;
                } else if (chargeType.equals("Per Day")) {
                    fare = carType.equals("AC") ? rs.getDouble("ac_fare_per_day") : rs.getDouble("non_ac_fare_per_day");
                    totalAmount = fare * totalDays;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalAmount;
    }
}