package com.cab_booking.model;

public class Driver {
    private int driverId;
    private String driverName;
    private String status;
    private String phone;
    private String address;

    // Getters and Setters
    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

	public double getChargePerDay() {
		// TODO Auto-generated method stub
		return 0;
	}

	public double getChargePerKm() {
		// TODO Auto-generated method stub
		return 0;
	}
}