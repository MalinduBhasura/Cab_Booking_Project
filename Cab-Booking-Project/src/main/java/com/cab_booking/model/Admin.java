package com.cab_booking.model;


public class Admin {
    private String username;
    private String password;
    private int admin_id;

    public Admin(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    public int getadmin_id() {
        return admin_id;
    }

	
}