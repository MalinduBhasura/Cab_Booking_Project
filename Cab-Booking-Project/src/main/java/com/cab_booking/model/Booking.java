package com.cab_booking.model;

import java.util.Date;

public class Booking {
    private int bookingId;
    private int customerId;
    private int carId;
    private int driverId;
    private Date startDate;
    private Date endDate;
    private String carType;
    private double fare;
    private String bookingType;
    private int estimatedKm;
    private int totalDays;
    private double totalAmount;
    private String status; // Changed to String to match ENUM in database
    private double extraCharges; // New field for extra charges
    
 // Getters and Setters
    public double getExtraCharges() {
        return extraCharges;
    }

    public void setExtraCharges(double extraCharges) {
        this.extraCharges = extraCharges;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }
    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
    public String getCarType() { return carType; }
    public void setCarType(String carType) { this.carType = carType; }
    public double getFare() { return fare; }
    public void setFare(double fare) { this.fare = fare; }
    public String getBookingType() { return bookingType; }
    public void setBookingType(String bookingType) { this.bookingType = bookingType; }
    public int getEstimatedKm() { return estimatedKm; }
    public void setEstimatedKm(int estimatedKm) { this.estimatedKm = estimatedKm; }
    public int getTotalDays() { return totalDays; }
    public void setTotalDays(int totalDays) { this.totalDays = totalDays; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public String getStatus() { return status; } // Updated getter
    public void setStatus(String status) { this.status = status; } // Updated setter
}