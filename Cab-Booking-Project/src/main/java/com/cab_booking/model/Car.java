package com.cab_booking.model;

//Car.java
public class Car {
    private int carId;
    private String carName;
    private String numberPlate;
    private double acFarePerKm;
    private double nonAcFarePerKm;
    private double acFarePerDay;
    private double nonAcFarePerDay;
    private String carPhoto;
    private String status;

    // Getters and Setters
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }
    public String getCarName() { return carName; }
    public void setCarName(String carName) { this.carName = carName; }
    public String getNumberPlate() { return numberPlate; }
    public void setNumberPlate(String numberPlate) { this.numberPlate = numberPlate; }
    public double getAcFarePerKm() { return acFarePerKm; }
    public void setAcFarePerKm(double acFarePerKm) { this.acFarePerKm = acFarePerKm; }
    public double getNonAcFarePerKm() { return nonAcFarePerKm; }
    public void setNonAcFarePerKm(double nonAcFarePerKm) { this.nonAcFarePerKm = nonAcFarePerKm; }
    public double getAcFarePerDay() { return acFarePerDay; }
    public void setAcFarePerDay(double acFarePerDay) { this.acFarePerDay = acFarePerDay; }
    public double getNonAcFarePerDay() { return nonAcFarePerDay; }
    public void setNonAcFarePerDay(double nonAcFarePerDay) { this.nonAcFarePerDay = nonAcFarePerDay; }
    public String getCarPhoto() { return carPhoto; }
    public void setCarPhoto(String carPhoto) { this.carPhoto = carPhoto; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}