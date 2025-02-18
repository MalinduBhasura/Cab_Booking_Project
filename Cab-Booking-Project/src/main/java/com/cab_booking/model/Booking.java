package com.cab_booking.model;

public class Booking {
    private int bookingId;
    private int carId;
    private String customerName;
    private String address;
    private String mobileNumber;
    private int days;
    private int km;

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getMobileNumber() { return mobileNumber; }
    public void setMobileNumber(String mobileNumber) { this.mobileNumber = mobileNumber; }

    public int getDays() { return days; }
    public void setDays(int days) { this.days = days; }

    public int getKm() { return km; }
    public void setKm(int km) { this.km = km; }
}