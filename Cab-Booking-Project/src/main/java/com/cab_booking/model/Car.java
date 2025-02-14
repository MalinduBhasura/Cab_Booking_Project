package com.cab_booking.model;



public class Car {
    private int carId;
    private String modelName;
    private String carPhoto; // Store the file path
    private String status;

    // Getters and Setters
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }

    public String getModelName() { return modelName; }
    public void setModelName(String modelName) { this.modelName = modelName; }

    public String getCarPhoto() { return carPhoto; }
    public void setCarPhoto(String carPhoto) { this.carPhoto = carPhoto; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
